Numerik:
Zunächst haben wir die Formel iterativ implementiert in algorithmus.rb dann diese rekursiv umgestellt (numerik_rekussiv.rb) und dann innerhalb dieses Skripts mit reduce
experimentiert und herausgefunden, dass diese Methode sich sehr gut für die Implementierung von Akkumulationen eignet. Des Weiteren haben wir noch eine Exception eingebaut
um die Bedingung 0 < x <= 2 zu gewährleisten. 
  Schwierigkeiten waren hier von der Iterativen auf die Rehursive Implentierung zu schließen.

Obfuscated Ruby:
Hier war uns ziemlich schnell klar, dass wir mit der ASCII Tabelle arbeiten wollen. Da die Methode .chr nicht geht, da sie ein 'h' hat, sind wir nach einiger Recherche auf 
.pack gekommen. Haben dann noch Zahlen durch Addition dargestellt, die verbotene Ziffern enthielten.

Season:
Siehe Kommentare in season.rb