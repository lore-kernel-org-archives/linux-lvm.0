Message-ID: <38D547D0.C65E3B24@heider.de>
Date: Sun, 19 Mar 2000 22:34:08 +0100
From: Richard Heider jr <richard@heider.de>
Reply-To: lvm-howto@litefaden.com
MIME-Version: 1.0
Subject: [linux-lvm] [DE-Howto] V.0.4 - Bitte um Kommentare/Call for Feedback
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: "linux-lvm@msede.com" <linux-lvm@msede.com>

[DE-Howto] Prolog: This mail is about the content of the German Version
of the LVM Howto;  Therefore it will be in German. =


Guten Tag,

ich habe die n=E4chste Version des deutschen Howto ver=F6ffentlicht. Dies=
es
Dokument befindet sich noch in der fr=FChen Entwicklung. Die meisten
Beispiele sind noch nicht Korrektur gelesen, also durchaus mit Vorsicht
zu geniessen. Anmerkungen, Fehlermeldungen und Verbesserungsvorschl=E4ge
sind ausdr=FCcklich erw=FCnscht und erbeten.

Kommentare bitte an mailto:lvm-howto@litefaden.com
Bei Anmerkungen und Fehlerverbesserungen bitte Howto-Version
(augenblicklich 0.4)
und Kapitel angeben.

http://litefaden.com/lite00/lvm/lvm-howto-de.html
http://litefaden.com/lite00/lvm/lvm-howto-de.lyx
http://litefaden.com/lite00/lvm/lvm-howto-de.sgml
http://litefaden.com/lite00/lvm/lvm-howto-de.txt

Danke & cu
Richard
_____________________________________________________________________
$Revision:  0.4 $

  Table of Contents

  1. Grundlagen

     1.1 Was ist LVM?
        1.1.1 Vorteile von LVM
        1.1.2 Wer braucht LVM?
     1.2 Funktionsweise des LVM
     1.3 Abkrzungen
     1.4 Warnung

  2. Erstinstallation von LVM - ein einfaches Scenario

     2.1 Annahmen
     2.2 einfache Planung
        2.2.1 Wie viele Volume Groups?
        2.2.2 Aufteilung der Filesysteme
     2.3 Vorgehensweise
        2.3.1 Betriebsystem Installation und Partitionieren der
Festplatten.
        2.3.2 vgscan
        2.3.3 pvcreate <Partition >
        2.3.4 vgcreate <VolumeGroup> <Partition>
        2.3.5 lvcreate -L<Grsse> -n <LogicalVolumeName> <Volume Group>
        2.3.6 mke2fs <LogicalVolumeName>
        2.3.7 mv <existierendes_Verzeichnis>
<existierendes_Verzeichnis>.old
        2.3.8 mount <LogicalVolumeName> <Verzeichnis>
        2.3.9 cp -avx <Verzeichnis>.old <Verzeichnis>
        2.3.10 fstab anpassen

  3. Arbeiten mit LVM

     3.1 Booten
     3.2 Shutdown
     3.3 Anpassen der ext2 Grsse
     3.4 Vergrssern eines Logischen Volumes
     3.5 Verlagerung auf eine andere PV
     3.6 Anlegen eines Swap-Devices
     3.7 Anlegen einer LV mit Stripes
     3.8 Umbenennen einer VG
     3.9 Ex- und importieren von VG's
     3.10 Test mit Loop-Devices
     3.11 Vorbereiten der Physical Volume (pvcreate)
     3.12 Anlegen einer Volume Group (VG)
     3.13 Anlegen und Benutzen eines Logical Volume (LV)
     3.14 Hinzufgen eines PV zu einer VG
     3.15 Entfernen eines PV aus einer VG
     3.16 Viewing stuff
     3.17 Verkleinern eines LV
     3.18 Umbenennen einer Volume Group
     3.19 Umbenennen eines LV

  4. komplexere berlegungen und Konfigurationen

     4.1 Verwenden von mehr als einer Volumegroup
     4.2 Booten von einem logical Volume
     4.3 LVM Stripe Sets
        4.3.1 Umwandeln eines non-striped LVM in ein striped LVM
        4.3.2 Mein ge-striped-es LV arbeitet extrem langsam.
        4.3.3 Question about order of drives in a lvm volume
     4.4 Spiegelung von LVM Volumes
     4.5 Andere Filesysteme und LVM
        4.5.1 ReiserFS
     4.6 RAW Devices mit LVM
        4.6.1 Anlegen eines RAW devices
     4.7 LVM deaktivieren
     4.8 Mehrere (LVM) Partitionen auf einer Festplatte
     4.9 ext2 Volumes Online vergrssern
     4.10 Snapshots
  5. Installieren der Sourcen

     5.1 Patchen des Kernels
     5.2 Compilieren der LVM-Tools
     5.3 Benutzen des lvm-RPM

  6. Funktionsweise von LVM (detailiert)

     6.1 weitere unverarbeitete Clips

  7. Diagnose

     7.1 Was bedeuten die Ausgaben der einzelnen display Befehle?
     7.2 Warum kann ich keine Volume Group "mygroup" anlegen?
     7.3 Warum funktioniert das Anlegen eines Physikalischen Volumes
(PV) mit pvcreate(8)  nicht?
     7.4 Warum kann ich ein Logisches Volume (LV) nicht erweitern?
     7.5 Ich kann ein oder mehrere Logische Volumes nicht von einem
Physikalischen  Volume mit pvmove(8) wegschieben. Warum?
     7.6 Warum kann ich eine Volume Group / ein Logisches Volume nicht
umbenennen?
     7.7 Whrend eines Systemabsturzes lief gerade ein LVM Befehl. Was
nun ...?
     7.8 Warum sind Logische Volumes auf eine Grsse von 256 GB
beschrnkt?
     7.9 Warum kann ich meine Volume Group VGxy nicht aufteilen?
     7.10 Warum kann ich meine zwei VGs VGx und VGy nicht zusammenfhren
(mergen)?
     7.11 Wie kann zugriffs-intensive Teile eines LV auf ein anderes
Physikalisches  Volume verschieben?
     7.12 Ich kann ein LV nicht erstellen und vgdisplay verweisst auf
ein Limit von  256 LVs ...

  8. Referenz

     8.1 Kommandos-bersicht
     8.2 deutsche und englische Version des Howtos
     8.3 Quellen
     8.4 Credits
     8.5 Author und Feedback
--
http://richard.heider.de/

"The software said it requires Win95 or better, so I installed Linux."
                                             ( http://litefaden.com/ )
