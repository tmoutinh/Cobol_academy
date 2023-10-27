programa
{
	inclua biblioteca Matematica --> mat
	funcao inicio()
	{
		/*VARIABLES*/
		cadeia	nome
		real 	altura
		real 	peso
		real 	imc
		
		/*INPUT*/
		escreva("Introduza seu nome       : ")
		leia(nome)
		escreva("Introduza o peso  (em kg): ")
		leia(peso)
		escreva("Introduza a altura (em m): ")
		leia(altura)
		
		/*PROCESSING*/
		imc = mat.arredondar((peso / (altura * altura)), 2)

		/*OUTPUT*/
		limpa()
		escreva("-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")
		escreva(" > Seu IMC é           : ", imc, "\n")
		escreva(" > Está na faixa       : ")
		se (imc < 18.5)
			escreva("Abaixo do peso")
		se (imc >= 18.5 e imc <= 24.9)
			escreva("Peso normal")
		se (imc >= 25 e imc <= 29.9) 
			escreva("Sobrepeso")
		se (imc >= 30)
			escreva("Obesidade")
		escreva("\n-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 385; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */