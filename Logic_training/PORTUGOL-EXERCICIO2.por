programa
{
	inclua biblioteca Matematica --> mat	
	funcao inicio()
	{
		/*Variable creation*/
		cadeia nome
		cadeia func
		real salario
		real alterado

		/*Input*/
		escreva("Introduza nome do funcionário: ")
		leia(nome)
		escreva("Introduza a função do funcionário: ")
		leia(func)
		escreva("Introduza o salário do funcionário (€): ")
		leia(salario)

		/*Processing*/
		alterado = mat.arredondar((salario * 1.15), 2)

		/*Output*/
		limpa()
		escreva("*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-")
		escreva("\nNome do funcionário : ", nome)
		escreva("\nFunção              : ", func)
		escreva("\nSalário base        : ", salario, " €")
		escreva("\nSalário alterado    : ", alterado, " €")
		escreva("\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-")
	}    
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 444; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */