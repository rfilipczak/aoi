# Ćwiczenie 3.
## Funkcje i skrypty w środowisku MATLAB

### Zad1
Napisać m-pliki funkcyjne realizujące za pomocą wielkości skalarnych (iteracyjnie) wybrane jedno- i dwuargumentowe operacie macierzowe i tablicowe ([+], [*], ['], [.'], [^], [.^]). Funkcje te powinny sprawdzać rozmiary argumentów wejściowych i informować o ewentualnych nieprawidłowościach. Należy także uwzględniać możliwość występowania skalarów, czyli macierz o rozmiarach [1x1].
### Zad2
Zbudować m-plik skryptowy będący nadrzędnym programem dla stworzonych w pkt. 1 m-plików funkcyjnych. Skrypt powinien umożliwiać:
- wprowadzanie danych (argumentów) w wierszu poleceń - np. funkcja input inputdlg,
- wybór wykonywanej operacji - np. funkcja menu
- sprawdzenie poprawności wykonywanych przez m-pliki funkcyjne operacji wykorzystując wbudowane operatory macierzowe i tablicowe,
- porównanie czasochłonności operacji realizowane za pomocą m-pliku i operatora wbudowanego.

### Zad3
Napisać dwa m-pliki funkcyjne ze zmienną liczbą argumentów wejściowych i wyjściowych:
- plik obliczający sumę lub iloczyn dowolnej liczby argumentów, przy czym jako pierwszy parametr wejściowy należy uwzględnić możliwość podawania (w postaci odpowiedniego symbolu) rodzaju wymaganej operacji ([+], [*], [.*]) Program powinien sprawdzać rozmiary wprowadzanych argumentów, odrzucając te, które nie spełniają odpowiednich wymagań,
- plik wykonujący transpozycję nieokreślonej z góry liczby macierzy, przy czym w przypadku argumentów zespolonych należy dla każdego z takich argumentów poprosić użytkownika o podanie rodzaju transpozycji.

