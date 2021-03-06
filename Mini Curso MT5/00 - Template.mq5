// Inclusões
#include <Trade\Trade.mqh>
CTrade trade;

// Indicadores
// #include "./utils/indicadores/setMediaEMA.mqh"

// Informações
#include "./utils/info/setCandleInfo.mqh"
#include "./utils/info/setTickInfo.mqh"

#include "./utils/ordens/resetPosicao.mqh"

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
   Print("Robô Larry Williams");
   
   /*
   .SETUP: 
   
   .STOP: 
   
   .TAKE: 
   */
}

void OnTick() {
   
   // CANDLE INFO
   setCandleInfo(2);
   
   // MÉDIA MÓVEL
   // setMediaEMA(9,0,PRICE_CLOSE,2);
   // mediaEMA[0];
   
   // TICK INFO
   setTickInfo();   
   ultimoNegocio = tickInfo.last;
   
   // HORA CANDLE ATUAL
   horaCandleAtual = TimeToString(candleInfo[0].time, TIME_MINUTES);
   
   /*
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
   
   
   // RESET POSICIONADO
   resetPosicao();
    
   */
    
}