programa {

  inclua biblioteca Util
  inclua biblioteca Texto

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  funcao inicio() {

    escreva("\n-----------------------------------------------\n")
    escreva("\nBem vindo(a) ao PortuPrivate\n")
    escreva("\n-----------------------------------------------\n")
    Util.aguarde(2000)

    caracter selecionar
    
    faca{
      
      faca {

        escreva("\nQual acao deseja realizar?\n\n")
        escreva("[1] GERAR CHAVE\n[2] ENCRIPTAR MENSAGEM \n[3] DECRIPTAR MENSAGEM\n[0] FECHAR PROGRAMA\n\n")
        leia(selecionar)

        se (selecionar!='0' e selecionar!='1' e selecionar!='2' e selecionar!='3'){

          escreva("\n-----------------------------------------------")
          escreva("\nSELECAO INVALIDA: TENTE NOVAMENTE\n")
          escreva("-----------------------------------------------\n")

        }

      } enquanto (selecionar!='0' e selecionar!='1' e selecionar!='2' e selecionar!='3')

      se (selecionar=='1'){

        gerar_chave()

      }

      se (selecionar=='2'){

        encriptar_mensagem()

      }

      se (selecionar == '3'){

        decriptar_mensagem()

      }

      se (selecionar != '0'){

        faca {

          escreva("\nDeseja realizar mais alguma acao?\n\n[1]SIM [0]NAO: ")
          leia(selecionar)

          se (selecionar != '0' e selecionar != '1'){

            escreva("\n-----------------------------------------------")
            escreva("\nSELECAO INVALIDA: TENTE NOVAMENTE\n")
            escreva("-----------------------------------------------\n")

          }

        } enquanto (selecionar!='0' e selecionar!='1')

      }

    } enquanto (selecionar!='0')
    
    escreva("\n-----------------------------------------------\n")
    escreva("\nMuito obrigado por utilizar o PortuPrivate.\nVolte sempre!\n")
    escreva("\n-----------------------------------------------\n")
    Util.aguarde(2000)

  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  funcao gerar_chave() {

    escreva("\n(Sua chave esta sendo gerada. Aguarde...)\n")

    inteiro chave_encriptacao[2][2] //declaracao da matriz que ira receber os numeros para encriptacao da mensagem.
    inteiro determinante = 0        //variavel que recebera a determinante da matriz de encriptacao

    faca {

      faca {  

        para(inteiro i = 0; i < 2; i++) {
          para(inteiro j = 0; j < 2; j++){

            chave_encriptacao[i][j] = Util.sorteia(-24, 24) //numeros de cada posicao escolhidos aleatoriamente, entre -24 e 24

          }

        }
        
        determinante = (chave_encriptacao[0][0] * chave_encriptacao[1][1]) + (-1 * chave_encriptacao[0][1] * chave_encriptacao[1][0]) //calculando determinante da matriz gerada aleatoriamente

      } enquanto (determinante == 0) //se o determinante for igual a 0, o processo acima e feito novamente, ate resultar em determinante nao-nulo

    } enquanto (
        chave_encriptacao[0][0] % determinante != 0               //se o calculo da matriz inversa resultar em alguma posicao com numero nao
        ou chave_encriptacao[1][1] % determinante != 0            //inteiro, os processos acima sao feitos novamente, ate todos os numeros da  
        ou (chave_encriptacao[0][1] * (-1)) % determinante != 0   //matriz inversa serem inteiros. Desta forma, os calculos para encriptacao 
        ou (chave_encriptacao[1][0] * (-1)) % determinante != 0   //e decriptacao serao exatos, e nao realizarao aproximacoes.
      )
    
    escreva("\n-----------------------------------------------\n")
    escreva("COPIE SUA CHAVE: ")
    escreva("\n\n")

     para(inteiro i = 0; i < 2; i++) {
        para(inteiro j = 0; j < 2; j++){

          escreva("[", chave_encriptacao[i][j], "]") //mostra a chave de encriptacao ao usuario. Ele deve copiar para utilizar com seu interlocutor

        }

        escreva("\n")

      }
    
    escreva("\nCOMPARTILHE A CHAVE COM SEU DESTINATARIO DE MANEIRA SEGURA\n")
    escreva("-----------------------------------------------\n")

  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  funcao encriptar_mensagem(){
    
    inteiro chave_encriptacao[2][2] = {{1, 0}, {0, 1}}
    inteiro determinante = 0

    caracter chave_esta_correta = ' '
    
    faca {
      
      escreva("\n-----------------------------------------------\n")

      faca{
        
        escreva("\nINSIRA SUA CHAVE\n")
        escreva("\nVeja esta referencia para preencher a sua chave:\n\n")
        escreva("[1x1][1x2]\n[2x1][2x2]\n\n")

        para(inteiro i = 0; i<2; i++){
          para(inteiro j = 0; j<2; j++){

            escreva("Insira o numero na posicao ", i+1, "x", j+1, ": ")
            leia(chave_encriptacao[i][j])

          }
        }

        escreva("\n-----------------------------------------------\n")
        
        faca{

          escreva("\nConfirma a chave?\n\n")

          para(inteiro i = 0; i<2; i++){
            para(inteiro j = 0; j<2; j++){

              escreva("[", chave_encriptacao[i][j], "]")

            }

            escreva("\n")

          }

          escreva("\n[1]SIM [0]NAO: ")
          leia(chave_esta_correta)

          se (chave_esta_correta != '1' e chave_esta_correta!='0'){

            escreva("\n-----------------------------------------------")
            escreva("\nSELECAO INVALIDA: TENTE NOVAMENTE\n")
            escreva("-----------------------------------------------\n")

          }

        } enquanto (chave_esta_correta != '1' e chave_esta_correta != '0')

      } enquanto (chave_esta_correta != '1')

      determinante = (chave_encriptacao[0][0] * chave_encriptacao[1][1]) + (-1 * chave_encriptacao[0][1] * chave_encriptacao[1][0])

      se (determinante==0){

        escreva("\n-----------------------------------------------")
        escreva("\nA chave nao podera ser utilizada para decriptar a sua mensagem.\n")
        escreva("-----------------------------------------------\n")
        Util.aguarde(1500)

        faca{

          escreva("\nTem certeza de que inseriu a chave correta?\n\n[1]SIM [0]NAO: ")
          leia(chave_esta_correta)

          se (chave_esta_correta != '1' e chave_esta_correta!='0'){

            escreva("\n-----------------------------------------------")
            escreva("\nSELECAO INVALIDA: TENTE NOVAMENTE\n")
            escreva("-----------------------------------------------\n")

          }

          se (chave_esta_correta == '1'){
            
            caracter gerar_nova_chave

            escreva("\n-----------------------------------------------")
            escreva("\nUma nova chave deve ser gerada.\n")
            escreva("-----------------------------------------------\n")
            Util.aguarde(1500)
            
            faca{

              escreva("\nDeseja gerar nova chave agora?\n\n[1]SIM [0]NAO: ")
              leia(gerar_nova_chave)

              se(gerar_nova_chave != '1' e gerar_nova_chave != '0'){

                escreva("\n-----------------------------------------------")
                escreva("\nSELECAO INVALIDA: TENTE NOVAMENTE\n")
                escreva("-----------------------------------------------\n")

              }

            } enquanto(gerar_nova_chave != '1' e gerar_nova_chave != '0')

            se(gerar_nova_chave == '1'){

              escreva("\n-----------------------------------------------")
              escreva("\nUma nova chave sera gerada:\n")
              escreva("-----------------------------------------------\n")
              Util.aguarde(2500)

              gerar_chave()
              Util.aguarde(2500)

              escreva("O modulo de encriptacao sera encerrado.\n")
              escreva("-----------------------------------------------\n")
              Util.aguarde(2000)

              escreva("Compartilhe a nova chave com seu interlocutor e tente novamente.\n")
              escreva("-----------------------------------------------\n")
              Util.aguarde(2500)
              
              retorne

            }

            senao{

              escreva("\n-----------------------------------------------")
              escreva("\nO modulo de encriptacao sera encerrado.\n")
              escreva("-----------------------------------------------\n")
              Util.aguarde(2000)

              escreva("Utilize o modulo de geracao de chaves deste programa.\n")
              escreva("-----------------------------------------------\n")
              Util.aguarde(2000)

              escreva("Compartilhe a nova chave com seu interlocutor e tente novamente.\n")
              escreva("-----------------------------------------------\n")
              Util.aguarde(2500)

              retorne

            }

          }

          se(chave_esta_correta=='0'){

            escreva("\nReiniciando processo...\n")
            Util.aguarde(1500)

          }

        } enquanto(chave_esta_correta!='0')

      }

    } enquanto (determinante == 0)

    escreva("\n-----------------------------------------------")
    escreva("\nSua chave foi armazenada com sucesso.\n")
    escreva("-----------------------------------------------\n")

    cadeia mensagem
    inteiro comprimento_mensagem
    logico comprimento_mensagem_impar = falso

    faca {
      
      faca {

        escreva("\nDIGITE A MENSAGEM QUE SERA ENCRIPTADA:\n(OBS: Evite usar acentuacoes)\n\n")
        leia(mensagem)

        comprimento_mensagem = Texto.numero_caracteres(mensagem)
        
        se (comprimento_mensagem==0){

          escreva("\nVoce nao inseriu uma mensagem.\n")

        }

      } enquanto (comprimento_mensagem==0)

      escreva("\n-----------------------------------------------\n")

      caracter mensagem_esta_correta = ' '

      faca{

        escreva("\nConfirma a mensagem?\n\n")
        escreva("INICIO{ ", mensagem, " }FIM\n")
        escreva("\n[1]SIM [0]NAO: ")
        leia(mensagem_esta_correta)

        se(mensagem_esta_correta!='1' e mensagem_esta_correta!='0'){

          escreva("\n-----------------------------------------------")
          escreva("\nSELECAO INVALIDA: TENTE NOVAMENTE\n")
          escreva("-----------------------------------------------\n")

        }

        se(mensagem_esta_correta=='0'){

          escreva("\nReiniciando processo...\n")
          Util.aguarde(1000)
          escreva("-----------------------------------------------\n")

        }

        se(mensagem_esta_correta=='1'){

          escreva("\n-----------------------------------------------")
          escreva("\nArmazenando mensagem...\n")
          escreva("-----------------------------------------------\n")
          Util.aguarde(1500)

          escreva("Mensagem armazenada.\n")
          escreva("-----------------------------------------------\n")
          Util.aguarde(1000)

        }

      } enquanto(mensagem_esta_correta!='1' e mensagem_esta_correta!='0')

    } enquanto (mensagem_esta_correta != '1')

    escreva("Preparando mensagem para encriptacao...")
    escreva("\n-----------------------------------------------\n")
    Util.aguarde(2000)

    se (comprimento_mensagem%2 != 0){

      comprimento_mensagem_impar = verdadeiro
      comprimento_mensagem++
    
    }

    caracter mensagem_em_vetor[comprimento_mensagem]
    inteiro mensagem_codificada[comprimento_mensagem]

    se (comprimento_mensagem_impar == verdadeiro){

      para(inteiro i = 0; i < comprimento_mensagem-1; i++){     

        mensagem_em_vetor[i] = Texto.obter_caracter(mensagem, i)
      
      }

      mensagem_em_vetor[comprimento_mensagem-1] = ' '

    }

    senao{

      para(inteiro i = 0; i < comprimento_mensagem; i++){           
      
        mensagem_em_vetor[i] = Texto.obter_caracter(mensagem, i)
      
      }

    }

    para(inteiro i = 0; i < comprimento_mensagem; i++){          
    
      mensagem_codificada[i] = converter_car_p_int(mensagem_em_vetor[i])
    
    }

    inteiro qtd_colunas = comprimento_mensagem/2
    inteiro matriz_mensagem_codificada[2][qtd_colunas]
    inteiro cont = 0

    para (inteiro i = 0; i<2; i++){
      para (inteiro j = 0; j<qtd_colunas; j++){
        
        matriz_mensagem_codificada[i][j] = mensagem_codificada[cont]
        cont++

      }
    }

    cont = 0

    escreva("Encriptando mensagem...")
    escreva("\n-----------------------------------------------\n")
    Util.aguarde(2500)

    inteiro mensagem_encriptada[comprimento_mensagem]

    para(
      inteiro linha_chave_encriptacao = 0;
      linha_chave_encriptacao<2;
      linha_chave_encriptacao++
    ){
      para (
        inteiro coluna_matriz_mensagem = 0;
        coluna_matriz_mensagem<qtd_colunas;
        coluna_matriz_mensagem++
      ){
        
        inteiro resultado = 0

        para (
          inteiro iterador = 0;
          iterador<2;
          iterador++
        ){

          resultado += chave_encriptacao[linha_chave_encriptacao][iterador] * matriz_mensagem_codificada[iterador][coluna_matriz_mensagem]

        }

        mensagem_encriptada[cont] = resultado
        cont++

      }

    }

    escreva("\nCOPIE OS SEGUINTES DADOS E ENVIE PARA SEU INTERLOCUTOR: \n")
    Util.aguarde(1500)

    escreva("\n-----------------------------------------------\n")

    escreva("\nQUANTIDADE DE CARACTERES NA MENSAGEM: ")
    escreva(Util.numero_elementos(mensagem_encriptada), "\n")
    Util.aguarde(1500)

    escreva("\nMENSAGEM ENCRIPTADA:\n\n")
    
    para(inteiro i = 0; i<cont; i++){
    
      escreva(mensagem_encriptada[i], " ")
    
    }
    
    Util.aguarde(1500)

    escreva("\n\n-----------------------------------------------\n")
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  funcao decriptar_mensagem(){

    inteiro chave_encriptacao[2][2] //declaracao da matriz que ira receber os numeros para encriptacao da mensagem.
    inteiro chave_decriptacao[2][2] //declaracao da matriz inversa da anterior, que ira receber os numeros para decriptacao da mensagem
    inteiro determinante = 0        //variavel que recebera a determinante da matriz de encriptacao

    caracter chave_esta_correta = ' '
    
    faca {

      faca{

        escreva("\n-----------------------------------------------\n")
        escreva("\nINSIRA SUA CHAVE\n")
        escreva("\nVeja esta referencia para preencher a sua chave:\n\n")
        escreva("[1x1][1x2]\n[2x1][2x2]\n\n")

        para(inteiro i = 0; i<2; i++){
          para(inteiro j = 0; j<2; j++){

            escreva("Insira o numero na posicao ", i+1, "x", j+1, ": ")
            leia(chave_encriptacao[i][j])

          }
        }

        escreva("\n-----------------------------------------------\n")

        faca{

          escreva("\nConfirma chave?\n\n")

          para(inteiro i = 0; i<2; i++){
            para(inteiro j = 0; j<2; j++){

              escreva("[", chave_encriptacao[i][j], "]")

            }

            escreva("\n")

          }

          escreva("\n[1]SIM [0]NAO: ")
          leia(chave_esta_correta)

          se (chave_esta_correta != '1' e chave_esta_correta!='0'){

            escreva("\n-----------------------------------------------")
            escreva("\nSELECAO INVALIDA: TENTE NOVAMENTE\n")
            escreva("-----------------------------------------------\n")

          }

          se(chave_esta_correta=='0'){

            escreva("\nReiniciando processo...\n")
            Util.aguarde(1500)

          }

        } enquanto (chave_esta_correta != '1' e chave_esta_correta != '0')

      } enquanto (chave_esta_correta != '1')

      determinante = (chave_encriptacao[0][0] * chave_encriptacao[1][1]) + (-1 * chave_encriptacao[0][1] * chave_encriptacao[1][0])

      se (determinante==0){

        escreva("\nA sua chave nao pode ser utilizada para decriptar a mensagem.\n")

        faca{

          escreva("\nTem certeza de que inseriu a chave correta?\n[1]SIM [0]NAO: ")
          leia(chave_esta_correta)

          se (chave_esta_correta != '1' e chave_esta_correta!='0'){

            escreva("\nSELECAO INVALIDA: TENTE NOVAMENTE.\n\n")

          }

          se (chave_esta_correta == '1'){
            
            escreva("\n-----------------------------------------------")
            escreva("\nO modulo de encriptacao sera encerrado.\n")
            escreva("-----------------------------------------------\n")
            Util.aguarde(2000)

            escreva("\nUtilize o modulo de geracao de chaves deste programa.\n")
            escreva("-----------------------------------------------\n")
            Util.aguarde(2000)

            escreva("Compartilhe a nova chave com seu interlocutor e tente novamente.\n")
            escreva("-----------------------------------------------\n")
            Util.aguarde(2500)

            retorne

          }

        } enquanto(chave_esta_correta!='0')

      }

    } enquanto (determinante == 0)

    chave_decriptacao[0][0] = (chave_encriptacao[1][1]) / determinante
    chave_decriptacao[1][1] = (chave_encriptacao[0][0]) / determinante         
    chave_decriptacao[0][1] = (chave_encriptacao[0][1] * (-1)) / determinante  
    chave_decriptacao[1][0] = (chave_encriptacao[1][0] * (-1)) / determinante

    escreva("\n-----------------------------------------------")
    escreva("\nSua chave foi armazenada com sucesso.\n")
    escreva("-----------------------------------------------\n")

    inteiro comprimento_mensagem
    caracter comprimento_esta_correto

    faca{

      faca{

        escreva("\nInsira a quantidade de caracteres da mensagem:\n(OBS.: Quantidade deve ser numero INTEIRO, PAR e MAIOR OU IGUAL A 2)\n\n")
        leia(comprimento_mensagem)
        
        se(comprimento_mensagem <= 0){

          escreva("\nA mensagem deve ter no minimo 2 caracteres.\n\n")
          Util.aguarde(1200)
          escreva("Tente novamente.\n")
          Util.aguarde(1200)
          escreva("-----------------------------------------------\n")

        }

        senao{

          se(comprimento_mensagem%2 != 0){

            se (comprimento_mensagem<2){

              escreva("\nA mensagem deve ter no minimo 2 caracteres.\n")
              Util.aguarde(1200)

            }

            escreva("\nA quantidade de caracteres da mensagem deve ser par.\n\n")
            Util.aguarde(1200)
            escreva("Tente novamente.\n")
            Util.aguarde(1200)
            escreva("-----------------------------------------------\n")

          }
 
        }

      } enquanto (comprimento_mensagem%2 != 0 ou comprimento_mensagem <= 0)

      faca{

        escreva("\n-----------------------------------------------\n")
        escreva("\nConfirma quantidade de caracteres?\n\n", comprimento_mensagem,"\n\n[1]SIM [0]NAO: ")
        leia(comprimento_esta_correto)

        se(comprimento_esta_correto != '0' e comprimento_esta_correto != '1'){

          escreva("\n-----------------------------------------------")
          escreva("\nSELECAO INVALIDA: TENTE NOVAMENTE\n")
          escreva("-----------------------------------------------\n")

        }

        se(comprimento_esta_correto=='0'){

          escreva("\nReiniciando processo...\n")
          Util.aguarde(1500)
          escreva("-----------------------------------------------\n")
          
        }

      } enquanto (comprimento_esta_correto!='0' e comprimento_esta_correto!='1')

    } enquanto(comprimento_esta_correto == '0')

    inteiro qtd_colunas = comprimento_mensagem/2
    inteiro mensagem_encriptada[2][qtd_colunas]
    caracter codigos_estao_corretos
    
    inteiro cont = 0

    faca{

      escreva("\n-----------------------------------------------\n")

      codigos_estao_corretos = ' '

      faca{
        
        codigos_estao_corretos = ' '

        para (inteiro i = 0; i < 2; i++){
          para(inteiro j = 0; j < qtd_colunas; j++){

            escreva("\nInsira o codigo do ", cont+1, "° caractere: ")
            leia(mensagem_encriptada[i][j])
            cont++

            se (cont == comprimento_mensagem/2){

              escreva("\n")
              escreva("\n-----------------------------------------------\n")

              faca{

                escreva("\nConfirma codigos inseridos ate o momento?\n\n")

                para(inteiro k = 0; k<1; k++){
                  para(inteiro l = 0; l<qtd_colunas; l++){
                    
                    se(l==qtd_colunas-1){

                      escreva(mensagem_encriptada[k][l], "\n")

                    }
                    senao {

                      escreva(mensagem_encriptada[k][l], " ")

                    }
                  }
                }

                escreva("\n[1]SIM [0]NAO: ")
                leia(codigos_estao_corretos)
                
                se(codigos_estao_corretos!='0' e codigos_estao_corretos!='1'){

                  escreva("\n-----------------------------------------------")
                  escreva("\nSELECAO INVALIDA: TENTE NOVAMENTE\n")
                  escreva("-----------------------------------------------\n")

                }

                se(codigos_estao_corretos == '1'){

                  escreva("\nContinue:\n")

                }

                se (codigos_estao_corretos == '0'){

                  escreva("\nReiniciando processo...\n")
                  Util.aguarde(1200)
                  escreva("\n-----------------------------------------------\n")

                  pare

                }

              } enquanto (codigos_estao_corretos!='0' e codigos_estao_corretos!='1')

            }

            se (codigos_estao_corretos == '0'){

              pare

            }

          }

          se(codigos_estao_corretos == '0'){

            pare

          }

        }
        
        cont = 0

      } enquanto(codigos_estao_corretos == '0')
      
      escreva("\n-----------------------------------------------\n")

      faca{
        
        escreva("\nCodigos inseridos:\n\n")

        para(inteiro i = 0; i<2; i++){
          para(inteiro j = 0; j<qtd_colunas; j++){
            
            se(i==1 e j==qtd_colunas-1){

              escreva(mensagem_encriptada[i][j], "\n")

            }
            
            senao {

              escreva(mensagem_encriptada[i][j], " ")

            }
            
          }

        }
        
        escreva("\nConfirma todos os codigos inseridos?\n\n[1]SIM [0]NAO: ")
        leia(codigos_estao_corretos)

        se(codigos_estao_corretos!='0' e codigos_estao_corretos!='1'){

          escreva("\n-----------------------------------------------")
          escreva("\nSELECAO INVALIDA: TENTE NOVAMENTE\n")
          escreva("-----------------------------------------------\n")  
        
        }

        se(codigos_estao_corretos == '0'){

          escreva("\nReiniciando processo...\n")
          Util.aguarde(1200)

        }

      } enquanto (codigos_estao_corretos!='0' e codigos_estao_corretos!='1')

    } enquanto(codigos_estao_corretos == '0')

    escreva("\n-----------------------------------------------")
    escreva("\nPreparando sequencia de codigos...\n")
    escreva("-----------------------------------------------\n")
    Util.aguarde(2000)

    escreva("Decriptando mensagem...\n")
    escreva("-----------------------------------------------\n")
    Util.aguarde(2500)

    inteiro mensagem_codificada[comprimento_mensagem]

    para(
      inteiro linha_chave_decriptacao = 0;
      linha_chave_decriptacao<2;
      linha_chave_decriptacao++
    ){
      para (
        inteiro coluna_mensagem_encriptada = 0;
        coluna_mensagem_encriptada<qtd_colunas;
        coluna_mensagem_encriptada++
      ){
        
        inteiro resultado = 0

        para (
          inteiro iterador = 0;
          iterador<2;
          iterador++
        ){

          resultado += chave_decriptacao[linha_chave_decriptacao][iterador] * mensagem_encriptada[iterador][coluna_mensagem_encriptada]

        }

        mensagem_codificada[cont] = resultado
        cont++

      }

    }

    escreva("Mensagem decriptada com sucesso.\n")
    escreva("-----------------------------------------------\n")
    Util.aguarde(1200)

    escreva("Preparando mensagem para impressao...\n")
    escreva("-----------------------------------------------\n")
    Util.aguarde(2000)

    caracter mensagem[comprimento_mensagem]

    para(inteiro i = 0; i<comprimento_mensagem; i++){

      mensagem[i] = converter_int_p_car(mensagem_codificada[i])

    }

    escreva("\nMENSAGEM:\n")
    escreva("\nINICIO{ ")

    para(inteiro i = 0; i<comprimento_mensagem; i++){

      escreva(mensagem[i])

    }
    
    escreva(" }FIM\n")
    escreva("\n-----------------------------------------------\n")

  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  funcao inteiro converter_car_p_int(caracter carac) { 

    inteiro codigo_do_caracter                     //tabela de conversao de caracteres para numeros. A Tabela ASCII foi usada como base.
      
    escolha(carac) {
      
      caso '1':  
        codigo_do_caracter=1 
        pare

      caso '2':  
        codigo_do_caracter=2 
        pare

      caso '3':  
        codigo_do_caracter=3 
        pare

      caso '4':  
        codigo_do_caracter=4
        pare

      caso '5':  
        codigo_do_caracter=5 
        pare
      
      caso '6':  
        codigo_do_caracter=6 
        pare

      caso '7':  
        codigo_do_caracter=7 
        pare

      caso '8':  
        codigo_do_caracter=8 
        pare

      caso '9':  
        codigo_do_caracter=9 
        pare

      caso '0':  
        codigo_do_caracter=0 
        pare

      caso 'a':  
        codigo_do_caracter=97 
        pare 

      caso 'b': 
        codigo_do_caracter=98 
        pare 

      caso 'c': 
        codigo_do_caracter=99 
        pare 

      caso 'd': 
        codigo_do_caracter=100
        pare 

      caso 'e': 
        codigo_do_caracter=101 
        pare 

      caso 'f': 
        codigo_do_caracter=102 
        pare 

      caso 'g': 
        codigo_do_caracter=103 
        pare 

      caso 'h': 
        codigo_do_caracter=104 
        pare 

      caso 'i': 
        codigo_do_caracter=105 
        pare 

      caso 'j': 
        codigo_do_caracter=106 
        pare 

      caso 'k': 
        codigo_do_caracter=107 
        pare 

      caso 'l': 
        codigo_do_caracter=108
        pare 

      caso 'm': 
        codigo_do_caracter=109 
        pare

      caso 'n': 
        codigo_do_caracter=110 
        pare 

      caso 'o': 
        codigo_do_caracter=111 
        pare 

      caso 'p': 
        codigo_do_caracter=112 
        pare 

      caso 'q': 
        codigo_do_caracter=113 
        pare 

      caso 'r': 
        codigo_do_caracter=114 
        pare

      caso 's': 
        codigo_do_caracter=115
        pare 

      caso 't': 
        codigo_do_caracter=116 
        pare 

      caso 'u': 
        codigo_do_caracter=117 
        pare 

      caso 'v': 
        codigo_do_caracter=118 
        pare 

      caso 'w': 
        codigo_do_caracter=119 
        pare 

      caso 'x': 
        codigo_do_caracter=120 
        pare 

      caso 'y': 
        codigo_do_caracter=121 
        pare 

      caso 'z': 
        codigo_do_caracter=122 
        pare 

      caso 'A': 
        codigo_do_caracter=65 
        pare 

      caso 'B': 
        codigo_do_caracter=66 
        pare 

      caso 'C': 
        codigo_do_caracter=67 
        pare 

      caso 'D': 
        codigo_do_caracter=68 
        pare 

      caso 'E': 
        codigo_do_caracter=69 
        pare 

      caso 'F': 
        codigo_do_caracter=70 
        pare 

      caso 'G': 
        codigo_do_caracter=71 
        pare 

      caso 'H': 
        codigo_do_caracter=72 
        pare 

      caso 'I': 
        codigo_do_caracter=73 
        pare 

      caso 'J': 
        codigo_do_caracter=74 
        pare 

      caso 'K': 
        codigo_do_caracter=75 
        pare 

      caso 'L': 
        codigo_do_caracter=76 
        pare 

      caso 'M': 
        codigo_do_caracter=77 
        pare 

      caso 'N': 
        codigo_do_caracter=78 
        pare 

      caso 'O': 
        codigo_do_caracter=79 
        pare 

      caso 'P': 
        codigo_do_caracter=80 
        pare 

      caso 'Q': 
        codigo_do_caracter=81 
        pare 

      caso 'R': 
        codigo_do_caracter=82 
        pare 

      caso 'S': 
        codigo_do_caracter=83 
        pare 

      caso 'T': 
        codigo_do_caracter=84 
        pare 

      caso 'U': 
        codigo_do_caracter=85 
        pare 

      caso 'V': 
        codigo_do_caracter=86 
        pare 

      caso 'W': 
        codigo_do_caracter=87 
        pare 

      caso 'X': 
        codigo_do_caracter=88 
        pare 

      caso 'Y': 
        codigo_do_caracter=89 
        pare 

      caso 'Z': 
        codigo_do_caracter=90 
        pare 

      caso ' ': 
        codigo_do_caracter=32 
        pare 

      caso '!': 
        codigo_do_caracter=33 
        pare 

      caso '?': 
        codigo_do_caracter=63 
        pare 

      caso ':': 
        codigo_do_caracter=58 
        pare 

      caso ',': 
        codigo_do_caracter=44 
        pare 

      caso '.': 
        codigo_do_caracter=46 
        pare 

      caso ';': 
        codigo_do_caracter=59 
        pare 

      caso '{': 
        codigo_do_caracter=123 
        pare 

      caso '}': 
        codigo_do_caracter=125 
        pare 

      caso '[': 
        codigo_do_caracter=93 
        pare 

      caso ']': 
        codigo_do_caracter=91 
        pare 

      caso '(': 
        codigo_do_caracter=40 
        pare 

      caso ')': 
        codigo_do_caracter=41 
        pare 

      caso '"': 
        codigo_do_caracter=34 
        pare
      
      caso contrario:
        codigo_do_caracter=10        //caso se insira um caractere que nao se encontra na tabela de conversao, ele e convertido para o numero 10 como padrao
    }
    
    retorne codigo_do_caracter

  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  funcao caracter converter_int_p_car(inteiro codigo_do_caracter){

    caracter carac
    
    escolha(codigo_do_caracter){
      caso 1:  
        carac='1' 
        pare

      caso 2:  
        carac='2' 
        pare

      caso 3:  
        carac='3' 
        pare

      caso 4:  
        carac='4'
        pare

      caso 5:  
        carac='5' 
        pare
      
      caso 6:  
        carac='6' 
        pare

      caso 7:  
        carac='7' 
        pare

      caso 8:  
        carac='8' 
        pare

      caso 9:  
        carac='9' 
        pare

      caso 0:  
        carac='0' 
        pare

      caso 97: 
        carac='a'
        pare

      caso 98:
        carac='b'
        pare

      caso 99:
        carac='c' 
        pare
      
      caso 100:
        carac='d'
        pare

      caso 101:
        carac='e'
        pare
  
      caso 102:
        carac='f'
        pare
  
      caso 103:
        carac='g'
        pare
  
      caso 104:
        carac='h'
        pare
  
      caso 105:
        carac='i'
        pare

      caso 106:
        carac='j'
        pare

      caso 107:
        carac='k'
        pare

      caso 108:
        carac='l'
        pare

      caso 109:
        carac='m'
        pare

      caso 110:
        carac='n'
        pare
    
      caso 111:
        carac='o'
        pare
  
      caso 112:
        carac='p'
        pare
      
      caso 113:
        carac='q'
        pare
  
      caso 114:
        carac='r'
        pare
      
      caso 115:
        carac='s'
        pare
  
      caso 116:
        carac='t'
        pare
      
      caso 117:
        carac='u'
        pare
  
      caso 118:
        carac='v'
        pare
      
      caso 119:
        carac='w'
        pare
  
      caso 120:
        carac='x'
        pare
      
      caso 121:
        carac='y'
        pare
  
      caso 122:
        carac='z'
        pare
      
      caso 65:
        carac='A'
        pare
  
      caso 66:
        carac='B'
        pare
      
      caso 67:
        carac='C'
        pare
  
      caso 68:
        carac='D'
        pare
      
      caso 69:
        carac='E'
        pare
  
      caso 70:
        carac='F'
        pare
      
      caso 71:
        carac='G'
        pare
  
      caso 72:
        carac='H'
        pare
      
      caso 73:
        carac='I'
        pare
  
      caso 74:
        carac='J'
        pare
      
      caso 75:
        carac='K'
        pare
  
      caso 76:
        carac='L'
        pare
      
      caso 77:
        carac='M'
        pare
      
      caso 78:
        carac='N'
        pare
  
      caso 79:
        carac='O'
        pare
      
      caso 80:
        carac='P'
        pare
  
      caso 81:
        carac='Q'
        pare
      
      caso 82:
        carac='R'
        pare
  
      caso 83:
        carac='S'
        pare
      
      caso 84:
        carac='T'
        pare

      caso 85:
        carac='U'
        pare
    
      caso 86:
        carac='V'
        pare

      caso 87:
        carac='W'
        pare
  
      caso 88:
        carac='X'
        pare
      
      caso 89:
        carac='Y'
        pare
  
      caso 90:
        carac='Z'
        pare
      
      caso 32:
        carac=' '
        pare
  
      caso 33:
        carac='!'
        pare
      
      caso 63:
        carac='?'
        pare
  
      caso 58:
        carac=':'
        pare
      
      caso 44:
        carac=','
        pare
  
      caso 46:
        carac='.'
        pare
      
      caso 59:
        carac=';'
        pare
  
      caso 123:
        carac='{'
        pare
      
      caso 125:
        carac='}'
        pare
      
      caso 93:
        carac='['
        pare
      
      caso 91:
        carac=']'
        pare
      
      caso 40:
        carac='('
        pare
      
      caso 41:
        carac=')'
        pare
      
      caso 34:
        carac='"'
        pare
      
      caso contrario:
        carac='*'
    }
    
    retorne carac
    
  }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}