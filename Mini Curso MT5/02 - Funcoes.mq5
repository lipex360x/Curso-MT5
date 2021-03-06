// Função Somar()
int Somar(int a, int b){ 
   return a + b;
}

void OnInit() {
   // Chamada da Função SEM Retorno
   //FuncaoSemRetorno();
   
   // Chamada da Função COM Retorno
   //Print(FuncaoComRetorno());
   
   // Chamada da Função COM Parâmetros e SEM Retorno
   //FuncaoComParametroSemRetorno("Texto da Função com Parâmetros");
   
   // Chamada da Função COM Parâmetros e COM Retorno
   //string texto = FuncaoComParametroComRetorno("João",25);
   //string texto2 = FuncaoComParametroComRetorno("José", 30);
   //Print(texto);
   //Print(texto2);
   
   // Associação do Retorno da Função Somar()
   
   int soma1 = Somar(1,2);
   Print("Resultado de soma1 = ",soma1);
   Print("Resultado da Função = ",Somar(5,10));
   
}

// Função SEM Retorno
void FuncaoSemRetorno() {
   Print("Print da FuncaoSemRetorno()");
}

// Função COM Retorno
string FuncaoComRetorno() {
   return "Retorno da FuncaoComRetorno()";
}

// Função COM Parâmetro SEM Retorno
void FuncaoComParametroSemRetorno(string texto) {
   Print("Print da FuncaoComParametroSemRetorno(). Parametro texto ",texto);
}

// Função COM Parâmetro e COM Retorno
string FuncaoComParametroComRetorno(string nome, int idade) {
   string texto = "O nome passado é "+nome+" e a idade informada é "+idade;
   return texto;
}
