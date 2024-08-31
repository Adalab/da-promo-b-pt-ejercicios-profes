#%%
import pandas as pd

## Cargar el fichero CSV
df = pd.read_csv("canciones.csv")
df.head()
# %%

## 1 Conectarme a la base de datos
# 2. Crear la bases de datos con las tablas
## 3. Insertar los datos en las tablas
import mysql.connector

## 1 Crear la bases de datos
cnx = mysql.connector.connect(
    user="root", 
    password="",
    host="127.0.0.1"
)

cursor = cnx.cursor()
query_create_bd = "CREATE SCHEMA IF NOT EXISTS `spotify_test`"
cursor.execute(query_create_bd)
# %%
## 2 Crear las tablas
query_create_table_canciones = """
                CREATE TABLE IF NOT EXISTS `spotify_test`.`canciones` (
            `idcanciones` VARCHAR(100) NOT NULL,
            `nombre` VARCHAR(1024) NULL,
            PRIMARY KEY (`idcanciones`)) 
                """
cursor.execute(query_create_table_canciones)

# %%
## 3 Insertar los datos en las tablas
query_insertar_canciones = """ INSERT INTO `spotify_test`.`canciones` (`idcanciones`, `nombre`) VALUES (%s, %s)"""
# %%
## INSERTAR LISTA DE CANCIONES
datos_tabla_canciones = list(set(zip(df["uri_cancion"].values, df["song"].values)))
datos_tabla_canciones
# %%
cursor.execute(query_insertar_canciones, datos_tabla_canciones)
cnx.commit()
# %%
