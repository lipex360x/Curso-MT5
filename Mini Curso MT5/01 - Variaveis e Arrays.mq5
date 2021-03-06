void OnInit(){
   // Tipos de Variáveis e Tabs
   int      num1 = 10;
   double   num2 = 10.5;
   bool     teste = false;
   string   texto = "Olá Mundo";
   
   // Nomenclatura
   int PascalCase = 5;
   int cameoCase = 5;
   int snake_case = 5;
   int UPPER_SNAKE_CASE = 5;
   
   // |---- Operações Aritméticas ----| //
   double a = 10;
   double b = 20;
   
   // Soma
   double soma = a + b;
   Print("Soma = ",soma);
   
   // Subtração
   double subtracao = b - a;
   Print("Subtração = ",subtracao);
   
   // Multiplicação
   double multiplicao = a * b;
   Print("Multiplicação = ",multiplicao);
   
   // Divisão
   double divisao = a / b;
   Print("Divisão = ",divisao);
   
   // Acrescimo
   double acrescimo = a;
   acrescimo++;
   Print("Acrescimo = ",acrescimo);
   
   // Decrescimo
   double decrescimo = b;
   decrescimo--;
   Print("Decrescimo = ",decrescimo);
   
   // Isolar Partes dos Cálculos
   int numA = 3;
   int numB = 5;
   int numC = ((numA + numB) * 3) / 6;
   Print("Isolar Cálculos = ",numC);
   
   // |---- Operações de Atribuições ----| //
   int x = 3;
   int y = x;
   int z = 2;
   z += 10;
   
   Print("Valor de X = ",x);
   Print("Valor de Y = ",y);
   Print("Valor de Z = ",z);
      
   // |---- Operações de Comparação ----| //
   bool comp1 = x == y;
   Print("comp1 = ",comp1);
   
   bool comp2 = x == z;
   Print("comp2 = ",comp2);
   
   bool comp3 = x > y;
   Print("comp3 = ",comp3);
   
   bool comp4 = x < z;
   Print("comp4 = ",comp3);
   
   bool comp5 = x >= z;
   Print("comp5 = ",comp5);
   
   bool comp6 = x <= z;
   Print("comp6 = ",comp6);
 
   // |---- Operações Booleanas ----| //
   bool comprado = false;
   bool vendido = true;
   
   // OU => ||
   bool posicionado = comprado || vendido;
   Print("posicionado = ",posicionado);
   
   // E => &&
   bool falha = comprado && vendido;
   Print("falha = ",falha);
   
   // ARRAY
   int array[6] = {7,2,6,4,1,9};
   int posicao = 4;
   
   Print("array[",posicao,"] = ",array[posicao]);
   
}