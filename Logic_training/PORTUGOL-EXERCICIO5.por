programa
{
	inclua biblioteca Texto --> txt
	inclua biblioteca Matematica --> mat
	funcao inicio()
	{
		/*VARIABLES*/
		cadeia	produto
		real		valor
		real		frete
		cadeia	regiao

		/*INPUT*/
		escreva("Introduza o nome do produto : ")
		leia(produto)
		escreva("Introduza o valor (€) : ")
		leia(valor)
		escreva("Introduza a região de entrega : ")
		leia(regiao)

		/*PROCESSING*/
		regiao = txt.caixa_alta(regiao)
		se (regiao == "Porto")
			frete = 0.00
		senao
			frete = mat.arredondar((valor * 0.1), 2)

		/*OUTPUT*/
		limpa()
		escreva("-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")
		escreva(" > O produto é      : ", produto, "\n")
		escreva(" > Custou	    : ", valor, " €\n")
		escreva(" > Teve um frete de : ", frete, " €\n")
		escreva(" > Região de envio  : ", regiao)
		escreva("\n-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 545; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */