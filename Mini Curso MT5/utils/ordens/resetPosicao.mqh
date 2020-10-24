void resetPosicao() {
   if(
      posicionado && PositionsTotal() == 0
    ) {
      horaCandleFechamento = TimeToString(candleInfo[0].time, TIME_MINUTES);
      posicionado = false;
    }
}
