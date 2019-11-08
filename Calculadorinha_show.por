programa {
	funcao menu() {
	    escreva("0- Sair\n")
	    escreva("1- Soma\n")
	    escreva("2- Subtração\n")
	    escreva("3- Multiplicação\n")
	    escreva("4- Divisão\n")
	    escreva("Escolha a sua opção(número): ")
	}
	
	funcao inicio() {
	    	inteiro resp
	   	menu()
		leia(resp)
		enquanto(verdadeiro) {
		    se (resp == 0){
		        escreva("Até mais!\n")
		        retorne
		    }
		    senao se (resp > 4){
		        escreva("Valor inválido, Tchau!\n")
		        retorne
		    }
		    inteiro A, B
		    escreva("Insira o valor de A: ")
		    leia(A)
		    escreva("Insira o valor de B: ")
		    leia(B)
		    escreva("\n")
		    se (resp == 1){
		        escreva("A soma de ", A, " com ", B, " = ", A+B, "\n")
		    }
		    senao se (resp == 2){
		        escreva("A subtração de ", A, " com ", B, " = ", A-B, "\n")
		    }
		    senao se (resp == 3){
		        escreva("A multiplicação de ", A, " com ", B, " = ", A*B, "\n")
		    }
		    senao {
		        escreva("A divisão de ", A, " com ", B, " = ", A/B, "\n")
		    }
		    escreva("\n")
		    menu()
            leia(resp)
		}
		
		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 269; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */