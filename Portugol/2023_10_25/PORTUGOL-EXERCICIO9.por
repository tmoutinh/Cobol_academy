programa
{
	/*VARIABLES*/
	real		boleto[4]
	real 	saldo
	inteiro	contador
	
	funcao inicio()
	{
		entrada()
		processamento()
		finalizar()		
	}
	
	/*INPUT*/
	funcao entrada()
	{
		escreva("Introduza o seu saldo (euros): ")
		leia(saldo)
		limpa()
	}

	/*PROCESSING*/
	funcao processamento()
	{
		escreva(" > O presente saldo é ", saldo, " euros \n\n")
		para(contador = 0;contador < 4;contador++)
		{
			escreva("Introduza o boleto ", contador + 1, " (euros): ")
			leia(boleto[contador])
			saldo = saldo - boleto[contador]
			se (saldo <= 0)
			{
				limpa()
				se (saldo == 0)
					escreva(" > Esgotou o Saldo!\n")
				senao
					escreva(" > Tem divida de ", saldo, " euros\n")
				retorne
			}
		}
		limpa()
		escrita()
	}

	/*OUTPUT*/
	funcao escrita()
	{
		escreva("\n-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")
		escreva(" > O saldo restante e ", saldo, " euros")
		escreva("\n-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")
	}
	
	funcao finalizar()
	{
		escreva("===== FINALIZA DE EXECUÇAO! ====\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 874; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */