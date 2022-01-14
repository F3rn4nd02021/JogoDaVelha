programa
{
	caracter jogo[3][3]
	cadeia jogadores[2]
	inteiro l, c, linha, coluna, jogador, ganhou, jogadas, opcao

	funcao inicializarVariaveis() {
		// Inicializa todas as variáveis
		jogadores[0] = ""
		jogadores[1] = ""
		
		linha = 0
		coluna = 0
		jogador = 0
		ganhou = -1
		jogadas = 0
		opcao = 0
		
		// Loops para inicializar a Matriz com valores default
		para(l = 0; l < 3; l++){
			para(c = 0; c < 3; c++){
				jogo[l][c] = ' '
			}
		}
	}

	funcao renderizarTabuleiro() {
		// Cria identificação das colunas
		escreva("C0   C1   C2\n\n")

		// Cria identificação das linhas e imprime o tabuleiro
		para(l = 0; l < 3; l++){
			
			para(c = 0; c < 3; c++){
				
				escreva(" ", jogo[l][c])
				
				se(c < 2)
					escreva(" | ")
				se(c == 2)
					escreva("   L", l)
			}
			
			se (l < 2)
				escreva("\n-------------\n")
		}
	}
	
	funcao inicio(){

		// Loop para repetir o jogo se Opção = 1
		faca{
			limpa()
			
			inicializarVariaveis()

			// Coleta Nome dos Jogadores
			escreva("Informe o nome do Primeiro Jogador:\n")
			leia(jogadores[0])
			escreva("Informe o nome do Segundo Jogador:\n")
			leia(jogadores[1])
			
			limpa()

			// Mensagem de boas vindas					
			escreva("BEM VINDOS JOGADORES: ", jogadores[0], " VS ",  jogadores[1], "\n")

			// CORE - Loop para jogo rodar enquanto nenhum jogador ganhar ou finalizar com Velha
			faca{
				renderizarTabuleiro()

				// Loop para quando o jogador escolher uma linha e coluna já jogada
				faca{
					
					// loop para quando o jogador escolhe uma linha/coluna que não esta entre 0 e 2 
					faca{
						// Tratamento para erro quando escolhe uma linha/coluna que não esta entre 0 e 2 
						se(linha < 0 ou linha > 2 ou coluna < 0 ou coluna > 2){
							limpa()
							
							renderizarTabuleiro()
							
							escreva("\n\nAtenção!! Não é possível fazer esta jogada: L", linha, " C", coluna)
						}

						// Mostra como vai marcar no tabuleiro: 0 > O ou 1 > X
						se(jogador == 0)
							escreva("\n\nO - ")
						senao
							escreva("\n\nX - ")
							
						// Informa qual jogador vai jogar.
						escreva("[ Jogador ", jogadores[jogador], " ] digite a linha(L) e coluna(C) da posição desejada\n")
						
						escreva("L")
						leia(linha)
						
						escreva("C")
						leia(coluna)
						
					}enquanto(linha < 0 ou linha > 2 ou coluna < 0 ou coluna > 2)
					
					limpa()
					
					escreva("Última jogada do Jogador ", jogadores[jogador], ": L", linha, " C", coluna, "\n")
					
					// Tratamento para erro quando escolhido uma linha e coluna que ja foi escolhido
					se(jogo[linha][coluna] != ' ') {
						escreva("Atenção!! Não é possível fazer esta jogada: L", linha, " C", coluna, "\n")
						renderizarTabuleiro()
					}
						
				}enquanto(jogo[linha][coluna] != ' ')
				
				// Verifica qual jogador esta jogando e marca no tabuleiro > Matriz Jogo
				se(jogador == 0){
					jogo[linha][coluna] = 'O'
					jogador = 1
				}
				senao{
					jogo[linha][coluna] = 'X'
					jogador = 0
				}
				// Encrementa a quantidade de jogadas com + 1
				jogadas++

				// Define se algum jogador ganhou
				// Jogador 0 ganhou na horizontal
				para(l = 0; l < 3; l++){
					se(jogo[l][0] == 'O' e jogo[l][1] == 'O' e jogo[l][2] =='O')
						ganhou = 0 
				}
				// Jogador 1 ganhou na horizontal
				para(l = 0; l < 3; l++){
					se(jogo[l][0] == 'X' e jogo[l][1] == 'X' e jogo[l][2] =='X')
						ganhou = 1
				}
				// Jogador 0 ganhou na vestical
				para(c = 0; c < 3; c++){
					se(jogo[0][c] == 'O' e jogo[1][c] == 'O' e jogo[2][c] =='O')
						ganhou = 0
				}
				// Jogador 1 ganhou na vestical
				para(c = 0; c < 3; c++){
					se(jogo[0][c] == 'X' e jogo[1][c] == 'X' e jogo[2][c] =='X')
						ganhou = 1
				}

				// Jogador 0 ganhou na diagonal esqueda para direita
				se(jogo[0][0] == 'O' e jogo[1][1] == 'O' e jogo[2][2] == 'O')
					ganhou = 0

				// Jogador 1 ganhou na diagonal esqueda para direita
				se(jogo[0][0] == 'X' e jogo[1][1] == 'X' e jogo[2][2] == 'X')
					ganhou = 1

				// Jogador 0 ganhou na diagonal direita para esquerda
				se(jogo[0][2] == 'O' e jogo[1][1] == 'O' e jogo[2][0] == 'O')
					ganhou = 0

				// Jogador 1 ganhou na diagonal direita para esquerda
				se(jogo[0][2] == 'X' e jogo[1][1] == 'X' e jogo[2][0] == 'X')
					ganhou = 1
			
			}enquanto(ganhou == -1 e jogadas < 9)

			renderizarTabuleiro()

			// Verifica se há ganhador
			se (ganhou != -1)
				escreva("\n\n\n[ Parabéns Jogador ", jogadores[ganhou], ". Voce ganhou!! ]")
			senao
				escreva("\n\n\n[ O Jogo finalizou. Velhou!! ]")
	
			escreva("\n\nDigite 1 para jogar novamente ou outro valor para finalizar: \n")
			leia(opcao)
			
		} enquanto(opcao == 1)
		
	}
}	
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 921; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz;
 */