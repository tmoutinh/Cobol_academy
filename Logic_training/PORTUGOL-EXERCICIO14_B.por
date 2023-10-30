programa
{
	inclua biblioteca Arquivos --> ar
	inclua biblioteca Texto --> txt
	/*VARIABLES*/
	logico	var_arq_existe = falso
	logico	var_encontrado = falso
	inteiro	var_arq_dados
	inteiro	var_linhalida = 1
	cadeia	caminho
	cadeia	linha = "l"
	cadeia	var_codigo
	cadeia	var_nome
	cadeia	var_email
	cadeia	var_cod_arq = "0000"
	

	funcao inicio()
	{
		iniciar()
		se (var_arq_existe)
		{
			processar()
			finalizar()
		}
	}
	
	/*INPUT*/
	funcao iniciar()
	{
		caminho = "C:\\CURSO_LOGICA\\DADOS\\DADOS.TXT"
		var_arq_existe = ar.arquivo_existe(caminho)
		se (var_arq_existe)
		{
			var_arq_dados = ar.abrir_arquivo(caminho, ar.MODO_LEITURA)
			escreva("Arquivo ", var_arq_dados, " aberto !\n")
		}
		senao
			escreva("Arquivo não existe !\n")
	}

	funcao processar()
	{
		escreva("Codigo a procurar (0000) : ")
		leia(var_codigo)
		enquanto (nao ar.fim_arquivo(var_arq_dados))
		{
			linha = ar.ler_linha(var_arq_dados)
			var_linhalida = txt.numero_caracteres(linha)
			se(var_linhalida != 0)
			{
				var_cod_arq = txt.extrair_subtexto(linha,0,4)
				se (var_cod_arq == var_codigo)
				{
					var_encontrado = verdadeiro
					var_nome = txt.extrair_subtexto(linha,4,23)
					var_email = txt.extrair_subtexto(linha, 24, 42)
					escreva("CODIGO : ", var_cod_arq,"\n")
					escreva("NOME   : ", var_nome,"\n")
					escreva("EMAIL  : ", var_email,"\n")
				}
			}
		}
		se (var_encontrado == falso)
			escreva("Registo não encontrado!\n")
	}

	funcao finalizar()
	{
		escreva("Arquivo ", var_arq_dados, " fechado !")
		ar.fechar_arquivo(var_arq_dados)
		escreva("\n===== FINALIZA DE EXECUCAO! ====\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1330; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */