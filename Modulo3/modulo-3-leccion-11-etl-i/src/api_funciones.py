# %%
## 1. Conectarme a Spotify API (token)
import spotipy
from spotipy.oauth2 import SpotifyClientCredentials

#from dotenv import load_dotenv
#load_dotenv(); # Cargar las variables de entorno


# %%
from dotenv import dotenv_values
variables_entorno = dotenv_values(".env")
variables_entorno

# %%
def conectarASpotify(): 
    credenciales = SpotifyClientCredentials("5bdf73e3cd1c4a309794509483a7803e", "2899372a02e14f82898cdb39042627c0");
    sp = spotipy.Spotify(client_credentials_manager=credenciales)

    return sp
 
# %%
