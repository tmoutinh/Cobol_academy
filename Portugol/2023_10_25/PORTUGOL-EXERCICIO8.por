programa
{
	/*VARIABLES*/
	caracter	var_continua = 'S'
	real		boleto = 0.0
	real		saldo = 0.0
	
	funcao inicio()
	{
		entrada()
		enquanto (var_continua == 'S')
			processamento()
		se (saldo > 0)
			escrita()
		finalizar()		
	}
	
	/*INPUT*/
	funcao entrada()
	{
		escreva("Introduza o seu saldo (euros): ")
		leia(saldo)
	}

	/*PROCESSING*/
	funcao processamento()
	{
		limpa()
		escreva(" > O presente Saldo e", saldo, " euros\n\n")
		escreva("Introduza o boletos (euros): ")
		leia (boleto)
		limpa()
		saldo = saldo - boleto
		se (saldo <= 0)
		{
			se (saldo == 0)
				escreva(" > Esgotou o Saldo!\n")
			senao
				escreva(" > Tem divida de ", saldo, " euros\n")
			var_continua = 'N'
			retorne
		}
		escreva(" > O presente Saldo e ", saldo, " euros\n\n")
		escreva(" [S] SIM \n [N] NAO \n")
		escreva("Quer introduzir outro boleto ?: ")
		leia(var_continua)
		
	}

	/*OUTPUT*/
	funcao escrita()
	{
		limpa()
		escreva("\n-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")
		escreva(" > O seu Saldo e ", saldo, " euros")
		escreva("\n-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")
	}
	
	funcao finalizar()
	{
		escreva("===== FINALIZACAO DE EXECUCAO! ====\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1141; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */