programa
{
	inclua biblioteca Arquivos --> ar
	inclua biblioteca Texto --> txt
	/*VARIABLES*/
	logico	var_arq_existe = falso
	inteiro	var_arq_dados
	inteiro	var_contador = 0
	inteiro	var_linhalida = 1
	cadeia	caminho
	cadeia	linha = "l"

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
		enquanto (nao ar.fim_arquivo(var_arq_dados))
		{
			linha = ar.ler_linha(var_arq_dados)
			var_linhalida = txt.numero_caracteres(linha)
			se (var_linhalida != 0)
			{
				escreva(linha, "\n")
				var_contador++
			}
		}
		escreva("Foram lidos ", var_contador, " registos\n")
	}

	funcao finalizar()
	{
		escreva("Arquivo ", var_arq_dados, " fechado !\n")
		ar.fechar_arquivo(var_arq_dados)
		escreva("\n===== FINALIZA DE EXECUCAO! ====\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 952; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */