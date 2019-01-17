Matthew Menten  - CSCI 4502
Braden Holmes   - CSCI 4502
Kieran Ng       - CSCI 4502
Tanner O’Rourke - CSCI 4502

Data Mining Final Project - Fall 2018


What's in the source code files:

	- clean_unique_tracks.py           --> Parses unique tracks text file (from million songs dataset) and removes redundant information so API searches are more successful
	- pull_song_data_from_spotify.py   --> Uses cleaned unique tracks text file to get the track id's from the spotify API, then puts the data in a .csv file
	- pull_song_data_fix.py            --> Semi-redundant. Gets release year of song from API and puts it in a better .csv file that can be parsed easier
										   The old .csv was separated with commas, which introduced inconsistencies since some songs had commas in the name
	- get_audio_features_db.py         --> Uses unique song ID's to pull audio feature data from the API and puts all the data in a sqlite database
	- TemporalGraphing_Braden.ipynb    --> Used to make 3d temporal graphs and linear regressions for attribute change
	- Kieren_Ng_spotify.ipynb          --> Attempt at apriori algorithm, not used in final report
	- Danceability_Classification.ipynb--> Used for logistic regression and knn classification on danceability
	- analysis_tanner.ipynb            --> k-means clustering, two trait temporal correlation graphs
	- datacleaning.sql                 --> Clean data from the database so we can use it nicely in python
	- datafacts.sql                    --> Gets facts/stats about our dataset


What's in the pictures:

	- temporal trends for various song features
	- correlation over time between most interesting attribute pairs
	- analysis of danceability classification probabilities


Key Findings throughout the project (also in final report):

	Our key methods for analyzing the data were making graphs, both in two and three dimensions. These graphs helped to visualize how different trends changed over time, which was one of
	the main goals of our project. We used k-means clustering for 5-year time spans to find low, medium and high cluster points for various attributes in our data over time. This allowed
	us to get a more detailed evaluation of how features changed over time than simply using the mean of a feature over the years. Logistic regression and K-nearest neighbors
	classification was also an important method we used to draw knowledge from our dataset.

	Some key findings from the graphing stage is the discovery of most common keys and tempos. It seems likely that all keys and tempos would have had a roughly equal representation, but
	instead we found that there were some groups that were much more likely than others. Interestingly, they distribution of keys followed notes from the C-major scale. Tempos around 100
	bpm are by far the most common.

	We also discovered that changes in the energy and acousticness of songs, combined with decreased correlations between tempo and valence, support preconceived notions that in recent
	years, 4-beat rock-n-roll style songs, which show heavy correlations between tempo and valence, are being increasingly pushed out of the mainstream and replaced by electronically
	produced songs of varying tempos.

	Our project also found the important attributes for prediction a song’s danceability. We found that six features, namely time signature, energy, speechiness, acousticness, liveness and
	valence can predict the danceability with an accuracy of over 70%. 
