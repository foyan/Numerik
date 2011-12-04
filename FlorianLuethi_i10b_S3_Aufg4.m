function y = FlorianLuethi_i10b_S3_Aufg4(func, a, b, tol, loop)
%FlorianLuethi_i10b_S3_Aufg4 Berechnet (fast) alle Nullstellen der Funktion func
%auf dem Intervall [a,b] mit der Genauigkeit 5*10^tol. loop = 0 liefert
%einen Fehler wenn keine Nullstelle gefunden wurde; alle anderen Werte
%liefern einfach einen leeren Vektor.
%Falls im Intervall [a,b] eine ungerade Anzahl Nullstellen existieren,
%wird grundsätzlich nur eine einzige gefunden.
%Das Verfahren so wie im Script beschrieben ist eigentlich
%nur tauglich zum Auffinden einer einzigen Nullstelle für eine
%auf dem Intervall [a,b] monoton steigende Funktion; deswegen wurde es um zwei Aspekte
%erweitert:
% * Auf dem Intervall [a,b] monoton fallende Funktionen werden
%   abgedeckt, in dem für die Auswahl des für die weitere Suche
%   relevanten Intervalls die Vorzeichen der Intervallsgrenzen
%   mitberücksichtigt werden;
% * Bei Fehlschlagen des Zwischenwertsatzes wird nicht einfach
%   abgebrochen, sondern das Intervall geteilt und auf beiden
%   Teilintervallen die Funktion wieder aufgerufen. Die Anzahl
%   Rekursionen beschränkt sich auf den Exponenten der Genauigkeit + 1.
%   Richtigerweise müsste man das solange tun, wie |a-b| grösser ist
%   als die Genauigkeit; die Laufzeitkomplexität dieses Ansatzes wäre
%   dann aber sogar mieser als wenn man einfach das ursprüngliche
%   Intervall in |b-a| / 10^tol - Intervalle aufteilen würde und
%   davon jedes auf func(b) < 10^tol testen würde, was das ganze
%   Verfahren natürlich ad absurdum führt.
%Aufruf: y = FlorianLuethi_i10b_S3_Aufg4(@(x) cos(x).*sin(x),-10,10,7,0)

x1 = (a+b)/2;
if func(a) * func(b) < 0,
    % eine nullstelle finden
    while abs(a - b) > 5 * 10.^(-tol-1),
        x1 = (a+b)/2;
        y1 = func(x1);
        % erweiterung des verfahrens:
        % wenn sgn(func(x1)) = sgn(func(a))
        % dann intervall [a,x1] weiteruntersuchen
        if (y1 * func(a) < 0),
            b = x1;
        else
            a = x1;
        end
    end
    % als nullstelle gilts nur, wenn
    % die toleranz erreicht ist
    if abs(func(x1)) < 5 * 10.^(-tol-1),
        y = x1;
    else
        y = [];
    end
else
    % intervall teilen und rekursiv weiterdüsen
    % (falls intervall noch oberhalb toleranz)
    % if abs(a - b) > 5 * 10.^(-tol-1),
    if (loop < 10),
        y = [
            FlorianLuethi_i10b_S3_Aufg4(func, a, x1, tol, loop+1)
            FlorianLuethi_i10b_S3_Aufg4(func, x1, b, tol, loop+1)
        ];
    else
        y = [];
    end
end

if (size(y) == 0) & (loop == 0),
    error ('Keine Nullstellen in Intervall [a,b].');

end

