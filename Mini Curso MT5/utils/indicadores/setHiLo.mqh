int hiloValor;
double HiLo[];

void setHilo(int periodo, int qtde) {
   ArraySetAsSeries(HiLo, true);
   hiloValor = iCustom(Symbol(), Period(), "hilo", periodo);
   CopyBuffer(hiloValor, 0, 0, qtde, HiLo);
}