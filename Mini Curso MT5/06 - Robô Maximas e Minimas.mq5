#include <Trade\Trade.mqh>
CTrade trade;

#include "./utils/info/setCandleInfo.mqh"
#include "./utils/info/setTickInfo.mqh"

double maximaCandleAnterior;
double ultimoNegocio;

string horaCandleAtual;
string horaCandleFechamento = "00:00";

bool posicionado = false;

void OnInit() {
   Print("Robô Máximas e Mínimas");
   
    /*
      .SETUP: Comprar se o preço atual atingir a mínima do candle anterior
      
      .TAKE: Máxima do candle anterior
      
      .STOP: não tem stop
   */
}

void OnTick() {

   // CANDLE INFO
   setCandleInfo(2);
   maximaCandleAnterior = candleInfo[1].high;
   
   // TICK INFO
   setTickInfo();   
   ultimoNegocio = tickInfo.last;
   
   // HORA CANDLE ATUAL
   horaCandleAtual = TimeToString(candleInfo[0].time, TIME_MINUTES);
   Comment(horaCandleAtual);
   
    // CONDIÇÃO DE ENTRADA
    if(
      !posicionado && 
      horaCandleAtual != horaCandleFechamento &&
      ultimoNegocio < candleInfo[1].low
     ) {
      trade.Buy(100,_Symbol,0,0,0,"Ordem de Compra");
      posicionado = true;
    } 
    
    // TAKE PROFIT
    if( posicionado && ultimoNegocio >=  candleInfo[1].high ) {
      Print("TakeProfit");
      horaCandleFechamento = TimeToString(candleInfo[0].time, TIME_MINUTES);
      trade.PositionClose(_Symbol);
      posicionado = false;
    }
}