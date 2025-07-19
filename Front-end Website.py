import pymongo
import streamlit as st
import pandas as pd
import plotly.express as px

# Initialize session state
if 'current_page' not in st.session_state:
    st.session_state.current_page = 'title'

# Page configuration
st.set_page_config(
    page_title="Boston Bruins Player Management System",
    page_icon="🏒",
    layout="wide"
)


# MongoDB connection
def init_mongo_connection():
    try:
        client = pymongo.MongoClient("mongodb+srv://jadhavsaurabh360:369123Broly@cluster0.dld3p.mongodb.net/")
        return client.BRUINS_DB
    except Exception as e:
        st.error(f"Failed to connect to MongoDB: {e}")
        return None


def load_table_data(collection_name):
    db = init_mongo_connection()
    if db is None:
        return pd.DataFrame()
    try:
        data = list(db[collection_name].find({}, {'_id': 0}))
        return pd.DataFrame(data)
    except Exception as e:
        st.error(f"Error loading {collection_name}: {str(e)}")
        return pd.DataFrame()


def create_performance_visualization(df, x_col, y_col, size_col=None, hover_col=None):
    if df.empty:
        st.warning("No data available for visualization")
        return
    try:
        hover_data = [hover_col] if hover_col else None
        fig = px.scatter(
            df, x=x_col, y=y_col, size=size_col, hover_data=hover_data,
            title=f"{y_col} vs {x_col}"
        )
        st.plotly_chart(fig)
    except Exception as e:
        st.warning(f"Could not create visualization: {str(e)}")


def players_page():
    st.title("Player Management")
    tab1, tab2 = st.tabs(["Player List", "Player Statistics"])

    players_df = load_table_data("Players")
    stats_df = load_table_data("Seasonplayerstats")

    with tab1:
        if not players_df.empty:
            st.dataframe(players_df)

        with st.form("add_player_form"):
            st.subheader("Add New Player")
            player_name = st.text_input("Player Name")
            jersey_number = st.number_input("Jersey Number", min_value=0, max_value=99)
            position_id = st.text_input("Position ID")
            height = st.text_input("Height")
            weight = st.number_input("Weight", min_value=0)
            shoots = st.text_input("Shoots (L/R)")
            birthplace = st.text_input("Birthplace")

            if st.form_submit_button("Add Player"):
                if not player_name:
                    st.error("Player name is required")
                else:
                    db = init_mongo_connection()
                    if db is not None:
                        try:
                            new_player = {
                                "PlayerName": player_name,
                                "JerseyNumber": jersey_number,
                                "PositionID": position_id,
                                "Height": height,
                                "Weight": weight,
                                "Shoots": shoots,
                                "Birthplace": birthplace
                            }
                            result = db.Players.insert_one(new_player)
                            if result.inserted_id:
                                st.success("Player added successfully!")
                                st.rerun()
                        except Exception as e:
                            st.error(f"Error adding player: {e}")

    with tab2:
        if not stats_df.empty:
            st.dataframe(stats_df)
            create_performance_visualization(
                stats_df,
                x_col='Goals',
                y_col='Assists',
                size_col='Points',
                hover_col='PlayerName'
            )


def teams_page():
    st.title("Teams")
    teams_df = load_table_data("Teams")

    tab1, tab2 = st.tabs(["Team List", "Add Team"])

    with tab1:
        if not teams_df.empty:
            st.dataframe(teams_df)

    with tab2:
        with st.form("add_team_form"):
            team_name = st.text_input("Team Name")
            city = st.text_input("City")
            conference = st.selectbox("Conference", ["Eastern", "Western"])

            if st.form_submit_button("Add Team"):
                if team_name:
                    db = init_mongo_connection()
                    if db is not None:
                        try:
                            db.Teams.insert_one({
                                "TeamName": team_name,
                                "City": city,
                                "Conference": conference
                            })
                            st.success("Team added successfully!")
                            st.rerun()
                        except Exception as e:
                            st.error(f"Error adding team: {e}")


def games_page():
    st.title("Games")
    games_df = load_table_data("Games")

    tab1, tab2 = st.tabs(["Game Schedule", "Add Game"])

    with tab1:
        if not games_df.empty:
            col1, col2 = st.columns(2)
            with col1:
                st.metric("Wins", len(games_df[games_df['Result'] == 1]))
            with col2:
                st.metric("Losses", len(games_df[games_df['Result'] == 0]))
            st.dataframe(games_df)

    with tab2:
        with st.form("add_game_form"):
            date = st.date_input("Game Date")
            opponent = st.text_input("Opponent")
            home_away = st.selectbox("Home/Away", ["Home", "Away"])
            bruins_score = st.number_input("Bruins Score", min_value=0)
            opponent_score = st.number_input("Opponent Score", min_value=0)

            if st.form_submit_button("Add Game"):
                if opponent:
                    db = init_mongo_connection()
                    if db is not None:
                        try:
                            db.Games.insert_one({
                                "Date": date.strftime("%Y-%m-%d"),
                                "Opponent": opponent,
                                "HomeAway": home_away,
                                "BruinsScore": bruins_score,
                                "OpponentScore": opponent_score,
                                "Result": 1 if bruins_score > opponent_score else 0
                            })
                            st.success("Game added successfully!")
                            st.rerun()
                        except Exception as e:
                            st.error(f"Error adding game: {e}")


def statistics_page():
    st.title("Statistics")
    player_stats_df = load_table_data("Seasonplayerstats")
    goalie_stats_df = load_table_data("Seasongoaliestats")

    tab1, tab2, tab3 = st.tabs(["Team Overview", "Player Statistics", "Goalie Statistics"])

    with tab1:
        if not player_stats_df.empty:
            col1, col2, col3, col4 = st.columns(4)
            with col1:
                st.metric("Total Goals", player_stats_df['Goals'].sum())
            with col2:
                st.metric("Total Points", player_stats_df['Points'].sum())
            with col3:
                st.metric("Power Play Goals", player_stats_df['PowerPlayGoals'].sum())
            with col4:
                st.metric("Game Winning Goals", player_stats_df['GameWinningGoals'].sum())

    with tab2:
        if not player_stats_df.empty:
            st.dataframe(player_stats_df)
            create_performance_visualization(
                player_stats_df,
                x_col='Goals',
                y_col='Assists',
                size_col='Points',
                hover_col='PlayerName'
            )

    with tab3:
        if not goalie_stats_df.empty:
            st.dataframe(goalie_stats_df)


def roster_page():
    st.title("Roster")
    roster_df = load_table_data("Roster")

    if not roster_df.empty:
        st.dataframe(roster_df)

        with st.form("update_roster_form"):
            st.subheader("Update Roster")
            player_id = st.number_input("Player ID", min_value=1)
            position = st.selectbox("Position", ["Forward", "Defense", "Goalie"])

            if st.form_submit_button("Update Roster"):
                db = init_mongo_connection()
                if db is not None:
                    try:
                        db.Roster.update_one(
                            {"PlayerID": player_id},
                            {"$set": {"Position": position}}
                        )
                        st.success("Roster updated successfully!")
                        st.rerun()
                    except Exception as e:
                        st.error(f"Error updating roster: {e}")


def coaching_staff_page():
    st.title("Coaching Staff")
    coaches_df = load_table_data("Coach")

    if not coaches_df.empty:
        st.dataframe(coaches_df)

        with st.form("add_coach_form"):
            st.subheader("Add Coach")
            coach_name = st.text_input("Coach Name")
            position = st.selectbox("Position", ["Head Coach", "Assistant Coach", "Goalie Coach"])

            if st.form_submit_button("Add Coach"):
                if coach_name:
                    db = init_mongo_connection()
                    if db is not None:
                        try:
                            db.Coach.insert_one({
                                "CoachName": coach_name,
                                "Position": position
                            })
                            st.success("Coach added successfully!")
                            st.rerun()
                        except Exception as e:
                            st.error(f"Error adding coach: {e}")


def fitness_metrics_page():
    st.title("Fitness Metrics")
    fitness_df = load_table_data("Fitness_Metrics")

    if not fitness_df.empty:
        st.dataframe(fitness_df)

        with st.form("add_metrics_form"):
            st.subheader("Add Metrics")
            player_id = st.number_input("Player ID", min_value=1)
            endurance = st.number_input("Endurance (minutes)", min_value=0)
            speed = st.number_input("Speed (km/h)", min_value=0)

            if st.form_submit_button("Add Metrics"):
                db = init_mongo_connection()
                if db is not None:
                    try:
                        db.Fitness_Metrics.insert_one({
                            "PlayerID": player_id,
                            "Endurance": endurance,
                            "Speed": speed
                        })
                        st.success("Metrics added successfully!")
                        st.rerun()
                    except Exception as e:
                        st.error(f"Error adding metrics: {e}")


def captains_page():
    st.title("Team Captains")
    captains_df = load_table_data("Captain")

    if not captains_df.empty:
        st.dataframe(captains_df)

        with st.form("update_captain_form"):
            st.subheader("Update Captain")
            player_id = st.number_input("Player ID", min_value=1)
            captain_type = st.selectbox("Captain Type", ["Captain", "Alternate"])

            if st.form_submit_button("Update Captain"):
                db = init_mongo_connection()
                if db is not None:
                    try:
                        db.Captain.update_one(
                            {"PlayerID": player_id},
                            {"$set": {"CaptainType": captain_type}}
                        )
                        st.success("Captain updated successfully!")
                        st.rerun()
                    except Exception as e:
                        st.error(f"Error updating captain: {e}")


def main():
    if st.session_state.current_page == 'title':
        st.title("Boston Bruins Player Management System 🏒")
        st.write("---")
        col1, col2, col3 = st.columns([1, 2, 1])
        with col2:
            st.image("Boston-Bruins-logo.png", width=300)
        if st.button("Enter System"):
            st.session_state.current_page = 'main'
            st.rerun()
    else:
        st.sidebar.title("Navigation")
        page = st.sidebar.selectbox(
            "Select a page",
            ["Players", "Teams", "Games", "Statistics", "Roster", "Coaching Staff", "Fitness Metrics", "Captains"]
        )

        if page == "Players":
            players_page()
        elif page == "Teams":
            teams_page()
        elif page == "Games":
            games_page()
        elif page == "Statistics":
            statistics_page()
        elif page == "Roster":
            roster_page()
        elif page == "Coaching Staff":
            coaching_staff_page()
        elif page == "Fitness Metrics":
            fitness_metrics_page()
        elif page == "Captains":
            captains_page()


if __name__ == "__main__":
    main()