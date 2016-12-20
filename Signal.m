Function Signal=esercise1(range, period, kparam, nsample)
%
%cosa fa la funzione
%uno per uno si spiegano cosa fanno gli argomenti
%
%Computing values and shape of the signal func1*func2
%Argument range: 
%Argument period:
%Argument kparam:
%Argument nsample:
%
%Eleonora Macuglia 125591
%Version 1.0, 01 March 2016
%
%%%%%%%%%%%%%%%creazione della funzione%%%%%%%%%%%%%%%
%debugging di tipo sintattico
%ogni riga va commentata a voce
%
tmin=range(1,1);
tmax=range(1,2);
deltaT=abs(tmax-tmin)/(nsample-1);  %passo tra 2 elem minimi del dominio
timeInterval=[tmin: deltaT: tmax];  %array dei punti in cui campione la funzione
%
func1=cos(timeInterval).*2*PI/period;  % il punto specifica al programma ke deve fare il prodotto termine a termine
func2=exp(-timeInterval/kparam);
%
Signal=func1.*func2;  %segnale prodotto dalle 2 funzioni, sapendo ke le 2 func sono array
%
%%%%%%%%%%%%%%%%fase di visualizzazione%%%%%%%%%%%%%
%debugging visivo
%diagramma della funzione, matrice di diagrammi
%
subplot(1,3,1); %voglio una matrice 1x3, questo ke esegue metti nella pos 1,1
plot(timeInterval, func1), title(['Function func1 with parameters:...'
	range=['num2str(tmin),' 'num2str(tmax)'],k=',num2str(kparam),',...
	nsample='num2str(nsample)'])  %comando ke definisce l'array di plot
subplot(1,3,1);
plot(timeInterval, func1), title(['Function func1 with parameters:...'
	range=['num2str(tmin),' 'num2str(tmax)'],k=',num2str(kparam),',...
	nsample='num2str(nsample)'])
subplot(1,3,1);
plot(timeInterval, func1), title(['Function func1 with parameters:...'
	range=['num2str(tmin),' 'num2str(tmax)'],k=',num2str(kparam),',...
	nsample='num2str(nsample)'])


