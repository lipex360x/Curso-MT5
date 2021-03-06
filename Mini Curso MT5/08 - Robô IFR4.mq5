// Inclusões
#include <Trade\Trade.mqh>
CTrade trade;

// Configurações
#include "./utils/config/setValidador.mqh"

// Indicadores
#include "./utils/indicadores/setIFR.mqh"

// Informações
#include "./utils/info/setCandleInfo.mqh"
#include "./utils/info/setTickInfo.mqh"

// Ordens
input int lote = 100;// Número de Contratos
input int qtdeCandles = 7;// Candles de Saída no IFR

int contadorCandle;
int numeroCandleEntrada;
double stopLoss;
double takeProfit;

bool posicionado = false;

// Informações do Candle
string horaCandleAtual;
string horaCandleFechamento = "00:00";

double ultimoNegocio;

void OnInit() {
   if(!setValidador()) {
      Print("Chave Inválida");
      return;
   };
   
   Print("Robô IFR4");

   /*
   .SETUP: Ordem de compra se IFR4 do candle[1] for < 30
   
   .STOP: no tempo - 7 candles
   
   .TAKE: quando o IFR4 >= 55
   */
}

void OnTick() {
   //VALIDAÇÃO DE USUÁRIO
   if(!validador) return;
   
   // CANDLE INFO
   setCandleInfo(2);
   
   // TICK INFO
   setTickInfo();   
   ultimoNegocio = tickInfo.last;
   
   // IFR
   setIFR(4,PRICE_CLOSE,2);
   
   // HORA CANDLE ATUAL
   horaCandleAtual = TimeToString(candleInfo[0].time, TIME_MINUTES);
   
   // CONTADOR DE CANDLES
   contadorCandle = Bars(_Symbol, _Period);
   
   // SETUP
   if(
      !posicionado &&
      horaCandleAtual != horaCandleFechamento &&
      ifr[1] != 0 &&
      ifr[1] < 30
   ) {
      stopLoss = 0;
      takeProfit = 0;
      
      trade.Buy(lote,_Symbol,0,stopLoss,takeProfit,"Ordem de Compra");
      numeroCandleEntrada = contadorCandle;
      posicionado = true;
   } 
    
   
   // STOP IFR >= 55
   if(
      posicionado &&
      ifr[0] >= 55
   ) {
      Print("Saída IFR >= 55");
      horaCandleFechamento = TimeToString(candleInfo[0].time, TIME_MINUTES);
      trade.PositionClose(_Symbol);
      posicionado = false;
   }
 
   // STOP NO TEMPO = 7
   if(
      posicionado &&
      (contadorCandle - qtdeCandles) == numeroCandleEntrada
   ) {
      Print("Saída no Tempo");
      horaCandleFechamento = TimeToString(candleInfo[0].time, TIME_MINUTES);
      trade.PositionClose(_Symbol);
      posicionado = false;
   }
    
}