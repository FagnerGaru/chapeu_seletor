dofile("trata_dados.lua")

saudacao = function()
  print("Olá, jovem! Aí está você! Vamos, vamos! Apresse-se, ainda há muitos alunos para fazer o teste! Suba aqui e deixe que o Chapéu Seletor nos diga a qual casa você pertence. Ele irá ler seus pensamentos e sentimentos mais profundos para decidir para onde você irá. Vamos começar?\n")

  -- Defina o tempo limite em segundos (30 segundos)
  local tempoLimite = 3

  -- Defina a função para ler a entrada do usuário com timeout
  local function lerComTimeout()
    local tempoInicio = os.time()
    local entradaUsuario = io.read("*l")

    while entradaUsuario == nil and os.time() - tempoInicio < tempoLimite do
      entradaUsuario = io.read("*l")
    end

    return entradaUsuario
  end

  local interacao = lerComTimeout()

  if interacao == nil then
    print("Ora, meu caro, eu ainda não posso ler sua mente! \n Pelas barbas de Merlyn, me diga algo para continuarmos!\n")
  else

    pergunta1()
  end
end

pergunta1 = function()
  print("\nVocê vê um filhote de Acromântula andando pelos corredores da escola, o que você faz?\n\n" ..
    "1. Chama o monitor da sua casa para decidir o que fazer com a criatura.\n" ..
    "2. Alimenta ele e leva para seu dormitório, afinal é uma criatura adorável.\n" ..
    "3. Sai gritando por ajuda, afinal alguém tem que se livrar desse monstro nojento.\n" ..
    "4. Atrairia a criatura para a casa do Hagrid sem contar para ninguém.\n\n "

  )
  local resposta1 = io.read()
  if resposta1 then
    local opcao = tratamento(resposta1)
    print(opcao)
  else
    print("Não funcionou")
  end
end


saudacao()
