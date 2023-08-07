retiraAcentos = function(str)
  local tableAcentos = {}
  tableAcentos["à"] = "a"
  tableAcentos["á"] = "a"
  tableAcentos["â"] = "a"
  tableAcentos["ã"] = "a"
  tableAcentos["ä"] = "a"
  tableAcentos["ç"] = "c"
  tableAcentos["è"] = "e"
  tableAcentos["é"] = "e"
  tableAcentos["ê"] = "e"
  tableAcentos["ë"] = "e"
  tableAcentos["ì"] = "i"
  tableAcentos["í"] = "i"
  tableAcentos["î"] = "i"
  tableAcentos["ï"] = "i"
  tableAcentos["ñ"] = "n"
  tableAcentos["ò"] = "o"
  tableAcentos["ó"] = "o"
  tableAcentos["ô"] = "o"
  tableAcentos["õ"] = "o"
  tableAcentos["ö"] = "o"
  tableAcentos["ù"] = "u"
  tableAcentos["ú"] = "u"
  tableAcentos["û"] = "u"
  tableAcentos["ü"] = "u"
  tableAcentos["ý"] = "y"
  tableAcentos["ÿ"] = "y"
  tableAcentos["À"] = "A"
  tableAcentos["Á"] = "A"
  tableAcentos["Â"] = "A"
  tableAcentos["Ã"] = "A"
  tableAcentos["Ä"] = "A"
  tableAcentos["Ç"] = "C"
  tableAcentos["È"] = "E"
  tableAcentos["É"] = "E"
  tableAcentos["Ê"] = "E"
  tableAcentos["Ë"] = "E"
  tableAcentos["Ì"] = "I"
  tableAcentos["Í"] = "I"
  tableAcentos["Î"] = "I"
  tableAcentos["Ï"] = "I"
  tableAcentos["Ñ"] = "N"
  tableAcentos["Ò"] = "O"
  tableAcentos["Ó"] = "O"
  tableAcentos["Ô"] = "O"
  tableAcentos["Õ"] = "O"
  tableAcentos["Ö"] = "O"
  tableAcentos["Ù"] = "U"
  tableAcentos["Ú"] = "U"
  tableAcentos["Û"] = "U"
  tableAcentos["Ü"] = "U"
  tableAcentos["Ý"] = "Y"

  local novaString = ""
  --Função iteradora que retornrá a captura sobre sequências UTF-8 (http://lua-users.org/wiki/LuaUnicode) na string str
  for strChar in string.gmatch(str, "([%z\1-\127\194-\244][\128-\191]*)") do
    if tableAcentos[strChar] ~= nil then
      novaString = novaString .. tableAcentos[strChar]
    else
      novaString = novaString .. strChar
    end
  end
  return novaString
end

tratamento = function(opcao)
  local sem_acentos = retiraAcentos(opcao)
  local retira_pontos = string.gsub(sem_acentos, "%.", "")
  local parte = string.upper(retira_pontos)

  local lista_frase = {}
  for w in string.gmatch(parte, "[%u]+") do
    table.insert(lista_frase, w)
  end

  local lista_parte = {
    "A",
    "DECIDI",
    "CHAMA",
    "MONITO",

    "B",
    "ALIMENT",
    "DORMITORIO",
    "ADORAVEL",

    "C",
    "GRIT",
    "LIVRA",
    "ALGUEM",
    "MOSTRO",
    "NOJENTO",

    "D",
    "ATRAI",
    "HAGRID",
    "NINGUEM",
    "CONTA"
  }

  local lista_palavra = {

    ["A"] = "CORVINAL",
    ["DECIDI"] = "CORVINAL",
    ["CHAMA"] = "CORVINAL",
    ["MONITO"] = "CORVINAL",

    ["B"] = "LUFALUFA",
    ["ALIMENT"] = "LUFALUFA",
    ["DORMITORIO"] = "LUFALUFA",
    ["ADORAVEL"] = "LUFALUFA",

    ["C"] = "SONSERINA",
    ["GRIT"] = "SONSERINA",
    ["LIVRA"] = "SONSERINA",
    ["ALGUEM"] = "SONSERINA",
    ["MOSTRO"] = "SONSERINA",
    ["NOJENTO"] = "SONSERINA",

    ["D"] = "GRIFINORIA",
    ["ATRAI"] = "GRIFINORIA",
    ["HAGRID"] = "GRIFINORIA",
    ["NINGUEM"] = "GRIFINORIA",
    ["CONTA"] = "GRIFINORIA"
  }

  for _, palavra_frase in ipairs(lista_frase) do
    for _, palavra_compara in ipairs(lista_parte) do
      local inicio, fim = string.find(palavra_frase, palavra_compara)

      if inicio then
        parte_encontrada = tostring(string.sub(palavra_frase, inicio, fim))
      end
    end
  end

  local palavra_encontrada = tostring(lista_palavra[parte_encontrada])
  return palavra_encontrada
end
