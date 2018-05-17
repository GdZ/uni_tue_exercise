# Betriebsystem

## Betriebssystem Überblick[x]

![](https://i.imgur.com/Kxwa2tW.jpg)

### Das Betriebssystem[x]

- verwaltet _die Ressourcen der Hardware_(wie z.B. _Geräte_, _Speicher_ und
  _Rechenzeit_)
- stellt _der Anwendersoftware eine abstrakte Schnittstelle_(die
  **Systemaufrufschnittstelle**) zu deren Nutzung zur Verfügung
- _isoliert die Anwendersoftware von der Hardware_: _das Betriebssystem_
  läuft _auf der Hardware_ und _die Anwendersoftware_ auf dem _Betriebssystem_
- Dadurch _vereinfacht_ es _die Nutzung der Ressourcen_ und _schützt vor
  Fehlbedingungen_
- Betriebssysteme, die es mit diesem Schutz nicht so genau nehmen,
  führen zu häufigen Systemabstürzen(system crash)

![](https://i.imgur.com/XeusBc5.jpg)


## HW-Grundlagen moderner Systeme[x]

-  _Von Neumann-Architektur_
-  Hardware-Unterstützung für Betriebssysteme dient
  -  _Effizienz_
  -  _Sicherheit_
-  Effizienz
  -  _Parallelität_
  -  _Caches_
  -  _Interrupts_
  -  _Timer_
  -  _Direct Memory Access(DMA)_
-  Sicherheit
  -  _Processor-Modes(Kernel/User)_
  -  _Traps_
  -  _(Main) Memory Management Unit(MMU)_


## Hardware Unterstützung für Effizienz[x]

- Multi-Prozessor
  - Parallele CPUs, heute Standard als Multicore
  - Hyperthreading: Parallelität zw. Speicherzugriff und CPU
- Cache
  - Zwischenspeicher, überbrücken Unterschiede in Zugriffszeiten
  - Schneller first-level Cache auf Prozessor, second-level Cache zwischen Prozessor und Hauptspeicher/Bus
- Interrupt
  - ermöglicht Parallelität zw. CPU und externem Gerät
- Direct Memory Access(DMA)
  - ermöglicht effizienten direkten Transfer zwischen Hauptspeicher
    und Geräten(z.B. Platten), parallel zur CPU


## Hardware Unterstützung für Sicherheit

- Benutzerprozess soll den Betrieb des Rechners und andere Benutzerprozesse
  nicht gefährden könnenx
- Prozessor-Modi
  - Ausschluss gewisser Prozessorinstruktionen(z.B. direkter
    Gerätezugriff, absolute Adressierung) durch Benutzerprozess
  - Prozessor unterscheidet zwischen privilegiertem und
    unprivilegiertem Zustand
    - Zustandsübergang nur auf kontrollierte Art(System Call)
- Memory Management Unit(MMU)
  - Ermöglicht jedem User "Virtual Memory" mit Adressen 0…2^k^
  - Rein privater Speicher, Größe unabhängig von realem Speicher
  - Effiziente Adressumrechnung virtuell -> real
  - Verhindert den Zugriff auf fremden Speicher


## Rechner-Architektur[x]

- Von Neumann Architektur(klassisch)

![](https://i.imgur.com/b0I6foZ.jpg)

- SISD Single Instruction, Single Data


## Einschub: Big Endian, Little Endian[x]

- Ein Integer i besteht aus 4 Bytes
  - i an Adresse n besteht aus Bytes n+0, n+1, n+2, n+3
  - Am Anfang von i ist MSB(Bits 31..24)
  - Am **Ende** von i ist LSB(Bits 7...0)
  - **Big Endian**: LSB hat Adresse n+3(big)
  - **Little Endian**: LSB hat Adresse n(little)
- Sowohl *Big Endian* als auch *Little Endian* werden benutzt
  - SUN SPARC, IBM Mainframes und Motorola 68000 sind *Big Endian*
  - Die Intel Familie ist *Little Endian*
- Problem, wenn i byteweise zwischen *verschiedenen* Computern
  übermittelt und Byte-verkehrt gelesen wird.

| Adresse | Big-Endian | Little-Endian |
| :------ | :--------- | :------------ |
| 00      | 00000000   | 00000001      |
| 01      | 00000000   | 00000100      |
| 02      | 00000100   | 00000000      |
| 03      | 00000001   | 00000000      |


## von Neumann Architektur konkret[x]

- Instruktionszyklus einer CPU
  Fundamentaler Instruktionszyklus einer CPU
  - **Fetch**: Hole den Befehl, dessen Adresse im Befehlszähler
    steht, aus dem Speicher in das Instruktionsregister.
  - **Increment**: Inkrementiere den Befehlszähler, damit er auf die
    nächste auszuführende Instruktion verweist.
  - **Decode**: Dekodiere die Instrktion, d.h. initiere den
    entsprechenden vorgefertigten Ausführungszyklus der Elektronik.
    Bei Mikroprogrammsteuerung wird hier zur passenden Teilsequenz des
    Mikroprogramms verzweigt.
  - **Fetch Operands**: Falls nötig, hole die Operanden aus den im
    Befehl bezeichneten Stellen im Speicher.
  - **Execute**: Führe die Instruktions aus, ggf. durch die ALU. (
    Bei einem Sprung wird hier ein neuer Wert in den Befehlszähler
    geschrieben.)
  - **Loop**: Gehe zu Schritt 1.


## Mikroarchitektur einer CPU[x]

- Idealisierte Mikro-Architektur einer CPU mit externem Bus

![bs_1.1.1_hwgrundlagen_ws17.pdf/11](https://i.imgur.com/Gs9W69J.png)


## Organisation der Hardware[x]

- Architektur eines einfachen Computersystems mit Bus
  - Controller bilden die digitale Schnittselle der Geräte zum Bus
    - Sie empfangen Begehle als Bitmuster in Geräteregistern
    - Sie tauschen Daten als Bitmuster über Geräteregister aus
    - Memory mapping: Geräteregister erscheinen als Memory-Adressen

![bs_1.1.1_hwgrundlagen_ws17.pdf/15](https://i.imgur.com/kMhUQwD.png)


## Multiprozessor/Architekturen[x]

- IBM Power 5 Processor

![bs_1.1.1_hwgrundlagen_ws17.pdf/21](https://i.imgur.com/h6B6waR.png)


## klassische PC Interrupt/Architektur[x]

![bs_1.1.1_hwgrundlagen_ws17.pdf/25](https://i.imgur.com/60tdg9L.png)

Achtung
- Auftrag an disk(z.B read)
- Interrupt-request IRQ über interrupt-Leitung des I/O-Busses an PIC
  (programmable interrupt controller) auf der South-Bridge
- Unterbrechung der CPU ihren interrupt-Signaleingang
- Index des benötigen Handlers über Bus an CPU


## Direct Memory Access(DMA)[x]

Funktion
- Datenübertragung von Gerät/Memory zu Gerät/Memory ohne CPU
- Traditioneller Datenfluss: Gerät 1 -> DMA controller -> Gerät 2
- fly-by mode: Gerät 1 -> Gerät 2 (z.B. Platte -> Memory)

Arbeitsweise
- CPU programmiert DMA controller(Adressen, Länge der Daten)
- DMA Controller steuert Geräte für Datenübertragung
- DMA Controller meldet Vollzug über Interrupt an die CPU

Cycle-stealing
- DMA controller belegt Bus und "stiehlt" Buszyklen von CPU

![bs_1.1.1_hwgrundlagen_ws17.pdf/29](https://i.imgur.com/QMoVxdc.png)

Operation of a DMA transfer(fly-by)


## Steps in Making a System Call[x]

![bs_1.1.1_hwgrundlagen_ws17.pdf/43](https://i.imgur.com/6AmXXWG.jpg)

There are 11 steps in making the system call read(fd, &buffer, nbbytes)
- fd = file descriptor
- &buffer = target address
- nbytes = number of bytes


## Zustands-Übergangsdiagramm[x]

- Bei Asuführung ändert sich ggf. Prozess-Zustand
- Betribssystem kontrolliert die Übergänge

![bs_1.2.1_prozesse_w17.pdf/6](https://i.imgur.com/NJicTku.jpg)


## Prozess-Zustaende in UNIX[x]

![bs_1.2.1_prozesse_w17.pdf/10](https://i.imgur.com/h1M4R3C.jpg)


## Klassische Prozess/Prioritaeten in UNIX[x]

- Ein Prozess hat 2 Prioritaeten
  - user priority (while in user mode)
  - kernel priority (while sleeping and after awakening while
    kernel mode)


## Virtueller Adressraum (klassisches UNIX)[x]

Organisation in Segmenten (Speicherbereiche gleicher Nutzungsart)

![bs_1.2.1_prozesse_w17.pdf/18](https://i.imgur.com/SxV4Cb9.jpg)


## Signale zur UNIX Interprozesskommunikation[x]

- UNIX Signale sind ein reines Software-Konzept
  - Kommunikation zwischen Prozessen via BS
  - modelliert nach Vorbild Interrupt + Interrupt-Handler
  - Prozess schickt Sig. durch Systemaufruf(oder BS schickt Sig.)
  - BS liefert Signal an Empfaenger aus
  - BS aktivert Signal-Handler des Empfaengers
- Signale informieren einen Prozess ueber **asynchrone** Ereignisse
  - User(Software-) Ereignisse: Prozess verschickt Signal(z.B.
    aufgrund Ctrl-C oder Ctrl-Z auf Tastatur, segmentation
    violation)
  - Hardware-Ereignis: Hardwarefehler(z.B. Bus-Error,  illegal
    instruction, floating point exception)

![bs_1.2.1_prozesse_w17.pdf/44](https://i.imgur.com/kn6VOUG.jpg)


## Konzept der Threads - Uebersicht

- Probleme mit Nutzung von Prozessen fuer Parallelitaet
  - Process fork ist langsam wegen Kopieren des gesamten
    Prozess-Kontexts
  - Neuer Prozess startet mit leeren memory objects im
    Hauptspeicher und leerem TLB(viele Seitenfehler)
  - Prozesswechsel leert den TLB
  - Getrennte Speicherbereiche behindem Zusammenarbeit
  - Shared memory muss ueber system call eingerichtet werden
  - Prozess-Konzept ungeeignet zur Parallelisierung des Kernels
- Grundkonzept von Threads
  - Unterstuetzung zur separaten Kontext von Daten/Files/Text


## Single-threaded vs multi-threaded Process[x]

![bs_1.2.1_prozesse_w17.pdf/31](https://i.imgur.com/F26U8dT.jpg)


## Multithreading

- BS unterstuetzt mehrere Ausfuehrungseinheiten (Threads of
  Control) innerhalb eines Prozesses
- Prozess
  - Einheit fuer allozierte Ressourcen und Schutz
    - Memory-Map und Page Tables
    - Files und I/O
    - Signal handlers, signal mask
    - IPC(inter process communication: message queues etc.)
- Thread
  - Einheit fuer die Ausfuehrung eines Funktionsaufrufs
    - (Speicherplatz fuer) Register
    - Stack
  - Ausfuehrungseinheit fuer einen (nebenlaeufigen)
    Funktionsaufruf innerhalb eines Prozesses
  - Privater HW-Kontext(Program Counter, Register)
  - Privater Stack
  - Private Schedulting-Infos
    - (Zustand, Prioritaeten) evtl. Thread-lokale statische
      Daten
  - User Thread: nur user stack(benoetigt zusaetylich kernel
    thread)
  - Kernel Thread: kernel stack (kann im kernel blockieren)

- Vorteile
  - Programm-Design: Direkte Abbildung von Nebenlaeufigkeit
  - Thread-Verwaltung schneller als Prozessverwaltung
    - Kein unnoetiges Kopieren des Speichers bei fork().
    - Kein Verlust des TLB und der Seitentabellen bei
      Kontext-Wechsel
    - Schnellere Synchronisation direkt ueber schared-Memory
      statt ueber System-Calls

- Leichter Prozess(Lightweight-Process, LWP)
  - Allgemein: Thread of Control = LWP
  - Solaris Terminologie: LWP = Kernel Thread + Appl. Context
  - Kernel-Thread: Scheduling- und Ausführungs-Einheit des Kerns
  - User-Thread: Auf Benutzerebene realisiert(Library oder JVM), unsichtbar für den Kern, wird durch kernel thread ausgeführt


## User-Threads

- BS sieht nur den Prozess
  - Nicht auf spezielle BS-Funktionalität angewiesen
  - Thread Library "einfach" ein Programm
- Implementation
  - Thread Control Block als C struct.
  - Pro Thread ein Stack-Segment(erzeugt mit `malloc()`)
  - Gesamte Thread-Verwaltung in User-Library
    - `thread_create(), thread_join(), yield(), ...`
  - Kontextwechsel über C Funktionen `setjmp()/longjmp()`
- Wichtige Thread-Libraries:
  - POSIX Pthreads
  - Win32 Threads
  - Java Threads

- Betriebssystem sieht die User-Threads nicht
  - Kein Thread-Scheduling durch BS
    - Scheduling durch User-Level Paket, evtl. applikationsspezifisch
    - Threadwechsel (yield) nur an vorgesehenen Stellen, ohne System-Call(->schnell)
  - Kein per-Thread Kernel-Stack
  - Ein oder mehrere Kernel Threads führen die User-Threads reihum aus(Nebenläufigkeit - concurrency)
  - Blockierender System-Call eines Threads blockiert im ausführenden Kernel Thread. Falls nur einer vorhanden, blockiert der ganze Prozess und daher alle Threads
    - Test nötig, ob Ressource bereit, andernfalls `yield()`
  - Echte Parallelität durch Anzahl Kernel Threads limitiert
  - Echte Parallelität (parallelism) vs. Nebenläufigkeit(concurrency)


## Kernel-Threads

- Kernel verwaltet Threads(inkl. Scheduling)
  - Per-Thread Kernel-Stack
  - Applikation in einem Prozess kann auf mehreren Prozessoren laufen
  - Kernel Thread blockiert individuell, keine Prozess-Blockade
  - Simultane System-Calls müssen möglich sein, da sonst das BS zum bottle-neck wird(-> multithreading the kernel)
- Beispiele
  - Mach(1980er Jahre)
  - Modernes UNIX (seit Mitte 1990er Jahre)
    - SUN Solaris 2, HP UX 10, AIX, Tru64, FreeBSD 5.2
    - Linux, MacOS X
  - Windows(seit NT)


## Vergleich von User- und Kernel-Threads

- Pro User-Level
  - Context Switches in User-Level Threads brauchen keinen System-Call(spart 2 Mode-Wechsel user->kernel, kernel->user)
  - Applikationsspezifisches Scheduling in User-Level Threads
  - Sehr viele Threads möglich(zehntausende)
  - Keine Anforderungen von User-Level Threads an BS
- Pro Kernel-Level
  - Kein Blockieren von anderen Threads bei System-Calls
  - Ausnutzen von mehreren Prozessoren
  - BS unterstützt Scheduling


## User- & Kernel-Threads

- Linux(>2.0.33): Sowohl User- als auch Kernel-Threads
  - Kernel-Threads über *clone* implementiert
    - clone = weiterentwickeltes fork
  - Solaris 2: ebenfalls kombinierter Ansatz
    - User verwenden Threads über User-Threads Paket
    - Schnittstelle zu Kernel Threads: "LWP"(Solaris Lightweight Process)=Kernel Thread + User Kontext
    - Für jeden Solaris-LWP genau 1 Kernel-Thread
    - Angabe der Zahl zu verwendender LWP's oder direktes Binden eines User-Threads an LWP
    - Kernel Thread alleine(ohne user Kontext) kann Kernel Code ausführen(z.B. interrupt handler)
      - Multithreaded kernel(z.B. mehrere interrupt handler simultan aktiv)


## Solaris Kernel Multi-Threading

- Interrupts durch Kernel(System) Threads behandelt
- Prozessor bekommt Interrupt
  - Laufender Thread wird unterbrochen
  - Interrupt-Handler wie gewöhnlicher Kernel-Thread(ID, Kontext, Kernel-Stack, ...)
  - Kernel kontrolliert Zugriff zu Datenstrukturen(queues, ...) über Mutual-Exclusion-Mechanismen
  - Interrupt-Thread hat höhere (Scheduling) Priorität als alle anderen Kernel-Threads und kann nur durch Interrupt-Thread mit höherer Priorität *preempted* werden.


## Solaris User-Thread & LWP States

	- user-level control block + stack
		-





