

#test pull uri

import sys
from spotipy.oauth2 import SpotifyClientCredentials
import spotipy
import pprint
import csv


# uri = 'spotify:track:6I6NX6tjGsxFAsIfGzY9lJ' #J cole deja vu

client_id = "5dd9d9e3032745c9b5672da897eca6c8"
client_secret = "d31b6c98b28944fa92dcb19a29dc0a9e"
# file = "subset_unique_tracks.txt"

client_credentials_manager = SpotifyClientCredentials(client_id=client_id, client_secret=client_secret)
sp = spotipy.Spotify(client_credentials_manager=client_credentials_manager)

with open("unique_tracks_clean.txt", 'r') as CLEAN_SONGS:

	with open("song_search_results.csv", mode = 'w') as RESULTS:

		writer = csv.writer(RESULTS)

		for line in CLEAN_SONGS:

			line = line.replace(" - ", " ")
			line = line.rstrip()

			# print(line)

			result = sp.search(line)

			# pprint.pprint(result)

			if not result['tracks']['items']:
				# print(">>> No Song Found")
				writer.writerow(["*NOT_FOUND*",line,"","",""])

			else:
				result = result['tracks']['items'][0]

				artists = list()

				for artist in result['artists']:
					artists.append(artist['name'])

				all_artists = "/".join(artists)

				song_name = result['name']

				duration_ms = result['duration_ms']

				explicit_bool = 0

				if result['explicit']:
					explicit_bool = 1

				track_uri = result['uri']

				writer.writerow([track_uri,song_name,all_artists,duration_ms,explicit_bool])

				# print("Song Name:", song_name)
				# print("Artist:", all_artists)
				# print("Duration in ms:", duration_ms)
				# print("Explicit:", explicit_bool)
				# print("Track URI:", track_uri)

	RESULTS.close()

CLEAN_SONGS.close()

# sample_response = {'tracks': {'href': 'https://api.spotify.com/v1/search?query=Faster+Pussycat+Silent+Night&type=track&offset=0&limit=10',
#             'items': [{'album': {'album_type': 'compilation',
#                                  'artists': [{'external_urls': {'spotify': 'https://open.spotify.com/artist/0LyfQWJT6nXafLPZqxe9Of'},
#                                               'href': 'https://api.spotify.com/v1/artists/0LyfQWJT6nXafLPZqxe9Of',
#                                               'id': '0LyfQWJT6nXafLPZqxe9Of',
#                                               'name': 'Various Artists',
#                                               'type': 'artist',
#                                               'uri': 'spotify:artist:0LyfQWJT6nXafLPZqxe9Of'}],
#                                  'available_markets': ['CA', 'US'],
#                                  'external_urls': {'spotify': 'https://open.spotify.com/album/0wA8kXmYc5DRmcJXYQ49G8'},
#                                  'href': 'https://api.spotify.com/v1/albums/0wA8kXmYc5DRmcJXYQ49G8',
#                                  'id': '0wA8kXmYc5DRmcJXYQ49G8',
#                                  'images': [{'height': 640,
#                                              'url': 'https://i.scdn.co/image/efad516fc47f74af33d29cd8048d9aa6d60c93ff',
#                                              'width': 640},
#                                             {'height': 300,
#                                              'url': 'https://i.scdn.co/image/fde163295ecb1240415bf0c7d13a0d92a7886805',
#                                              'width': 300},
#                                             {'height': 64,
#                                              'url': 'https://i.scdn.co/image/c32a0f10c0653f8f85df1981dfa475446f7f8cc8',
#                                              'width': 64}],
#                                  'name': 'Monster Ballads X-Mas',
#                                  'release_date': '2007-09-11',
#                                  'release_date_precision': 'day',
#                                  'total_tracks': 15,
#                                  'type': 'album',
#                                  'uri': 'spotify:album:0wA8kXmYc5DRmcJXYQ49G8'},
#                        'artists': [{'external_urls': {'spotify': 'https://open.spotify.com/artist/1FwGBBwUviGVIeDIByO7u7'},
#                                     'href': 'https://api.spotify.com/v1/artists/1FwGBBwUviGVIeDIByO7u7',
#                                     'id': '1FwGBBwUviGVIeDIByO7u7',
#                                     'name': 'Faster Pussycat',
#                                     'type': 'artist',
#                                     'uri': 'spotify:artist:1FwGBBwUviGVIeDIByO7u7'}],
#                        'available_markets': ['CA', 'US'],
#                        'disc_number': 1,
#                        'duration_ms': 253026,
#                        'explicit': False,
#                        'external_ids': {'isrc': 'USRZR0715611'},
#                        'external_urls': {'spotify': 'https://open.spotify.com/track/3ZqUZpeWJ4norA5nvrE98c'},
#                        'href': 'https://api.spotify.com/v1/tracks/3ZqUZpeWJ4norA5nvrE98c',
#                        'id': '3ZqUZpeWJ4norA5nvrE98c',
#                        'is_local': False,
#                        'name': 'Silent Night',
#                        'popularity': 2,
#                        'preview_url': None,
#                        'track_number': 11,
#                        'type': 'track',
#                        'uri': 'spotify:track:3ZqUZpeWJ4norA5nvrE98c'},
#                       {'album': {'album_type': 'compilation',
#                                  'artists': [{'external_urls': {'spotify': 'https://open.spotify.com/artist/0LyfQWJT6nXafLPZqxe9Of'},
#                                               'href': 'https://api.spotify.com/v1/artists/0LyfQWJT6nXafLPZqxe9Of',
#                                               'id': '0LyfQWJT6nXafLPZqxe9Of',
#                                               'name': 'Various Artists',
#                                               'type': 'artist',
#                                               'uri': 'spotify:artist:0LyfQWJT6nXafLPZqxe9Of'}],
#                                  'available_markets': ['CA', 'US'],
#                                  'external_urls': {'spotify': 'https://open.spotify.com/album/4XNyEJUjTAR86BYt3DPoZ6'},
#                                  'href': 'https://api.spotify.com/v1/albums/4XNyEJUjTAR86BYt3DPoZ6',
#                                  'id': '4XNyEJUjTAR86BYt3DPoZ6',
#                                  'images': [{'height': 640,
#                                              'url': 'https://i.scdn.co/image/ed3b419d4f1abb22496bd849c7728a5e762f6a77',
#                                              'width': 640},
#                                             {'height': 300,
#                                              'url': 'https://i.scdn.co/image/0ec49ed975970fb8689b5f187a2a42e930f34665',
#                                              'width': 300},
#                                             {'height': 64,
#                                              'url': 'https://i.scdn.co/image/076bc9d5639edbcbf8afb17b26d094ad94632229',
#                                              'width': 64}],
#                                  'name': 'We Wish You A Hairy Christmas',
#                                  'release_date': '2007-10-09',
#                                  'release_date_precision': 'day',
#                                  'total_tracks': 11,
#                                  'type': 'album',
#                                  'uri': 'spotify:album:4XNyEJUjTAR86BYt3DPoZ6'},
#                        'artists': [{'external_urls': {'spotify': 'https://open.spotify.com/artist/7n9hNz35jsg1KclNjMjSDV'},
#                                     'href': 'https://api.spotify.com/v1/artists/7n9hNz35jsg1KclNjMjSDV',
#                                     'id': '7n9hNz35jsg1KclNjMjSDV',
#                                     'name': 'Faster Pussycat ...',
#                                     'type': 'artist',
#                                     'uri': 'spotify:artist:7n9hNz35jsg1KclNjMjSDV'}],
#                        'available_markets': ['CA', 'US'],
#                        'disc_number': 1,
#                        'duration_ms': 251893,
#                        'explicit': False,
#                        'external_ids': {'isrc': 'USKO10408626'},
#                        'external_urls': {'spotify': 'https://open.spotify.com/track/6C6NoQuLWRHE3QjHUlhXuw'},
#                        'href': 'https://api.spotify.com/v1/tracks/6C6NoQuLWRHE3QjHUlhXuw',
#                        'id': '6C6NoQuLWRHE3QjHUlhXuw',
#                        'is_local': False,
#                        'name': 'Silent Night',
#                        'popularity': 0,
#                        'preview_url': 'https://p.scdn.co/mp3-preview/bd62222e5ab5ef96c8908bcde148e1160a60e63a?cid=5dd9d9e3032745c9b5672da897eca6c8',
#                        'track_number': 11,
#                        'type': 'track',
#                        'uri': 'spotify:track:6C6NoQuLWRHE3QjHUlhXuw'}],
#             'limit': 10,
#             'next': None,
#             'offset': 0,
#             'previous': None,
#             'total': 2}}

# pprint.pprint(sample_response['tracks']['items'][0]['artists'][0]['name'])
# pprint.pprint(sample_response['tracks']['items'][0]['name'])
# pprint.pprint(sample_response['tracks']['items'][0]['duration_ms'])
# pprint.pprint(sample_response['tracks']['items'][0]['explicit'])
# pprint.pprint(sample_response['tracks']['items'][0]['uri'])
