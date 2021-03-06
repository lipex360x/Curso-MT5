// Inclusões
#include <Trade\Trade.mqh>
CTrade trade;

// Serviços
#include "./utils/servicos/ValidaHoraDeTrade.mqh"
ValidaHoraDeTrade horaDeTrade;

// Configurações
#include "./utils/config/setValidador.mqh"

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

input string horaInicio; // Hora de Início (hh:mm)
input string horaFim; // Hora de Término (hh:mm)


double ultimoNegocio;

void OnInit() {
   setValidador();
   
   Print("Robô 123");
   
    /*
      .SETUP: Comprar rompimento do candle[1] se mímina do candle[1] for maior que mínima do candle[2]
      e mínima do candle[2] for menor que a mínima do candle[3]
      
      .STOP: Mínima do candle[2]
      
      .TAKE: Duas vezes o risco      
   */
}

void OnTick() {
   //VALIDAÇÃO DE USUÁRIO
   if(!validador) return;
   
   // CANDLE INFO
   setCandleInfo(4);
   
   // TICK INFO
   setTickInfo();   
   ultimoNegocio = tickInfo.last;
   
   // HORA CANDLE ATUAL
   horaCandleAtual = TimeToString(candleInfo[0].time, TIME_MINUTES);
   
   Comment(horaDeTrade.execute(horaInicio, horaFim));
   
    // CONDIÇÃO DE ENTRADA
    if(
      !posicionado &&
      candleInfo[1].low > candleInfo[2].low &&
      candleInfo[2].low < candleInfo[3].low &&
      horaDeTrade.execute(horaInicio, horaFim) &&
      horaCandleAtual != horaCandleFechamento &&
      ultimoNegocio > candleInfo[1].high
    ) {
      stopLoss = candleInfo[2].low;
      takeProfit = ultimoNegocio + ((ultimoNegocio - stopLoss)*2);
      
      trade.Buy(100,_Symbol,0,stopLoss,takeProfit,"Ordem de Compra");
      posicionado = true;
    }
    
    // RESET POSICIONADO
    if(
      posicionado && PositionsTotal() == 0
    ) {
      horaCandleFechamento = TimeToString(candleInfo[0].time, TIME_MINUTES);
      posicionado = false;
    }
    
}