int numA;
int numB;

void OnInit() {
   numA = 3;
   numB = 5;
   
   /* 
      igual: ==
      diferente: !=
      maior: >
      menor: <
      maior ou igual: >=
      menor ou igual: <=
      &&: todas as condições true = true
      ||: uma das condições true = true
   */
   
   if( numA <= 4 ) {
      // Print("\n\n1ª Condição Atendida");
   }
   
   // Condição E simples
   if( (numA == 4) && (numB == 5) ) {
      // Print("\n\n2ª Condição Atendida");
   }
   
   // Condição OU simples
   if( numA < 3 || numB != 5 ) {
      // Print("\n\n3ª Condição Atendida");
   }
   
   
   // Condição E multipla
   if( (numA == 3 && numB == 5) && (numA > 3 || numA < 3) ) {
      Print("\n\n4ª Condição Atendida");
   } 
   
   else if( (numA == 3) ) {
      Print("\n\n4ª Condição Atendida no 2º bloco");
      return;
   }   
   
   else {
      Print("\n\n4ª Condição não Atendida"); 
   }
   
   Print("Fim do Código");
   
} 