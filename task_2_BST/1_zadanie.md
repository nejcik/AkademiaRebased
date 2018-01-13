## Obowiązkowe czytanki przed zadaniem:

* https://en.wikipedia.org/wiki/Tree_(data_structure)
* https://en.wikipedia.org/wiki/Binary_tree
* https://en.wikipedia.org/wiki/Binary_search_tree

* http://phrogz.net/programmingruby/tut_classes.html

## Wymagania wstępne na komputerze

Zainstaluj:

* http://www.graphviz.org/
* Jeśli jeszcze nie masz - interpreter Rubyego, polecamy używając [https://github.com/postmodern/chruby](chruby) i [https://github.com/postmodern/ruby-install](ruby-install)
* Bibliotekę bundler (`gem install bundler`)

Ściągnij **wszystkie** pliki z tego gista na swój komputer.

## Zadanie

W pliku binary_tree.rb znajdziesz fragment kodu służący do obsługi drzewa binarnego i jego rysowania. Twoje zadanie jest następujące:

Uzupełnij metodę `self.create(array)` w taki sposób, że:

* metoda przyjmuje tablicę liczb całkowitych
* tworzy z nich zbalansowane drzewo BST
* zwróci nowo utworzone drzewo

Nie zmieniaj pozostałych linii programu.

Poprawność swojej implementacji możesz sprawdzić uruchamiając komendę `bundle` (jeden raz), a następnie plik `ruby example.rb` i porównując wygenerowany plik `tree.png` z obrazkiem:

![Imgur](https://i.imgur.com/tb0i78C.png)

## Zadanie dodatkowe (nieobowiązkowe)

### Czytanka dodatkowa

* https://semaphoreci.com/community/tutorials/getting-started-with-minitest

### Zadanie

Napisz testy do swojej implementacji używając Minitesta.

Testy umieść w pliku `binary_tree_test.rb`.

### Podpowiedź

Sprawdź czy następujące przypadki spowodując stworzenie poprawnego drzewa:

* utworzenie drzewa z pustej tablicy (wynik: obiekt z value=nil, left=nil, right=nil)
* utworzenie drzewa z tablicy jednoelementowej (wynik: obiekt z value=wartość, left=nil, right=nil)
* bardziej skomplikowany przypadek, na przykład podany w pliku `example.rb`