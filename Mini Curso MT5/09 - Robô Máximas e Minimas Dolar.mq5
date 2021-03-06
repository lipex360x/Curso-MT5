// Inclusões
#include <Trade\Trade.mqh>
CTrade trade;

// Indicadores

// Informações
#include "./utils/info/setCandleInfo.mqh"
#include "./utils/info/setTickInfo.mqh"

// Ordens
input int lote = 1;// Número de Contratos

double stopLoss;
double takeProfit;

bool posicionado = false;

// Informações do Candle
string horaCandleAtual;
string horaCandleFechamento = "00:00";

double ultimoNegocio;

void OnInit() {
   Print("Robô Máximas e Mínimas Dolar");
   
   /*
   .SETUP: Comprar se mínima do candle[1] for atingida
   
   .STOP: Não tem Stop
   
   .TAKE: A máxima do candle[1]
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
    !posicionado &&
    horaCandleAtual != horaCandleFechamento &&
    horaCandleAtual != "09:00" &&
    ultimoNegocio < candleInfo[1].low
   ) {
      stopLoss = 0;
      takeProfit = 0;
      
      trade.Buy(lote,_Symbol,0,stopLoss,takeProfit,"Ordem de Compra");
      posicionado = true;
   } 
       
   // SAÍDA
   if(
    posicionado && ultimoNegocio >= candleInfo[1].high
   ) {
      Print("Ordem de Venda");
      horaCandleFechamento = TimeToString(candleInfo[0].time, TIME_MINUTES);
      trade.PositionClose(_Symbol);
      posicionado = false;
   }
    
}