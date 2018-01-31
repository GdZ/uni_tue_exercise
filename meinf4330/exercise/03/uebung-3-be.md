# Digitale Fotografie für das Web

## 3. Übung

### Zhang, Guangde 4200165

14. Eine korrekte Belichtung (unabhängig von analog oder digital) wird mit Blende 5,6, einer Empfindlichkeit von ISO/ASA 400 einer Belichtungszeit von T = 1/125 s erreicht.

    (a) Welche Belichtungszeit wird dann für Blende 2,8 und ISO/ASA 200 benötigt?

    >   Es gibt EV = log2 ( 100 * Blende² / ( ISO * Zeit ) ).

    deshalb ist Belichtungszeit 0,0041 Sekunde.

    ​

    (b) Welche Empfindlichkeit wird für Blende 4 und eine Belichtungszeit von T=1/250 s benötigt?

    >   Es gibt EV = log2 ( 100 * Blende² / ( ISO * Zeit ) ).

    deshalb die Empfindlichkeit 400(Rechnenswert ist 419) ist.

    ​

    (c) Welche Blende wird für ISO/ASA 800 und eine Belichtungszeit von T = 1/60 s
    benötigt?

    >   Es gibt EV = log2 ( 100 * Blende² / ( ISO * Zeit ) ).

    deshalb ist Blende 11,3.

    ​



15. Erklären Sie die Begriffe

    (a) Dynamikumfang eines Sensors; was ist heute ein Spitzenwert? Aus welcher Quelle beziehen Sie diese Information?

    >   aktuell max. 14,8 EV
    >
    >   Im funften Folien Seite 26 steht es.

    ​

    (b) Was sind die Vorteile, was sind die Nachteile des raw-Formates?

    >   Vorteile:
    >
    >   -   **Bildqualität**: Sämtliche vom Bildsensor erfassten Details bleiben vollständig erhalten.
    >   -   **Nachbearbeitung**: 
    >   -   Flexibilität:
    >
    >   Nachteile:
    >
    >   -   alle größeren Hersteller habe ihr eigenes raw
    >   -   dieses ändert sich auch noch von Modell zu Modell

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

    >   Belichten:
    >
    >   Film wird Licht ausgesetzt, dabei wird eine chemische Reaktion ausgelöst(Silberbromid->metallisches Sibler).
    >
    >   Entwickeln:
    >
    >   ​
    >
    >   Fixieren:
    >
    >   ​

    ​

18. Erklären Sie den Begriff Bayer-Mosaik – und wie es gelingt, in jedem Pixel alle (drei)
    Farbwerte zu haben.

    >   Bayer-Mosaik:
    >
    >   Anordnung auf Sensor
    >
    >   Das Menschliches auge ist dem grünem Licht gegenüber empfindlicher, als rot oder blau->2xGrün
    >
    >   Auflösung des Bayer Pattern durch Interpolation

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
    Priority: optional
    Section: universe/perl
    Origin: Ubuntu
    Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
    Original-Maintainer: Debian Perl Group <pkg-perl-maintainers@lists.alioth.debian.org>
    Bugs: https://bugs.launchpad.net/ubuntu/+filebug
    Installed-Size: 12,7 MB
    Provides: exiftool
    Depends: perl
    Recommends: libarchive-zip-perl
    Homepage: http://owl.phy.queensu.ca/~phil/exiftool/
    Task: ubuntustudio-photography
    Supported: 9m
    Download-Size: 2.259 kB
    APT-Manual-Installed: yes
    APT-Sources: http://ftp.uni-stuttgart.de/ubuntu xenial/universe amd64 Packages
    Description: library and program to read and write meta information in multimedia files
     Image::ExifTool is a Perl module with an included command-line application
     called exiftool for reading and writing meta information in a wide variety of
     files, including the maker note information of many digital cameras by
     various manufacturers such as Canon, Casio, FLIR, FujiFilm, GE, HP,
     JVC/Victor, Kodak, Leaf, Minolta/Konica-Minolta, Nikon, Nintendo,
     Olympus/Epson, Panasonic/Leica, Pentax/Asahi, Phase One, Reconyx, Ricoh,
     Samsung, Sanyo, Sigma/Foveon and Sony.
    ```

    ​

    (b) Mit Ihrem Universitäts-Account können Sie aus dem Universitäts-Netz oder per
    VPN Ihren bestehenden Zugang auf 134.2.2.38 nutzen; legen Sie dort in Ihrem
    Unterordner public_html zwei HTML-Dateien ab
    i. für die Meta-Daten der Datei Bild_20172_05.DNG;
    >   Durch Programm Exiftool kann man die Meta-Daten der Datei lesen

    ```shell
    exiftool Bild_20172_05.DNG
    ```

    ii. Meta-Daten einer eigenen beliebigen Datei mit mindestens 10 Attributen.
    Die Abgabe soll die Links auf diese zwei Dateien beinhalten.

    > Beispielsweise:

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