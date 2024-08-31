#%%
## 1. Conectarme a Spotify API (token)
## 2. Obtener una lista de canciones de una lista de reproduccion 
# 2.1 buscar lista de reproduccion
# 2.22 Obtener la lista de canciones
# 2.23 Obtener la informcion de cada cancion
## 3. Transformar la informacion de las canciones en un DataFrame
## 4. Guardar el DataFrame en un archivo CSV
## 5. Guardarlo en un bases de datos (MySQL)****


import pandas as pd
import api_funciones as funciones

## 1. Conectarme a Spotify API (token)
sp = funciones.conectarASpotify()
sp


## 2. Obtener una lista de canciones de una lista de reproduccion 
uri_playlist = "https://open.spotify.com/playlist/33aztfHeBVQqzSEuqtwe6O?si=b46a1923232f407f"
playlist_id = uri_playlist.split("/")[-1].split("?")[0]
playlist_id


# %%
canciones = sp.playlist_tracks(playlist_id)
all_songs = []
for cancion in canciones["items"]:
    all_songs.append(cancion["track"])
all_songs

# %%
## Limpieza de la informacion

basic_info = {
    "song": [],
    "artist": [],
    "uri_cancion": [],
    "uri_artista": []
}

for cancion in all_songs:
    basic_info["song"].append(cancion["name"])
    basic_info["artist"].append(cancion["artists"][0]["name"])
    basic_info["uri_cancion"].append(cancion["uri"])
    basic_info["uri_artista"].append(cancion["artists"][0]["uri"])

df_cancion = pd.DataFrame(basic_info)
df_cancion.head()

df_cancion.to_csv("canciones.csv", index=False)

# %%
