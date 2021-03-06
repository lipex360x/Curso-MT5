#include <Trade\Trade.mqh>
CTrade trade;

#include "./utils/info/setCandleInfo.mqh"
#include "./utils/info/setTickInfo.mqh"

#include "./utils/indicadores/setMediaEMA.mqh"

double mediaMovel;
double maximaCandleAnterior;
double ultimoNegocio;

string horaCandleAtual;
string horaCandleFechamento = "00:00";

bool posicionado = false;

void OnInit() {
   Print("Robô Média Móvel");
   
   /*
      .SETUP: Comprar se ultimo tick for maior que Média Móvel de 9 períodos
      
      .STOP: preço abaixo da média móvel de 9
      
      .TAKE: máxima do candle anterior
   */
}

void OnTick() {
   
   // MEDIA MÓVEL
   setMediaEMA(21,0,PRICE_CLOSE,1);
   mediaMovel = NormalizeDouble(mediaEMA[0],3);
   
   // CANDLE INFO
   setCandleInfo(2);
   maximaCandleAnterior = candleInfo[1].high;
   
   // TICK INFO
   setTickInfo();   
   ultimoNegocio = tickInfo.last;
   
   // HORA CANDLE ATUAL
   horaCandleAtual = TimeToString(candleInfo[0].time, TIME_MINUTES);
   
   Comment(
      "Ultimo Negócio: ",ultimoNegocio,
      "\nMédia: ",mediaMovel,
      "\nMáxima Candle Anterior: ",maximaCandleAnterior
    );
    
    // CONDIÇÃO DE ENTRADA
    if(
      !posicionado && 
      mediaMovel != 0 &&
      horaCandleAtual != horaCandleFechamento &&
      ultimoNegocio > mediaMovel 
     ) {
      trade.Buy(100,_Symbol,0,0,0,"Ordem de Compra");
      posicionado = true;
    } 
    
    // TAKE PROFIT
    if( posicionado && ultimoNegocio >= maximaCandleAnterior ) {
      Print("TakeProfit");
      horaCandleFechamento = TimeToString(candleInfo[0].time, TIME_MINUTES);
      trade.PositionClose(_Symbol);
      posicionado = false;
    }
    
    // STOP LOSS
    if(posicionado && ultimoNegocio < mediaMovel) {
      Print("StopLoss");
      horaCandleFechamento = TimeToString(candleInfo[0].time, TIME_MINUTES);
      trade.PositionClose(_Symbol);
      posicionado = false;
    }
}