From: TORSTEN.NEUMANN@DLH.DE
Message-ID: <13FEA0BEF75ED31192D50000F6CCC5E92AE046@XNT-FRABASE-6>
Subject: [linux-lvm] Installieren von LVM Systemen
Date: Tue, 30 Nov 1999 07:49:48 +0100
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Moin,

Sorry for writing in german, but i was not able to translate this text.

Ich bin derzeit etwas traege, daher frage ich mal hier ob jemand mit meinem
Code potentiell etwas anfangen kann. Vielleich schaffe ich es dann eine
Dokumentation zu schreiben.

Ich hab meine eigene Linuxinstallations-CD erstellt (basierend auf SuSE 6.2)
die es mir erlaubt 
- LVM Systeme (inkl. initrd und / auf einem LV) direkt zu installieren.
- Eine groessere Anzahl von Systemen gleichartig zu installieren.
- Rechnerspezifische/Sitespezifische Anpassungen zu machen.

Die Methode ist relativ simpel: Ich boote die CD. Mounte ueber NFS eine
MASTER-Verzeichniss und lass dann ein Script laufen das ein paar Fragen
stellt wie ich denn nun genau das System konfiguriert haben moechte. Und
dann wird einfach eine grosse tar Datei ausgepackt.

Die Konfigurationsdatei sieht etwa wie folgt aus:

my %image1 = (
			"image"		=>	"/install/images/ws.tar.gz",
			"description"	=>	"normal Workstation",
			"lvol"		=>	{
							/	=>	[
64, 48 ],
							/usr	=>	[
1024, 512 ],
							/tmp	=>	[
256, 0 ],
							...
						},
			"selected"	=>	1,
			"postinstall"	=>
"/install/scripts/ws.postinstall.sh"
		);

Das meint : In der ASCII Oberflaeche kann ich ein Image ws.tar.gz
auswaehlen. (welches mir in der Auswahl als "normal Workstation" angezeigt
wird), dieses ist vorselektiert ("selected"=>1). Und die Groesse der lvols
ist wie folgt /usr ist voreingestellt auf 1024MB und muss mindestens 512MB
gross sein. /tmp soll 256MB gross werden und muss keine Minimalgroesse
haben, ...
Zum Schluss der Installation wird dann noch das Script ws.postinstall.sh
aufgerufen.
( Ich kann mehrere solcher Images in meiner Konfiguration angeben, und dann
zwischen ihnen auswaehlen )
Weiterkann ich dann noch zwischen verschiedenen Kernel waehlen ( IDE-System
vs. SCSI Systeme vs. SMP Systeme )
Und Rechnerabhaengig noch weitere Archive installieren. (z.B. vmware +
vorinstalliertes NT *sigh*)
Zu guter letzt ist es auch noch vorgesehen host-spezifische Dateien (
XF86Config, ssh_host_key, ... ) automatisch zu restaurieren.

Mit dieser Methode brauch ich fuer einen unserer typischen WWW-Server etwa
10 Minuten vom ersten anschalten des Rechners bis ich ein lauffaehiges
System hab (inklusive aller sitespezifischen Anpassungen) (Das dauert nur so
lang weil ich im BIOS erstmal die Bootreihenfolge aendern muss und SCSI
Systeme so lange am booten sind. Die reine Installation dauert weniger als 5
Minuten).

So nun zu den Vorraussetungen:
- Es solte ein Rechner als NFS-Server dienen koennen (der braucht viel
Plattenplatz), es sollte aber auch alles von CD gehen (not tested)
  Ich habs nur mit NFS gemacht weil dann Aenderungen einfacher sind.
- Es sollten schon einige Rechner ( > 20 ) vorhanden sein die gleichartig
installiert werden sollen. Sonst lohnt sich der Aufwand eigentlich nicht.

Vorteile des Systems:
- Alle Rechner sind identisch konfiguriert, so dass sich der
Administrationsaufwand minimiert.
- Alle Rechner sind vollstaendig konfiguriert (z.B. die Druckerkonfig stimmt
sofort)
- Ich brauch kein Backup einzelner Rechner da ich schnell vom Master-Image
eine Neuinstallation machen kann.

Nachteile:
- Der Aufwand ein sauberes Image zu erstellen ist nicht zu unterschaetzen.

Wishlist:
- RAID1 Support ( scheitert dadran das ich es bisher nicht geschafft hab ein
RAID1 System mit initrd zum laufen zu kriegen )
- stripping support ( sollte einfach gehen, mir fiel nur bisher kein
user-interface ein. append-mode ist schon drin )
- tunen der FS/LVM-Parameter, andere FS als ext2 (ReiserFS?)
- ...

Wer Interesse dadran hat sollte sich bei mir melden, ich denke dann schaffe
ich es das ganze mal ordentlich zu dokumentieren und auf einen ftp-Server zu
legen.

Gruesse
   Torsten
