Message-ID: <38C18708.2B1D61A8@heider.de>
Date: Sat, 04 Mar 2000 22:58:32 +0100
From: Richard Heider jr <richard@heider.de>
Reply-To: lvm-howto@litefaden.com
MIME-Version: 1.0
Subject: [linux-lvm] [DE-Howto] Version 0.3 available
Content-Type: multipart/mixed;
 boundary="------------38F00D3A3D81787217808ACE"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@msede.com" <linux-lvm@msede.com>

This is a multi-part message in MIME format.
--------------38F00D3A3D81787217808ACE
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

[DE-Howto] Prolog: This mail is about the content of the German Version
of the LVM Howto;
  Therefore it will be in German. =



Hallo,

anbei mein erster Entwurf des neuen DE-Howtos im Textformat. Die anderen
Formate sind hier:
http://litefaden.com/lite00/lvm/lvm-howto-de.html
http://litefaden.com/lite00/lvm/lvm-howto-de.lyx
http://litefaden.com/lite00/lvm/lvm-howto-de.sgml
http://litefaden.com/lite00/lvm/lvm-howto-de.txt

Der erste Entwurf des deutschen Howto auf der Basis des Howto von
Klaus Franken und des englischen Howtos von Heinz Mauelshagen sowie
Mails der
Mailingliste und meinen Notizen.

Den SGML Text von Klaus konnte Lyx leider nicht importieren, weshalb
alle Tags verlorengingen :-(

Einige Kapitel existieren nur als Zusammenschnitt englischer Mails der
Mailingliste und m=FCssen noch ausgearbeitet werden.


Vor allem bei folgenden Punkten w=E4re ich f=FCr Hilfe dankbar:

- Ausarbeitung eines oder mehrerer Punkte unter 4.
- =DCbersetzung/Ausarbeitung eines oder mehrerer Punkte unter 7. Diagnose=
=2E
- Content zu Punkt 6 - der detailierten (technischen) Funktionsweise von
LVM
- Anregungen und konstruktive Kritik zur Gliederung
- Neue Punkte - vorallem unter 4
- Last but not least: Hinweise auf inhaltliche Fehler :-)

Kann jemand etwas davon =FCbernehmen? Bitte mailt mir (pers=F6nlich)
Bescheid an mailto:lvm-howto@litefaden.com
Bei Anmerkungen und Fehlerverbesserungen bitte Howto-Version (hier 0.3)
und Kapitel angeben.

cu
Richard
--
http://richard.heider.de/

"The software said it requires Win95 or better, so I installed Linux."
                                             ( http://litefaden.com/ )
--------------38F00D3A3D81787217808ACE
Content-Type: text/plain; charset=iso-8859-1;
 name="lvm-howto-de.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="lvm-howto-de.txt"



LVM (Logical Volume Manager) Howto - deutsche Version

Richard Heider \url{mailto:lvm-howto@litefaden.com}{<lvm-howto@litefaden.=
com>}

$Version$, $Date: 2000/03/04 21:13:16 $

Abstract

Der Logical Volume Manager (LVM) schafft eine virtuelle Sicht auf Festpla=
tten
und erm=F6glicht so die Anpassung und Erweiterung des Filesystems. Dieses=

Howto beschreibt die Installation und Verwaltung des LVM. Es werden
einfache und komplexe Installationen, sowie die Fehlerdiagnose behandelt.=


\tableofcontents

1 Grundlagen

1.1 Was ist LVM?

Ein grosses Problem der Systemadministration ist die bedarfsgerechte
Verteilung von Festplattenplatz auf die entsprechenden Volumes. Partition=
ierungen
k=F6nnen auf einem installierten System nur sehr aufwendig ge=E4ndert
werden, was Ver=E4nderungen und Erweiterungen erschwert. Der Logical
Volume Manager (LVM) schafft eine virtuelle Sicht auf den vorhanden
Plattenplatz und erm=F6glicht so die flexible Anpassung und Erweiterung
des Filesystems an die ver=E4nderten Anspr=FCche in einem Produktionssyst=
em. =


Der Logical Volume Driver 0.8final ist seit Linux 2.3.47 Bestandteil
des Standard Kernels.

Wesentliche Anwendungen des LVM sind Partitionen deren Gr=F6sse die einer=

Festplatte =FCbersteigt, z.B. ein grosses /home Verzeichnis oder Datenban=
k
Volumes und die Erweiterung eines Filesystems bei Platzbedarf.

1.1.1 Vorteile von LVM =


* Filesysteme und damit Dateien k=F6nnen gr=F6sser sein, als die verwende=
ten
  Festplatten =


* Es k=F6nnen viele Partitionen angelegt werden; (255 insgesamt) =


* Leichteres Verwalten von Platten, da man bei der Partitionierung
  und Definition der Filessysteme nicht so weit vorausdenken muss.
  Man bedient sich einfach aus einem Speicherplatz-Pool (Volume Group).

* Stripe Sets f=FCr schnelleren Zugriff bei mehreren Platten m=F6glich.

* Filesysteme k=F6nnen auf mehrere (SCSI) Platten verteilt werden (Stripe=

  Sets) wodurch eine besser I/O Geschwindigkeit erreicht werden kann.

* Devices k=F6nnen mit Namen versehen werden (z.B. f=FCr Kunden-ID) =


* ??? Die Benutzung von Devices ist erkennbar, Fehlerbedienung wird
  vermieden, z.B. bei raw-Devices (Was ist damit gemeint??? - richard)

* Die Filesysteme k=F6nnen dem w=E4chsenden Platzbedarf bei Bedarf angepa=
sst
  werden.

* Die Administrationsm=F6glichkeiten im laufenden Betrieb werden erh=F6ht=
,
  da einige Konfigurationen auf aktiven Volumes durchgef=FChrt werden
  k=F6nnen.

1.1.2 Nachteile von LVM =


* Nicht durch SAP freigegeben =


(Ist das noch richtig oder relevant !? - richard)

* Keine direkte Integration mit Software-Raid (MD)

(It's not a bug - it's a feature!? Habe ich die Aussagen von Heinz
bez=FCglich dieses Themas richtig verstanden? - richard )

1.2 Funktionsweise des LVM

Das Arbeiten mit LVM unterscheidet sich recht grundlegend von der Arbeit
mit normalen Partionen. Versuchen Sie sich also etwas von Ihren vorhanden=

Vorstellungen vom Umgang mit Festplatten zu l=F6sen.

Am Anfang steht nat=FCrlich auch beim LVM die real existierende Festplatt=
e
oder die Festplatten Partition. Sie wird mit Physical Volume (PV)
bezeichnet. Diese wird zu Beginn in eine Volume Group (VG) aufgenommen,
dies ist ein Pool des gesamten zur Verf=FCgung stehenden Speicherplatzes.=

Aus diesem Pool werden nun logische Volumes (LV) nach Bedarf erzeugt.
Das Betriebsystem greift nun auf diese logischen Partitionen (LV)
anstelle der reellen Partitionen (PV) zu. Der LVM hat also eine zus=E4tzl=
iche
Ebene zwischen dem physikalischen Speicher und der Ein-/Ausgabe des
Linux-Kernels geschaffen. Dies erlaubt es u.a. mehrere Platten oder
Partitionen zusammenzufassen.

Nat=FCrlich kann eine Festplatte (PV) nicht nur einem logischen Volume
(LV) zugeordnet werden. Die Verwaltung des Speicherplatzes erfolgt
in Bl=F6cken, so genannten Extents. Das physikalische Volume (PV) wird
in physikalische Extents (PE) aufgeteilt. Das logische Volume (LV)
besteht aus logischen Extents (LE). Jeder logische Block (LE) verweist
auf einen physikalischen Block (PE) gleicher Gr=F6sse.

Dies erm=F6glich die Definition von logischen Volumes, (fast) unabh=E4ngi=
g
von den zu Grunde liegenden physikalischen Volumes und erlaubt wesentlich=
e
Eingriffe, wie hinzuf=FCgen von PVs und erweitern von LVs sogar im laufen=
den
System. Das Hinzuf=FCgen von Festplatten in einem laufenden System setzt
nat=FCrlich ``Hot-Swapable'' Hardware voraus, die f=FCr den Ein- und Ausb=
au
in einem laufenden System konzipiert wurde.

Besch=E4ftigen Sie sich einen Augenblick mit den Abk=FCrzungen der versch=
iedenen
Objekte. Ein Grossteil der Dokumentation, sowie der Rest dieses HOWTOs,
verwendet ausschliesslich diese K=FCrzel. Ausserdem basieren fast alle
Programmnamen auf diesen Abk=FCrzungen.

1.3 Abk=FCrzungen

* LVM: Logical Volume Manager =


* PV: Physical Volume =3D Festplatte oder Partition

* PE: Physical Extend =3D Belegungseinheit des PV, Block

* VG: Volume Group

* LV: Logical Volume =3D virtuelle Partition ( /dev/VolumeGroupName/Logic=
alVolumeName )

* LE: Logical Extend =3D Belegungseinheit des LV, Block

* VGDA: Volume Group Descriptor Area =3D reservierter Bereich auf dem
  PV f=FCr die Datenbank mit den PE <=3D=3D> LE Zuordnungen.

1.4 Warnung

LVM ist mittlerweile ziemlich stabil, allerdings sollten Sie sich dar=FCb=
er
im Klaren sein, dass Arbeiten an der Festplattenaufteilung und am
Filesystem immer mit einem erh=F6hten Risiko verbunden sind. Daten k=F6nn=
en
verlorengehen durch Programm- und Betriebssystemabst=FCrze, Stromausf=E4l=
le
und last but not least durch Fehlbedienung von Kommandos. Also: Sichern
Sie Ihre Daten bevor Sie mit LVM arbeiten oder Volumes umkonfigurieren.

2 Erstinstallation von LVM - ein einfaches Scenario

(Dieses Kapitel gef=E4llt mir noch nicht. Die Idee ist es einem unerfahre=
nen
Admin Anfangsgr=F6ssen f=FCr die Installation einer Distribution wie Suse=

zu geben sowie eine Idee zu vermitteln in welcher Reihenfolge die
verscheidenen Vorg=E4nge stattfinden . Bitte um Input! - \url{mailto:lvm-=
howto@litefaden.com}{Richard
Heider <lvm-howto@litefaden.com>} )

2.1 Annahmen

Es soll ein PC installiert werden, mit 2 IDE Festplatten a 20 GB, die
als /dev/hda und /dev/hdb angesprochen werden. Linux ist noch nicht
installiert. Sie verwenden eine Distribution, deren Kernel bereits
mit LVM kompiliert wurde (z.B. Suse 6.3).

2.2 einfache Planung

2.2.1 Wie viele Volume Groups?

In dieser einfachen Planung sollen nur zwei M=F6glichkeiten in Betracht
gezogen werden. Weitergehende =DCberlegungen finden Sie im Kapitel ``komp=
lexere
=DCberlegungen und Planungen''.

Auf vielen ``einfachen'' Servern wird es sinnvoll sein alle physikalische=
n
Platten in eine Volume Group zu nehmen, vorallem, wenn Sie keine Verf=FCg=
barkeitsunterscheidung
zwischen den Verzeichnissen treffen. Sinnvoll ist es sicher gesonderte
Volume Groups anzulegen f=FCr ``billigen'' IDE Speicherplatz und ``perfor=
manterem''
SCSI Speicherplatz oder Speicherplatz auf einem redundanten Hardware
Raid.

2.2.2 Aufteilung der Filesysteme

Linux ben=F6tigt zum booten mindestens ein boot volume, das nicht auf
LVM basiert. (F=FCr Details siehe Kapitel ``Booten von einem logical
Volume''.) Es empfiehlt sich aber auch das root volume auf einer gew=F6hn=
lichen
Partition zu haben.

Die Gr=F6sse des boot volumes sollte zwischen 20- 30 MB liegen, die des
root volumes ca. zwischen 300-500 MB. (Dies ist nat=FCrlich nur als
grober Anhaltspunkt zu verstehen, das die exakte Gr=F6sse nat=FCrlich
und Ihrem installierten System abh=E4ngt. Die hier angegeben Gr=F6ssen
beziehen sich auf eine umfangreiche Installation der Suse 6.3.) Die
Planung f=FCr einen einfachen Server mit 40 GB Plattenplatz k=F6nnte also=

wie folgt aussehen:

+--------------------+---------+------------------+
|    Filesystem      | Gr=F6sse  |    Mountpoint    |
+--------------------+---------+------------------+
+--------------------+---------+------------------+
|     /dev/hda2      | 470 MB  |        /         |
+--------------------+---------+------------------+
|     /dev/hda1      |  30 MB  |      /boot       |
+--------------------+---------+------------------+
|  /dev/vg01/lvol1   | 1,5 GB  |       /usr       |
+--------------------+---------+------------------+
|  /dev/vg01/lvol2   | 500 MB  |       /opt       |
+--------------------+---------+------------------+
|  /dev/vg01/lvol3   |  10 GB  |      /home       |
+--------------------+---------+------------------+
|freier Plattenplatz | 27,5 GB | (wird bei Bedarf |
|                    |         | zur  Erweiterung |
|                    |         | der    vorhanden |
|                    |         | LVs verwendet)   |
+--------------------+---------+------------------+
|                    |         |                  |
+--------------------+---------+------------------+


(oops - irgendwas unterst=FCtzt hier wohl keine Tabellen auf dem Weg
von lyx zu html- richard)

2.3 Vorgehensweise

(Im Beispiel werden nur die relevanten Optionen der Befehle erw=E4hnt.
F=FCr die komplette Syntax siehe die Man Pages.)

2.3.1 Betriebsystem Installation und Partitionieren der Festplatten.

Installieren Sie Ihr Linux entsprechend der Anleitung Ihrer Distribution.=

In unserem Scenario partitionieren wir die Festplatten wie folgt:

+-------+-----------+---------+----------------------+
|Platte | Partition | Gr=F6sse  | Id/Typ der Partition |
+-------+-----------+---------+----------------------+
+-------+-----------+---------+----------------------+
| hda   | /dev/hda1 |  30 MB  |  0x83  Linux native  |
+-------+-----------+---------+----------------------+
| hda   | /dev/hda2 | 470 MB  |  0x83  Linux native  |
+-------+-----------+---------+----------------------+
| hda   | /dev/hda3 | 19,5 GB |    0x8e Linux LVM    |
+-------+-----------+---------+----------------------+
|       |           |         |                      |
+-------+-----------+---------+----------------------+
| hdb   | /dev/hdb1 | 100 MB  |  0x82  (Linux swap)  |
+-------+-----------+---------+----------------------+
| hdb   | /dev/hdb2 | 19,9 GB |    0x8e Linux LVM    |
+-------+-----------+---------+----------------------+


(nochmal oops -> irgendwas unterst=FCtzt hier wohl keine Tabellen auf
dem Weg von lyx zu html- richard)

fdisk 0x8e partition

2.3.2 vgscan

Der erste Aufbau von vgscan aktiviert die LVM Funktionalit=E4t im Kernel,=

da die noch nicht vorhandene lvm Datenbank angelegt wird. Dieser Schritt
ist in unserem Scenario zwingend, da es sich um ein neu installiertes
System handelt.

vgscan

2.3.3 pvcreate <Partition >

Der Befehl pvcreate legt den VGDA Block auf dem PV an. Er muss f=FCr
jedes PV ausgef=FChrt werden, bevor es von LVM verwendet werden kann:

pvcreate /dev/hda3

pvcreate /dev/hdb2

2.3.4 vgcreate <VolumeGroup> <Partition>

Jetzt legen wird unsere Volume Group an und nennen sie ``vg01'':

vgcreate vg01 /dev/hda3 /dev/hdb2

2.3.5 lvcreate -L<Gr=F6sse> -n <LogicalVolumeName> <Volume Group>

Hier legen wir jetzt alle unsere logischen Volumes an. Als Namen verwende=
n
wir, etwas fantasielos, lvol1, lvol2 und lvol3. Dabei bedienen wir
uns mit dem Plattenplatz auf Volume Group vg01, der einzigen Volume
Group in diesem Beispiel. Es ist offensichtlich, dass wir hier nicht
mehr Plattenplatz ``verteilen'' k=F6nnen, als wir bei vgcreate in die
Volume Group ``hineingesteckt'' haben, und zwar in Form der beiden
Partitionen.

lvcreate -L 1500M -n lvol1 vg01

lvcreate -L 500M -n lvol2 vg01

lvcreate -L 10G -n lvol3 vg01

2.3.6 mke2fs <LogicalVolumeName>

Ab jetzt k=F6nnen die logischen Partitionen, genau so wie gew=F6hnliche
Partitionen, =FCber Ihre Device Files angesprochen werden.Gew=F6hliche
Partitionen werden mit /dev/sd[a-z]* oder /dev/hd[a-z]* bezeichnet;
Logische Volumes werden mit /dev/VolumeGroupName/LogicalVolumeName
angesprochen.
Mit mke2fs legen wir die ext2 Filesysteme an:

mke2fs /dev/vg01/lvol1

mke2fs /dev/vg01/lvol1

mke2fs /dev/vg01/lvol1

2.3.7 mv <existierendes_Verzeichnis> <existierendes_Verzeichnis>.old

2.3.8 mount <LogicalVolumeName> <Verzeichnis>

mount /dev/vg01/lvol1 /mnt

2.3.9 cp -avx <Verzeichnis>.old <Verzeichnis>

2.3.10 fstab anpassen

3 Arbeiten mit LVM

Hier werden die wesentlichen Administationsvorg=E4nge beschrieben.

3.1 Booten

Ev. das LVM-Modul laden / pr=FCfen. =


Normalerweise k=F6nnen die gespeicherte LVM-Konfiguration in den Dateien/=
Verzeichnissen
/etc/lvmtab, /etc/lvmconf, /etc/lvmtab.d wieder benutzt werden: =


vgchange -a y

Sollte die gespeicherten Daten korrupt oder nicht vorhanden sein (z.B.
weil eine Platte in ein fremdes System eingebaut wird) k=F6nnen alle
potentiellen PV's (alle SCSI- und IDE-Platten, Loop-Devices etc.)
gescannt werden. =


vgscan -v

Danach ebenfalls mit vgchange -a y aktivieren. =


3.2 Shutdown

LVM mu=DF sauber abgeschlossen werden, damit ein Wiederherstellen sp=E4te=
r
m=F6glich ist. =


 =


Zuerst sind alle Filesysteme auf den LV's zu unmounten. Es d=FCrfen keine=

ge=F6ffneten LV (gemountete Filesysteme, Swap etc.) exitieren. =


Danach die VG als gesamtes deaktivieren: =


vgchange -a n

3.3 Anpassen der ext2 Gr=F6sse

3.4 Vergr=F6ssern eines Logischen Volumes

extend /dev/test_vg/test_lv to 1600MB with relative size by

"lvextend -L+100 /dev/test_vg/test_lv"

or with absolute size by

"lvextend -L1600 /dev/test_vg/test_lv"


Extending a LV

lvextend -L+3G /dev/vg01/lvol01

e2fsadm -L+3G /dev/vg01/lvol01

(Das Programm resize2fs gibt es bei www.powerquest.com)

eventuell /var/state/nfs/devtab anpassen falls nfs freigabe bestand.
(Warum???)

3.5 Verlagerung auf eine andere PV

Situation: VG vg00, PV /dev/loop7, LV: test =


 =


Aufgabe: Verlagerung der PV auf /dev/hda1 im Online-Betrieb. =


 =


 =


 =


(Mit fdisk Partition-ID von hda1 auf 0xfe setzen)

pvcreate -v /dev/hda1

vgextend -v vg00 /dev/hda1

pvmove -v /dev/loop7 /dev/hda1

vgreduce -v vg00 /dev/hda1

3.6 Anlegen eines Swap-Devices

50 MB Swap in vg00 =


lvcreate -L50M -n swap1 vg00

mkswap /dev/vg00/swap1

/dev/vg00/swap1


Eintrag in /etc/fstab: =


/dev/vg00/swap1         swap                    swap    defaults        0=
 0

3.7 Anlegen einer LV mit Stripes

vgextend vg00 /dev/loop7

lvcreate -i 2 -L20M -n striped vg00

3.8 Umbenennen einer VG

VG vg00 wird zu myvg umbenannt. =


vgchange -a n vg00

vgrename vg00 myvg

vgchange -a y myvg

3.9 Ex- und importieren von VG's

Bsp: VG tmpvg wird in ein anderes System =FCbertragen =


vgexport tmpvg


Ab jetzt ist die VG tmpvg im System nicht mehr sichtbar. Man sollte
sich vorher gemerkt haben, auf welchem Device sie vorhanden war! =


Auf dem neuen System, kann die VG (unter Angabe eines neuen Namens)
aus dem Device importiert werden (im Beispiel als newvg von /dev/loop7: =


vgimport newvg /dev/loop7

3.10 Test mit Loop-Devices

 =


Will man LVM testen, ohne Umpartitionieren zu m=FCssen, kann man Loop-Dev=
ices
verwenden. F=FCr den produktiven Einsatz empfiehlt sich das nat=FCrlich
nicht. =


 =


Mit Loop-Devices kann man auf normale Dateien im Filesystem wie auf
ein Block-Device zugreifen. Siehe man losetup. =


 =


Anmerkung: =


 =


 =


LVM erkennt anscheinend nur /dev/loop7 =


 =


Eine Volume-Group (VG) mu=DF mindestens 20 MB gro=DF sein

 =


Einrichtung: =


 =


 =


Datei in bestimmter Gr=F6=DFe anlegen: =


 =


dd if=3D/dev/zero of=3D/tmp/lvmtest/loop bs=3D1024 count=3D21000 =


 =


 =


Loop-Device konfigurieren: =


 =


losetup /dev/loop7 /tmp/lvmtest/loop

 =


Jetzt kann man auf /dev/loop7 wie auf ein normales Block-Device zugreifen=
=2E
Wird /dev/loop7 nicht mehr gebraucht, mit =


 =


 =


Loop-Device konfigurieren: =


 =


losetup -d /dev/loop7 =


 =


die Verbindung l=F6sen; danach kann die Datei /tmp/lvmtest/loop gel=F6sch=
t
werden. =


 =


3.11 Vorbereiten der Physical Volume (pvcreate)

 =


Ein Physical Volume (PV) kann eine Festplatten-Partition, eine gesamte
Platte, ein Loop-Device, ein MD-Device oder eine beliebiges anderes
Block-Device sein. =


 =


Das PV mu=DF vor Benutzung durch LVM formatiert werden, d.h. gewisse
Datenstrukturen werden darin abgelegt. =


 =


Wenn eine Partition benutzt wird, mu=DF der Partitionstyp mit fdisk auf
0x8E gesetzt werden. Dies dient lediglich dazu, da=DF die Partition
nicht =FCber andere Wege (z.B. Filesystem) benutzt wird. =


 =


Aufruf von pvcreate: =


 =


 =


pvcreate /dev/loop7

 =


Falls sich dort schon ein PV konfiguriert wurde, zum =DCberschreiben
ev. Parameter -f oder -ff angeben. =


 =


3.12 Anlegen einer Volume Group (VG)

 =


Einer Volume Group mu=DF beim Anlegen mindestens ein PV zugef=FCgt werden=
,
weitere k=F6nnen sp=E4ter hinzugef=FCgt werden. =


 =


Anlegen einer VG mit dem Namen vg00: =


 =


 =


vgcreate -v vg00 /dev/loop7

 =


3.13 Anlegen und Benutzen eines Logical Volume (LV)

In einer gegebenen VG k=F6nnen mehrere Logical Volume's (LV) angelegt
werden. =


Ohne spezielle Parameter wird irgendwo freier Platz belegt. Normalerweise=

werden die PV's nacheinander, m=F6glichst aneinanderh=E4ngend aufgef=FCll=
t. =


Wird keine Name f=FCr das LV angegeben, vergibt LVM automatisch einen
(lvol1, lvol2, ...) =


Die Gr=F6=DFe der LV wird durch -L gefolgt von einer Zahl mit dem Zusatz
K, M oder G (f=FCr Kbyte, MByte, GByte) angegeben. =


Beispiel: LV mit dem Namen test mit 10 MB in der VG vg00: =


lvcreate -v  -L10M -n test vg00

LVM legt damit ein Block-Device /dev/vg00/test an, auf das jetzt normal
zugegriffen werden kann: =


mkfs -t ext2 /dev/vg00/test

mount /dev/vg00/test /tmp/lvmtest/mnt0

(... und/oder fstab Eintrag)

3.14 Hinzuf=FCgen eines PV zu einer VG

Create/Set PArtion to ID LVM Partition

pvcreate /dev/???

vgcreate vg0x /dev/??? oder vgextend vg0x /dev/???

3.15 Entfernen eines PV aus einer VG

pvmove /dev/???

vgreduce vg0x /dev/???

3.16 Viewing stuff

vgscan -v (vg database aktualisieren)

lvscan -v =


pvscan -v

3.17 ... (Notizen - noch einzuarbeiten!? - richard)

Ausblick

Version LVM 0.8 soll auch Mirror unterst=FCtzen. =


Wenn das Tool resize2fs (Ted Tso/Powerquest) vorhanden ist, k=F6nnen
LV mit ext2-Filesystem dynamisch vergr=F6=DFert / verkleinert werden.
Bsp: =


e2fsadm -L+100 /dev/test_vg/another_test_lv


6. extend /dev/test_vg/test_lv to 1600MB with relative size by

   "lvextend -L+100 /dev/test_vg/test_lv"

   or with absolute size by

   "lvextend -L1600 /dev/test_vg/test_lv"

 =


7. reduce /dev/test_vg/test_lv to 900 logical extents with relative
extents by

   "lvreduce -l-700 /dev/test_vg/test_lv"

   or with absolute extents by

   "lvreduce -l900 /dev/test_vg/test_lv"

 =


9. rename a VG by deactivating it with

   "vgchange -an test_vg"   # only VGs with _no_ open LVs can be deactiva=
ted!

   "vgrename test_vg whatever"

   and reactivate it again by

   "vgchange -ay whatever"

 =


9. rename a LV after closing it by

   "lvchange -an /dev/whatever/test_lv" # only closed LVs can be deactiva=
ted

   "lvrename  /dev/whatever/test_lv  /dev/whatever/whatvolume"

   or by

   "lvrename  whatever test_lv whatvolume"

   and reactivate it again by

   "lvchange -ay /dev/whatever/whatvolume"

 =


10. if you own Ted Tso's/Powerquest's resize2fs program, you are able
to

    resize the ext2 type filesystems contained in logical volumes without=


    destroyiing the data by

    "e2fsadm -L+100 /dev/test_vg/another_test_lv"

3.17.1 weitere unverarbeitete Clips

If for example the capacity of a LV gets too small and your VG containing=


this LV is full, you could add another PV to that VG and simply extend

the LV afterwards.

If you reduce or delete a LV you can use the freed capacity for different=


LVs in the same VG.


The above scenario looks like this:

/------------------------------------------\
|  /--PV2---\      VG 1      /--PVn---\    |
|  |-VGDA---|                |-VGDA-- |    |
|  |PE1PE2..|                |PE1PE2..|    |
|  |        |     ......     |        |    |
|  |        |                |        |    |
|  |    /-----------------------\     |    |
|  |    \-------LV 1------------/     |    |
|  |   ..PEn|                |   ..PEn|    |
|  \--------/                \--------/    |
\------------------------------------------/

PV 1 could be /dev/sdc1 sized 3GB

PV n could be /dev/sde1 sized 4GB

VG 1 could be test_vg

LV 1 could be /dev/test_vg/test_lv

VGDA is the volume group descriptor area holding the LVM metadata

PE1 up to PEn is the number of physical extents on each disk(partition)

 =


Configuration steps for getting the above scenario:

4 komplexere =DCberlegungen und Konfigurationen

4.1 Verwenden von mehr als einer Volumegroup

(Inhalt: =DCberlegungen warum man das tun will und wie man sich seine
Volume Groups organisiert. - richard)

4.2 Booten von einem logical Volume

Can i have my root filesystem in a logical volume? =


Yes you can. There's basic support since LVM 0.7 to create an initial
ram disk containing the necessary

executables, device specials etc. to switch to a logical volume containin=
g
a root filesystem. See script

lvmcreate_initrd(8). =


       lvmcreate_initrd creates a new compressed initial  ramdisk

       in /boot/initrd.gz.  The initial ramdisk contains all nec=AD

       essary binaries, shared libraries and a  linuxrc  file  to

       switch  to  a  logical  volume  based root filesystem.  To

       build an initial ramdisk for a not running  but  generated

       kernel add the KernelVersion parameter (for eg. 2.3.25) on

       the command line.

 =


       The necessary actions to change your system into  a  "root

       on logical volume" one are:

 =


       Create  a  small (~20MB) partition which is bios reachable

       to hold the /boot filesystem (if you already have a  small

       partition based root filesystem this can as well be used).

       If you like to standalone boot from this partition in case

       of an emergency, copy all necessary binaries and libraries

       to that filesystem as  well  and  create  a  corresponding

       /etc/lilo.conf   entry.  In  order  to  be  able  to  edit

       lilo.conf in case you booted standalone, you  should  move

       /etc/lilo.conf  to  /boot/lilo.conf  and create a symbolic

       link to it in /etc instead.  This is  not  needed  if  you

       have  a  boot/root  floppy which contains the LVM binaries

       and the library in addition.

 =


       Create all logical volumes you need (for  root,  usr,  opt

       etc.), create filesystems in them, mount them and transfer

       all files from the partition based  filesystems  into  the

       logical volumes based ones.

 =


       You have to setup your /etc/lilo.conf with a boot configuration li=
ke:

 =


       image =3D /boot/vmlinuz

       initrd =3D /boot/initrd.gz

       root =3D /dev/YourVG/YourRootLV

       label =3D rootonlv

       append =3D "ramdisk_size=3D8192"

 =


       Replace  YourVG and YourRootLV by your actual volume group

       and root logical volume names.  In addition to  that  your

       /etc/fstab in your root logical volume has to contain:

 =


       /dev/YourVG/YourRootLV       /     ext2   defaults   0   1

       /dev/YourBootPartition       /boot ext2   defaults   0   2

       /dev/YourVG/YourUsrLV        /usr  ext2   defaults   0   3

       /dev/YourVG/YourOptLV        /opt  ext2   defaults   0   4

       etc. =


You  can  use  other  supported  filesystem  types as well

       (reiserfs for eg.) in case you generated support for those

       into your kernel.  Run lilo, reboot and try...

 =


       The  partitions  containing  the  former  /usr,  /opt etc.

       filesystems can now be used as  physical  volumes.  pvcre=AD

       ate(8) them and add them for eg. to YourVG.      =


       lvcmcreate_initrd  return 0 for success.  1 is returned in

       all other cases.    =


4.3 LVM Stripe Sets

(Bei IDE Platten bringen Stripe Sets nur bedingte Geschwindigkeitsvorteil=
e,
da auf Master und Slave Platte nicht gleichzeitig zugegriffen werden
kann.)

4.3.1 Umwandeln eines non-striped LVM in ein striped LVM

4.3.2 My striped logical volume works horrible slow. =


If you put it on two or more physical volumes based on partitions on
one disk, you are not able to gain performance. You are allowed to
use two or more partitions of one disk as physical volumes (this only
makes sense for next free allocated logical volumes on those physical
volumes). If you have attached two IDE disks to one adapter, you can't
get parallel i/o on these two disks. =


4.3.3 Question about order of drives in a lvm volume =


please try "lvdisplay -v /dev/YourVG/YourLV | less" and have a look
at the

information about distribution of the volume over the physical volumes.

 =


Tell me if that answers your question.

 =


BTW: if your RAID0 volume is spread over all the disks, you can't remove

     a disk because you can't remove a stripe without destroying the tota=
l

     volume.

 =


Regards,

Heinz

 =


> Hello,

> =


> first I'd like to say a big thank you to Heinz for LVM, great work,
keep it

> up!

> =


> I have a hopefully simple question:

> =


> I'm using quite a few ide-drives in a raid0 volume (hda -> hdh) and
I came

> to think of that it would be good to know in which order I added
the drives

> to the volume in case I need to remove one from the volume, is there
any way

> I can get the order in which the drives are placed in the raid0 volume?=

(in

> a list like hda, hdc, hdb, hdg, ... etc)

4.4 Spiegelung von LVM Volumes

[...] that there are not currently plans for mirroring LEs to PEs precise=
ly
because this functionality is provided by md or RAID hardware.


The LVM covers the dynamic allocation of storage.

Either RAID soft- or hardware covers the redundancy.

 =


IMO you get a much simpler systemarchitecture this way which is much

more reliable for day to day production.

 =


IOW: it saves your money.

 =


> MD is the kernel RAID facility, and provides mirroring (RAID 1) in
kernel

> software.  It provides several other RAID versions as well.

 =


Exactly. RAID4+5 are the other ones.

> What you're asking is can LVM be used in conjunction with MD, and
is this

> the correct solution or is LVM/MD going to merge or LVM duplicate
MD's

> work??

Yes.  LVM on MD works great.  I have a 4 disk

RAID 5 that I run LVM on to chop up into more managable

chunks.  40GB for a single FS is a bit excessive.  I

do this with the new raid 0.90.  I've never tried

it with the kernel standard raid, but I think I've

seem success reports.

        Applying the LVM patch and the raid0.90 patch

gets you some errors in ll_rw_block.c, but if you know

C, you can pretty much figure out how to patch it by

hand.  If anyone wants to do this and needs help with

the patches, I'd be happy to help.

        LVM on top of MD is great.  I get redundancy

and managability.

------------------------------------------------------------

> The MD functionality has only just matured, how is this to be moved

> forward into 2.4?

 =


Today there's MD concat and RAID0 only in 2.3.x.

 =


> Is the MD functionality being rolled into LVM?

 =


No.

 =


I don't like to create moster ;-{)

A modular approach is better by far (see below).

 =


> What

> about duplication of effort.... I take it that large portions of
code can

> be shared?

 =


No. It's not a question of large portions of code.

Basically supporting RAID0 in LVM is fairly simple and gives

you the choice for performance on which lower layer software

or hardware solution..

 =


> =


> I am told that LVM supports only linear and RAID0 which is hardly

> useful...

 =


This is a misleading statement.

 =


Actually it's a question of how to layer several functional parts

on each other.

LVM basically gives you the flexibility of online resizing everything.

 =


MD is the software solution which can be stacked below LVM to enable

software RAID1/4/5.

 =


OTOH you are able to use dedicated hardware RAID subsystems instead

which are easier to administer and LVM on top of them to get the flexibil=
ity

to resize.

 =


IOW: MD is one solution to address disk subsystem redundancy,

     hardware RAID subsystems is another.

     Volume Management sits on top of one of these

     (or even on mixed configurations).

     It can sit on top of multiple non redundant disks as well.

 =


> I appreciate that this is a work in progress but with 2.4 on the

> horizon can we really justify dropping a well tested and functional
system

> for somthing without the major functionality of MD?

 =


Nobody wants to drop MD AFAIK!

 =


Heinz

 =


> =


> Perhaps somone can let me know how they see this moving forward?

> =


> On Thu, 24 Feb 2000, Michael Loftis wrote:

> =


> > MD has been unsupported since the 2.2 series of kernels (it wasn't

> > marked as such because nobody realised this until the 2.2.13->2.2.14

> > patch.

> > =


> > Since everyone has been asking about it I figured I'd let everyone
know.

> > =


> > If someone wants to pick it up drop by l-k and check and see if
anyone

> > ahs yet.

> > =


4.5 Andere Filesysteme und LVM

>  the reiserfs documentation says that reiserfs is incompatible with

> software raid due to conflicts in buffer page usage; is this also

> true for reiserfs & LVM?

 =


No, it isn't. Reiserfs works fine with LVM.

4.6 RAW Devices mit LVM

4.6.1 Anlegen eines RAW devices

4.7 LVM deaktivieren

http://sdb.suse.de/sdb/de/html/lvm.html

Bezieht sich auf

 =


SuSE Linux: Version 6.3

 =


Symptom:

 =


Sie haben in YaST den Punkt "Logical Volume Manager konfigurieren"
ausgew=E4hlt. Die darauf folgende Frage haben Sie mit "Nein" beantwortet.=


Jedoch sucht der LVM beim Booten immer nach Logical Volumes. =


 =


Ursache:

 =


Ein Fehler sorgt daf=FCr, da=DF auch beim Beantworten der obigen Frage
mit "Nein" der LVM beim Booten gestartet wird. =


 =


L=F6sung:

 =


L=F6schen Sie einfach die Datei /etc/lvmtab und das Verzeichnis /etc/lvmt=
ab.d.
Auf der Kommandozeile k=F6nnen Sie das als root folgenderma=DFen

machen: =


 =


rm -r /etc/lvmtab*

 =


Jetzt wird beim Booten nicht mehr nach Logical Volumes gesucht. =


4.8 Mehrere (LVM) Partitionen auf einer Festplatte

For testing purposes you can use more than one partition on a disk.

You should not use more than one partition because in the case of

a striped LV you'll have a performance breakdown.

5 Installieren der Sourcen

5.1 Patchen des Kernels

Das Patchfile, hier /tmp/linux-2.2.12.lvm-0.8i.patch, ist in der Source-D=
istribution
von LVM enthalten. Patch einspielen mit: =


cd /usr/src/linux

patch -p1 < linux-2.2.12.lvm-0.8i.patch

make oldconfig

LVM kann auch als Modul gebaut werden, es sollte auch die /proc-Filesyste=
munterst=FCtzung
aktiviert werden: =


*

* Additional Block Devices

*

Logical volume manager (LVM) support (CONFIG_BLK_DEV_LVM) [N/y/m/?]
(NEW) m


CONFIG_BLK_DEV_LVM:


This driver lets you combine several hard disks, hard disk partitions

or even multiple devices into a volume group. Imagine a volume group
as

a kind of virtual disk. Logical volumes, which can be thought of as

virtual partitions, can be created in the volume group.

You can resize volume groups and logical volumes after creation time,

corresponding to new capacity needs. Logical volumes are accessed as

block devices named /dev/VolumeGroupName/LogicalVolumeName.

For details see /usr/src/linux/Documentaion/LVM-HOWTO.

To get the newest software see <http://linux.msede.com/lvm>.

Logical volume manager (LVM) support (CONFIG_BLK_DEV_LVM) [N/y/m/?]
(NEW) M

LVM information in proc filesystem (CONFIG_LVM_PROC_FS) [N/y/?] (NEW) Y

Nachdem dieser Kernel aktiv ist, kann das LVM-Modul durch modprobe
lvm geladen werden, siehe /var/log/messages und lsmod. =


Damit das LVM-Modul automatisch geladen werden kann, in /etc/conf.modules=

eintragen: =


alias block-major-58      lvm

alias char-major-109      lvm

5.2 Compilieren der LVM-Tools

5.3 Benutzen des lvm-RPM =


6 Funktionsweise von LVM (detailiert)

Aus logischer Sicht stellt LVM ein Block-Device, z.B. /dev/vg00/test
zur Verf=FCgung. Das Block-Device ist in Bl=F6cke zu 4MB (per Default)
unterteilt, sogenannte Logical Extents (LE). =


 =


Die PV's sind genauso in Bl=F6cke zu 4MB unterteilt, sogenannte Physical
Extents (PE). =


 =


LVM erstellt (und pflegt) intern eine Tabelle, in der jeder LE eine
PE zugeordnet wird. =


 =


Bsp: =


 =


 =


$ lvdisplay -v /dev/vg00/test  =


--- Logical volume ---

LV Name               /dev/vg00/test

VG Name               vg00

LV Write Access       read/write

LV Status             available

LV #                  1

# open                1

LV Size               12 MB

Current LE            3

Allocated LE          3

Allocation            next free

Read ahead sectors    120

Block device          58:0

 =


--- Distribution of logical volume on 1 physical volume  ---

PV Name                  PE on PV     reads      writes

/dev/loop7               3            9          440      =


 =


--- logical volume i/o statistic ---

9 reads  440 writes

 =


--- Logical extents ---

LE    PV                        PE     reads      writes

00000 /dev/loop7                00004  7          440      =


00001 /dev/loop7                00005  0          0        =


00002 /dev/loop7                00006  2          0        =


7 Diagnose

7.1 Was bedeuten die Ausgaben der einzelnen display Befehle?

7.2 Warum kann ich keine Volume Group ``mygroup'' anlegen?

M=F6gliche Ursachen:

* Sie k=F6nnen keine Volume Group anlegen, derren Namen es schon gibt.

* Sie k=F6nnen augenblicklich nicht mehr als 99 Volume Groups anlegen.

* Sie k=F6nnen nur initialisierte Physical Volumes verwenden (siehe pvcre=
ate(8).

7.3 Why can't i create a physical volume with pvcreate(8)? =


                  Remember to set the partition system id to 0x8e with fd=
isk(8) before
trying pvcreate(8) on it (previous versions

                  of LVM used partition id 0xfe). =


 =


                  Maybe pvcreate(8) complains that the physical volume ha=
s already been
initialized. You can force the

                  operation by using the "pvcreate -f[f] ..." option. =


                  Be careful: Don't try this if the physical volume belon=
gs to another
volume group! =


 =


 =


7.4 Why am i not able to extend a logical volume? =


 =


                  Your volume group is full or you've already reached the=
 maximum logical
volume size in that volume group.

                  Logical volume size is limited by the size of the physi=
cal extents
times their maximum amount, which only can

                  be set at volume group creation time. =


 =


                  The default physical extent size is 4MB which limits ;-=
) logical volumes
to a maximum of 256 Gigabyte (see

                  vgcreate(8), vgdisplay(8)). If your volume group isn't =
full or you
didn't reach the current logical volume size

                  limit, your logical volume may have striped or contiguo=
us allocation
policy. Have a look at the physical

                  volumes with vgdisplay or pvdisplay(8) to figure out, i=
f there are
not enough free (contiguous) physical extents. =


 =


 =


7.5 Why can't i move my logical volume(s) away from a physical volume
  with pvmove(8). =


 =


                  Look at the free space on all destination disks you wan=
t to use (or
which are implicit used) AND at the attributes

                  of the logical volumes to be moved. =


 =


                       You can't move a contiguous logical volume when th=
ere isn't enough
free contiguous space on any

                       destination disk. In this case you can think about=
 changing from contiguous
allocation policy to next free

                       and do the attribute change with lvchange(8). =


 =


                       You can't move a striped logical volume either, if=
 there isn't enough
space for the complete stripe on

                       any destination physical volume. =


 =


                       You can't move to physical volumes which are NOT a=
llocatable. Think
about changing this with

                       pvchange(8). =


 =


 =


7.6 Why am i not able to rename my volume group / logical volume? =


 =


                  You have to deactivate them before you are allowed to r=
ename them
(see lvrename(8), vgrename(8)). =


 =


 =


7.7 A LVM command was just working when my system crashed... =


 =


                  Bring your system back online and look at the volume gr=
oup backup
files in /etc/lvmconf. =


 =


                  There's at least one called /etc/lvmconf/VolumeGroupNam=
e.conf and
possible more in the backup

                  history called /etc/lvmconf/VolumeGroupName.conf.*.old.=
 You can use
these backup files to bring

                  the configuration back to the one before the crash (see=
 vgcfgrestore(8)). =


 =


 =


7.8 Why are my logical volumes limited to 256 GB in size? =


 =


                  This is NO absolute limit but it depends on the physica=
l extent size
you configured at volume group creation

                  time. =


 =


                  Please use option -s of the vgcreate command to give a =
larger physical
extent size. For example with a

                  physical extent size of 524288 KB (512 MB) you are able=
 to map a logical
volume of 32 Terabyte. Remember

                  that current Linux kernels are limited to 1 Terabyte. =


 =


 =


7.9 Why can't i split my volume group my_vg? =


 =


                  The physical volumes you want to split of into another =
volume group
may NOT have logical extents of logical

                  volumes staying in the original volume group you starte=
d with. Please
use pvmove to seperate the logical

                  volumes. =


 =


 =


7.10 Why can't i merge my two volume groups my_vg1 and my_vg2? =


 =


                  A merged volume group can't go beyond the physical or l=
ogical volume
limits of the destination volume group.

                  This means for eg. that you can't merge my_vg1 with 20 =
logical volumes
and my_vg2 with 30 logical volumes

                  getting my_vg1, if my_vg1 has a 31 logical volume limit=
=2E You are only
able to merge (up to now) volume groups

                  with equal physical extent sizes. =


 =


 =


7.11 How can i move parts of my logical volume with very intensive i/o
  to a different physical volume? =


 =


                  Please look at pvmove(8) and use the logical extent syn=
tax to do the
job. =


7.12 Why am i not able to create my 211th logical volume? vgdisplay tells=

  me about a limit of 256 logical volumes. =


                  The total amount of 256 logical volumes is shared among=
 all volume
groups. You have to delete logical

                  volumes in different volume groups to be able to create=
 the new one. =


8 Referenz

8.1 Kommandos-=DCbersicht

Prefix:

* pv

* vg

* lv =


Cmd:

* create

* remove

* display

* change

Schalter:

* -v

Exitcode:

* 0 OK

* >0 Fehler

Kommandos

* pvcreate: Anlegen (formatieren) eines PV =


* vgcreate: Anlegen einer VG =


* lvcreate: Anlegen eines LV =


* pvdisplay: Anzeige einer PV, Option -v =


* vgdisplay: Anzeige einer VG, Option -v =


* lvdisplay: Anzeige einer LV, Option -v =


* pvmove: Verschieben der PE von einer PV zu einer anderen innerhalb
  einer VG =


* lvextend: eine LV in der Gr=F6=DFe =E4ndern (macht beim Filesystem noch=

  keinen Sinn)

* Shutdown & Boot =


* vgchange -a n: Deaktivieren von VG's =


* vgscan: Suche alle potentiellen Devices nach VG's ab =


* vgchange -a y: Aktivieren von VG's =


* vgexport: Eine VG aus dem System entfernen (ohne L=F6schen) =


* vgimport: Eine exportierte VG im System einbinden

8.2 deutsche und englische Version des Howtos

Die deutsche und englische Version des LVM Howto existieren als unabh=E4n=
gige
Howtos, die allerdings immer wieder aneinander angeglichen werden.
Wir haben diese Arbeitsweise der ``=DCbersetzung in eine Richtung''
vorgezogen, da so auch deutschsprachige LVM User, die sich im Englischen
nicht so sicher f=FChlen sich besser einbringen k=F6nnen. Dies hat allerd=
ings
zur Folge, dass die Inhalte der beiden Dokumente abweichen k=F6nnen.

8.3 Quellen

* 'man lvm' und man pages der einzelnen Befehle

* Homepage von LVM: \htmlurl{http://linux.msede.com/lvm}{http://linux.mse=
de.com/lvm} =


* Archiv der LVM Mailing Liste: \htmlurl{http://linux.msede.com/lvm/mlist=
/archive/}{http://linux.msede.com/lvm/mlist/archive/} =


* SuSE Support-Datenbank: Stichwort LVM: \htmlurl{http://sdb.suse.de/sdb/=
de/html/keylist.LVM.html}{http://sdb.suse.de/sdb/de/html/keylist.LVM.html=
} =


8.4 Credits

Heinz Mauelshagen <linux-lvm@ez-darmstadt.telekom.de> f=FCr LVM.

Klaus Franken <Klaus.Franken@fth2.siemens.de> f=FCr Howto Version 0.2,
die Basis f=FCr die Arbeit an diesem Howto.

8.5 Author und Feedback

Feedback, Erg=E4nzungen, neue Kapitel , =DCbersetzungen von Textstellen
bitte an Richard Heider \url{mailto:lvm-howto@litefaden.com}{<lvm-howto@l=
itefaden.com>}
senden.

Bei Anmerkungen und Fehlerverbesserungen bitte Howto-Version und Kapitel
angeben.

--------------38F00D3A3D81787217808ACE--
