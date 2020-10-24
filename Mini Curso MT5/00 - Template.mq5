// Inclusões
#include <Trade\Trade.mqh>
CTrade trade;

// Indicadores

// Informações
#include "./utils/info/setCandleInfo.mqh"
#include "./utils/info/setTickInfo.mqh"

// Ordens
input int lote = 100;// Número de Contratos

double stopLoss;
double takeProfit;

bool posicionado = false;

// Informações do Candle
string horaCandleAtual;
string horaCandleFechamento = "00:00";

double ultimoNegocio;

void OnInit() {
   Print("Robô #####");
   
   /*
   .SETUP: 
   
   .STOP: 
   
   .TAKE: 
   */
}

void OnTick() {
   
   // CANDLE INFO
   setCandleInfo(2);
   
   // TICK INFO
   setTickInfo();   
   ultimoNegocio = tickInfo.last;
   
   // HORA CANDLE ATUAL
   horaCandleAtual = TimeToString(candleInfo[0].time, TIME_MINUTES);
   
   // SETUP
   if(
    
   ) {
      stopLoss = 0;
      takeProfit = 0;
      
      trade.Buy(lote,_Symbol,0,stopLoss,takeProfit,"Ordem de Compra");
      posicionado = true;
   } 
    
    
   // STOP LOSS
   if(
    
   ) {
      Print("StopLoss");
      horaCandleFechamento = TimeToString(candleInfo[0].time, TIME_MINUTES);
      trade.PositionClose(_Symbol);
      posicionado = false;
   }
    
    
   // TAKE PROFIT
   if(
    
   ) {
      Print("TakeProfit");
      horaCandleFechamento = TimeToString(candleInfo[0].time, TIME_MINUTES);
      trade.PositionClose(_Symbol);
      posicionado = false;
   }
    
}