// Inclusões
#include <Trade\Trade.mqh>
CTrade trade;

// Indicadores
#include "./utils/indicadores/setMediaEMA.mqh"
#include "./utils/indicadores/setMediaSMA.mqh"

// Informações
#include "./utils/info/setCandleInfo.mqh"
#include "./utils/info/setTickInfo.mqh"

#include "./utils/ordens/resetPosicao.mqh"

// Ordens
input int lote = 100;// Número de Contratos

double stopLoss;
double takeProfit;

double media8;
double media34;
double media80;

bool posicionado = false;

// Informações do Candle
string horaCandleAtual;
string horaCandleFechamento = "00:00";

double ultimoNegocio;

void OnInit() {
   Print("Robô Dave Landry");
   
   /*
   .SETUP: Se mínima do Candle[1] for menor que candle[2] e candle[3] compra se Romper máxima do candle[1]
   
   .TENDÊNCIA: Alta - EMA8 > SMA34 > SMA80
   
   .STOP: Mínima do Candle[1]
   
   .TAKE: 2x o Risco
   */
}

void OnTick() {
   
   // CANDLE INFO
   setCandleInfo(4);
   
   // TICK INFO
   setTickInfo();   
   ultimoNegocio = tickInfo.last;
   
   // MÉDIAS MÓVEL
   setMediaEMA(8,0,PRICE_CLOSE,2);
   media8 = mediaEMA[1];
   
   setMediaSMA(34,0,PRICE_CLOSE,2);
   media34 = mediaSMA[1];
   
   setMediaSMA(80,0,PRICE_CLOSE,2);
   media80 = mediaSMA[1];
   
   // HORA CANDLE ATUAL
   horaCandleAtual = TimeToString(candleInfo[0].time, TIME_MINUTES);
   
  
   Comment(
      "EMA8: ",NormalizeDouble(media8,3),
      "\nSMA34: ",NormalizeDouble(media34,3),
      "\nSMA80: ",NormalizeDouble(media80,3)
   );   
   
   // TENDÊNCIA
   if( media8 > media34 && media34 > media80 ) {
      
      // SETUP
      if(
       !posicionado &&
       candleInfo[1].low < candleInfo[2].low &&
       candleInfo[1].low < candleInfo[3].low &&
       horaCandleAtual != horaCandleFechamento &&
       ultimoNegocio > candleInfo[1].high
      ) {
         stopLoss = candleInfo[1].low;
         takeProfit = ultimoNegocio + ((ultimoNegocio - stopLoss)*2);
         
         trade.Buy(lote,_Symbol,0,stopLoss,takeProfit,"Ordem de Compra");
         posicionado = true;
      } 
        
   }
   
   // RESET POSICIONADO
   resetPosicao();
    
}