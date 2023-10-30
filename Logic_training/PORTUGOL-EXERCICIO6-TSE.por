programa
{
	inclua biblioteca Matematica --> mat
	
	/*VARIABLES*/
	cadeia	produto
	inteiro	regiao
	real		valor
	real		frete
	
	funcao inicio()
	{
		entrada()
		processar()
		finalizar()
	}

	/*INPUT*/
	funcao entrada()
	{
		escreva("Introduza o nome do produto : ")
		leia(produto)
		escreva("Introduza o valor (€) : ")
		leia(valor)
		limpa()
		escreva(" [1] = PORTO \n [2] = SALVO \n [3] = LISBOA\n")
		escreva("Introduza a região de entrega : ")
		leia(regiao)
	}
	
	/*PROCESSING*/
	funcao processar()
	{
		escolha (regiao)
		{
			caso 1:
				frete = 0.00
				pare
			caso 2:	
				frete = mat.arredondar((valor * 0.1), 2)
				pare
			caso 3:
				frete = mat.arredondar((valor * 0.15), 2)
				pare
			caso contrario :
				frete = -1.00
		}
		imprimir()
	}

	/*OUTPUT*/
	funcao imprimir()
	{
		limpa()
		escreva("-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")
		escreva(" > O produto é      : ", produto, "\n")
		escreva(" > Custou	    : ", valor, " €\n")
		se (frete == -1)
			escreva(" >    -----  REGIÃO INVÁLIDA  -----\n")
		senao
			escreva(" > Teve um frete de : ", frete, " €\n")
		escreva(" > Região de envio  : ", regiao)
		escreva("\n-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")
	}

	funcao finalizar()
	{
		escreva("FIM DE EXECUÇÃO!\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 758; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */