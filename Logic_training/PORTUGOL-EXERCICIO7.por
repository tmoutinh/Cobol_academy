programa
{
	inclua biblioteca Matematica --> mat 
	/*VARIABLES*/
	cadeia 	nome
	inteiro	meses = 0
	real		valoraplic
	real		valorcorr
	real		taxa = 0.0
	inteiro	contador
	
	funcao inicio()
	{
		entrada()
		se (meses >= 0 e taxa > 0.0)
			processamento()
		finalizar()
	}
	
	/*INPUT*/
	funcao entrada()
	{
		escreva("Introduza o seu nome                : ")
		leia(nome)
		escreva("Introduz o valor aplicado       (€) : ")
		leia(valoraplic)
		escreva("Introduz o número de meses a render : ")
		leia(meses)
		escreva("Introduz a taxa aplicada        (%) : ")
		leia(taxa)
		taxa = taxa / 100
		limpa()
	}

	/*PROCESSING*/
	funcao processamento()
	{
		valorcorr = valoraplic
		para(contador=1;contador<=meses;contador++)
			valorcorr = mat.arredondar(valorcorr * (1 + taxa),2)
		escrita()
		
	}

	funcao escrita ()
	{
		/*OUTPUT*/
		escreva("-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")
		escreva(" > O cliente : ", nome, "\n")
		escreva(" > Aplicou   : ", valoraplic, " €\n")
		escreva(" > Recebeu   : ", valorcorr, " €")
		escreva("\n-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")	
	}
	
	funcao finalizar()
	{
		escreva("---- FINALIZAÇÃO DE PROCESSAMENTO! ----\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 718; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */