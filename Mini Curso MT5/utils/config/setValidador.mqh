int contas[5];
bool validador = false;

bool setValidador() {

   contas[0] = 1111;
   contas[1] = 2222;
   contas[2] = 3333;
   contas[3] = 4444;
   contas[4] = 5555;
   
   for(int i=0; i < ArraySize(contas); i++) {
     
     if(contas[i] == AccountInfoInteger(ACCOUNT_LOGIN)) {
         validador = true;
         break;
     }
     
   }
   
   return validador;
}