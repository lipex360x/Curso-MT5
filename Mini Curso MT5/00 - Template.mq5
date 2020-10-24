// Inclusões
#include <Trade\Trade.mqh>
CTrade trade;

// Indicadores

// Informações
#include "./utils/info/setCandleInfo.mqh"
#include "./utils/info/setTickInfo.mqh"

// Ordens
double stopLoss;
double takeProfit;

bool posicionado = false;


// Informações do Candle
string horaCandleAtual;
string horaCandleFechamento = "00:00";

double ultimoNegocio;



void OnInit() {
   Print("Robô Máximas e Mínimas");
}

void OnTick() {

   /*
      SETUP: 
      TAKE: 
      STOP: 
   */
   
   // CANDLE INFO
   setCandleInfo(2);
   
   // TICK INFO
   setTickInfo();   
   ultimoNegocio = tickInfo.last;
   
   // HORA CANDLE ATUAL
   horaCandleAtual = TimeToString(candleInfo[0].time, TIME_MINUTES);
   Comment(horaCandleAtual);
   
    // CONDIÇÃO DE ENTRADA
    if(
    
    
    ) {
      stopLoss = 0;
      takeProfit = 0;
      
      trade.Buy(100,_Symbol,0,stopLoss,takeProfit,"Ordem de Compra");
      posicionado = true;
    } 
    
    // TAKE PROFIT
    if(
    
    ) {
      Print("TakeProfit");
      horaCandleFechamento = TimeToString(candleInfo[0].time, TIME_MINUTES);
      trade.PositionClose(_Symbol);
      posicionado = false;
    }
    
    // STOP LOSS
    if(
    
    
    ) {
      Print("TakeProfit");
      horaCandleFechamento = TimeToString(candleInfo[0].time, TIME_MINUTES);
      trade.PositionClose(_Symbol);
      posicionado = false;
    }
}