import std/[httpclient, json]
var client = newHttpClient()


# Conseguir frase del servidor
let frase = client.getContent("https://frases.atico.eu.org/.json").parseJson()


# Autor
var autor: string
case frase["autor"].kind:
  of JString: autor = frase["autor"].getStr()
  else: autor = "Anónimo"


# Generar respuesta
echo "20 text/gemini\r\n"
echo "# Las Frases\n"
echo "Una frase al azar para vo':\n"

echo "> \"" & frase["frase"].getStr() & "\"  -" & autor & "\n"

echo "=> Recargar	index.gmi\n"
echo "=> Sugerir	https://frases.atico.eu.org/sugerir)\n"
echo "=> API		api.gmi\n"
echo "=> Source		https://github.com/exitcas/frases-gemini\n"
echo "=> Las Frases	https://frases.atico.eu.org/\n\n"

echo "Made by ~lucas (exitcas)"
