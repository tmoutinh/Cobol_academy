programa
{
	inclua biblioteca Arquivos --> ar
	inclua biblioteca Texto --> txt
	inclua biblioteca Tipos --> tp
	/*VARIABLES*/
	logico	var_arq_existe = falso
	inteiro	var_arq_dados
	inteiro	var_arq_resul
	inteiro	var_contador = 0
	inteiro	var_linhalida = 1
	inteiro	var_acsalario = 0
	real		var_salario = 0.0
	real		var_salario_medio = 0.0
	cadeia	caminho
	cadeia	caminho_res
	cadeia	linha = "l"
	cadeia	output

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
		caminho_res = "C:\\CURSO_LOGICA\\DADOS\\RESULTADOS.TXT"
		var_arq_existe = ar.arquivo_existe(caminho)
		se (var_arq_existe)
		{
			var_arq_dados = ar.abrir_arquivo(caminho, ar.MODO_LEITURA)
			var_arq_resul = ar.abrir_arquivo(caminho_res, ar.MODO_ESCRITA)
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
				var_salario += tp.cadeia_para_real(txt.extrair_subtexto(linha, 42, 46))
				var_contador++
			}
		}
		var_salario_medio = var_salario / var_contador
		
		//Output para o file resultados
		output = ("Número de dados "+tp.inteiro_para_cadeia(var_contador, 10))
		escreva(output, "\n")
		ar.escrever_linha(output,  var_arq_resul)
		output = ("Salário total é "+tp.real_para_cadeia(var_salario))
		escreva(output, "\n")
		ar.escrever_linha(output, var_arq_resul)
		output = ("Salário médio é "+tp.real_para_cadeia(var_salario_medio))
		escreva(output, "\n")
		ar.escrever_linha(output, var_arq_resul)
	}

	funcao finalizar()
	{
		escreva("Arquivo ", var_arq_dados, " fechado !")
		escreva("Arquivo ", var_arq_resul, " fechado !")
		ar.fechar_arquivo(var_arq_dados)
		ar.fechar_arquivo(var_arq_resul)
		escreva("\n===== FINALIZA DE EXECUCAO! ====\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1249; 
 * @DOBRAMENTO-CODIGO = [19];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */