14. Eine korrekte Belichtung (unabhängig von analog oder digital) wird mit Blende 5,6,
    einer Empfindlichkeit von ISO/ASA 400 einer Belichtungszeit von T = 1/125 s erreicht.

    (a) Welche Belichtungszeit wird dann für Blende 2,8 und ISO/ASA 200 benötigt?

    >   a

    ​

    (b) Welche Empfindlichkeit wird für Blende 4 und eine Belichtungszeit von T=1/250 s benötigt?

    >   b

    ​

    (c) Welche Blende wird für ISO/ASA 800 und eine Belichtungszeit von T = 1/60 s
    benötigt?

    >   c

    ​


15. Erklären Sie die Begriffe

    (a) Dynamikumfang eines Sensors; was ist heute ein Spitzenwert? Aus welcher Quelle beziehen Sie diese Information?

    >   a

    ​

    (b) Was sind die Vorteile, was sind die Nachteile des raw-Formates?

    >   ass

    ​

16. Wir erzeugen eine Aufnahme mit einer Farbauflösung von 12 bit pro Farbkanal in
    den Formaten
    • raw
    • tiff-16
    • jpeg
    • tiff-8
    Ordnen Sie die vier Formate nach den zu erwartenden Dateigrößen.

    >   jpeg < raw < tiff-8 < tiff-16

    ​

17. Erklären Sie die Begriffe Belichten/Entwickeln/Fixieren in der analogen Fotografie

    >   a

    ​

18. Erklären Sie den Begriff Bayer-Mosaik – und wie es gelingt, in jedem Pixel alle (drei)
    Farbwerte zu haben.

    >   a

    ​

19. Auf dem Server ceres finden Sie bei den Materialen zur Veranstaltung mehrere
    Dateien der Art bild_20172_ab.xxx, wobei ab weiterzählt.
    Das konkrete Motiv ist nicht von Belang.

    (a) Installieren Sie das (nützliche) PERL-Script EXIFTOOL und machen Sie sich
    damit vertraut.
    Abgabe hierzu: Geben Sie die Information an, welche Version des Tools Sie
    verwenden und auf welchem Betriebssystem Sie es einsetzen.

    ```shell
    Package: libimage-exiftool-perl
    Version: 10.10-1
    OS: Ubuntu/16.04
    Description: library and program to read and write meta information in multimedia files
    ```

    ​

    (b) Mit Ihrem Universitäts-Account können Sie aus dem Universitäts-Netz oder per
    VPN Ihren bestehenden Zugang auf 134.2.2.38 nutzen; legen Sie dort in Ihrem
    Unterordner public_html zwei HTML-Dateien ab
    ​	i. für die Meta-Daten der Datei Bild_20172_05.DNG;
    ​	ii. Meta-Daten einer eigenen beliebigen Datei mit mindestens 10 Attributen.
    Die Abgabe soll die Links auf diese zwei Dateien beinhalten.

    >   Durch Programm Exiftool kann man die Meta-Daten der Datei lesen

    ```shell
    exiftool path_to_the_photo.jpg
    ```

    >   Beispielsweise:

    | Name                 | Value                        |
    | -------------------- | ---------------------------- |
    | Make                 | Meizu                        |
    | Compression          | JPEG (old-style)             |
    | Thumbnail Offset     | 974                          |
    | Thumbnail Length     | 0                            |
    | Image Width          | 3936                         |
    | Image Height         | 5248                         |
    | Encoding Process     | Baseline DCT, Huffman coding |
    | Bits Per Sample      | 8                            |
    | Color Components     | 3                            |
    | Y Cb Cr Sub Sampling | YCbCr4:2:2 (2 1)             |
    | Aperture             | 2.2                          |
    | Image Size           | 3936x5248                    |
    | Megapixels           | 20.7                         |
    | Shutter Speed        | 1/33                         |
    | Focal Length         | 4.8 mm                       |
    | Light Value          | 6.7                          |

    (c) Nun die umgekehrte Fragestellung: Wie können Sie alle Metadaten entfernen?

    >Man kann durch Programm Exiftool die Informationen entfernen.

    ```shell
    exiftool --TAG "-all=" path_to_the_photo.jpg
    ```

    ​