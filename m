Message-ID: <31A612FE6020D2119F6400A0C9B67EBB116F0D@fthw901e.as.fth.sbs.de>
From: Franken Klaus <Klaus.Franken@fth2.siemens.de>
Subject: LVM Mini-Howto RE: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 0.8fi
	nal driver included in 2.3.47 (fwd)
Date: Fri, 25 Feb 2000 11:18:11 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01BF7F79.A077955B"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: "'Peter.Wuestefeld@resnova.de'" <Peter.Wuestefeld@resnova.de>, linux-lvm@msede.com

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01BF7F79.A077955B
Content-Type: text/plain;
	charset="iso-8859-1"

Hi,
Hi,


I wrote a little Mini-Howto for LVM in german. It's enough for out purposes...
I attache the HTML-Version. It is written in sgml.

I will help you and give you the sources (if you want). But I don't want to be the
maintainer of the HOWTO. 

Klaus.Franken@fth2.siemens.de    +49 911 978 3707
Siemens Business Services IP 21F


> -----Original Message-----
> From: Peter.Wuestefeld@resnova.de [mailto:Peter.Wuestefeld@resnova.de]
> Sent: Friday, February 25, 2000 10:44 AM
> To: linux-lvm@msede.com
> Subject: Re: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 0.8final driver
> included in 2.3.47 (fwd)
> 
> 
> 
> Hi all,
> 
> since I've done already a lot of course material for LVM 
> (although on AIX)
> I would suspect that I'm able to do that for LVM on Linux as well.
> 
> If there isn't already someone doing that I would like to start a
> "Beginners Guide to LVM". Any ideas on the form? Like "use 
> SGML/XML since
> all of the LDP uses that"?
> Anybody out there who wants to help me?
> 


------_=_NextPart_000_01BF7F79.A077955B
Content-Type: text/html;
	name="lvm-mini-big.html"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lvm-mini-big.html"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">=0A=
<HTML>=0A=
<HEAD>=0A=
 <META NAME=3D"GENERATOR" CONTENT=3D"SGML-Tools 1.0.9">=0A=
 <TITLE>LVM Mini-HOWTO</TITLE>=0A=
=0A=
=0A=
</HEAD>=0A=
<BODY>=0A=
<H1>LVM Mini-HOWTO</H1>=0A=
=0A=
<H2>Klaus Franken, <CODE>Klaus.Franken@fth2.siemens.de</CODE></H2>v0.2, =
01.12.1999=0A=
<P><HR>=0A=
<EM>LVM - Logical Volume Manager Mini-HOWTO</EM>=0A=
<HR>=0A=
<H2><A NAME=3D"s1">1. Einf=FChrung</A></H2>=0A=
=0A=
<P>=0A=
<P>=0A=
<H2><A NAME=3D"s2">2. Installieren der Sourcen</A></H2>=0A=
=0A=
<P>=0A=
<P>=0A=
<H2>2.1 Patchen des Kernels</H2>=0A=
=0A=
<P>Das Patchfile, hier <CODE>/tmp/linux-2.2.12.lvm-0.8i.patch</CODE>, =
ist in der=0A=
Source-Distribution von LVM enthalten. Patch einspielen mit:=0A=
<HR>=0A=
<PRE>=0A=
cd /usr/src/linux=0A=
patch -p1 &lt; linux-2.2.12.lvm-0.8i.patch=0A=
make oldconfig=0A=
</PRE>=0A=
<HR>=0A=
=0A=
LVM kann auch als Modul gebaut werden, es sollte auch die =0A=
<CODE>/proc</CODE>-Filesystemunterst=FCtzung aktiviert werden:=0A=
<HR>=0A=
<PRE>=0A=
*=0A=
* Additional Block Devices=0A=
*=0A=
Logical volume manager (LVM) support (CONFIG_BLK_DEV_LVM) [N/y/m/?] =
(NEW) m=0A=
=0A=
CONFIG_BLK_DEV_LVM:=0A=
=0A=
  This driver lets you combine several hard disks, hard disk =
partitions=0A=
  or even multiple devices into a volume group. Imagine a volume group =
as=0A=
  a kind of virtual disk. Logical volumes, which can be thought of =
as=0A=
  virtual partitions, can be created in the volume group.=0A=
  You can resize volume groups and logical volumes after creation =
time,=0A=
  corresponding to new capacity needs. Logical volumes are accessed =
as=0A=
  block devices named /dev/VolumeGroupName/LogicalVolumeName.=0A=
=0A=
  For details see /usr/src/linux/Documentaion/LVM-HOWTO.=0A=
=0A=
  To get the newest software see &lt;http://linux.msede.com/lvm>.=0A=
Logical volume manager (LVM) support (CONFIG_BLK_DEV_LVM) [N/y/m/?] =
(NEW) M=0A=
   LVM information in proc filesystem (CONFIG_LVM_PROC_FS) [N/y/?] =
(NEW) Y=0A=
</PRE>=0A=
<HR>=0A=
<P>Nachdem dieser Kernel aktiv ist, kann das LVM-Modul durch=0A=
<CODE>modprobe lvm</CODE> geladen werden, siehe =
<CODE>/var/log/messages</CODE> und=0A=
<CODE>lsmod</CODE>.=0A=
<P>Damit das LVM-Modul automatisch geladen werden kann, in =0A=
<CODE>/etc/conf.modules</CODE> eintragen:=0A=
<HR>=0A=
<PRE>=0A=
alias block-major-58      lvm=0A=
alias char-major-109      lvm=0A=
</PRE>=0A=
<HR>=0A=
<P>=0A=
<P>=0A=
<H2>2.2 Compilieren der LVM-Tools</H2>=0A=
=0A=
<P>Neu: benutze das lvm-RPM=0A=
<P>=0A=
<H2><A NAME=3D"s3">3. Vorbereiten der Physical Volumes</A></H2>=0A=
=0A=
<P>=0A=
<P>=0A=
<H2>3.1 Test mit Loop-Devices</H2>=0A=
=0A=
<P>Will man LVM testen, ohne Umpartitionieren zu m=FCssen, kann man=0A=
Loop-Devices verwenden. F=FCr den produktiven Einsatz empfiehlt sich=0A=
das nat=FCrlich nicht.=0A=
<P>Mit Loop-Devices kann man auf normale Dateien im Filesystem wie auf =
ein=0A=
Block-Device zugreifen. Siehe <CODE>man losetup</CODE>.=0A=
<P>Anmerkung:=0A=
<UL>=0A=
<LI> LVM erkennt anscheinend nur <CODE>/dev/loop7</CODE></LI>=0A=
<LI> Eine Volume-Group (VG) mu=DF mindestens 20 MB gro=DF sein</LI>=0A=
</UL>=0A=
<P>Einrichtung:=0A=
<UL>=0A=
<LI>Datei in bestimmter Gr=F6=DFe anlegen:=0A=
<P><CODE>dd if=3D/dev/zero of=3D/tmp/lvmtest/loop bs=3D1024 =
count=3D21000</CODE>=0A=
<P>=0A=
</LI>=0A=
<LI>Loop-Device konfigurieren:=0A=
<P><CODE>losetup /dev/loop7 /tmp/lvmtest/loop</CODE>=0A=
</LI>=0A=
</UL>=0A=
<P>Jetzt kann man auf <CODE>/dev/loop7</CODE> wie auf ein normales =
Block-Device=0A=
zugreifen. Wird <CODE>/dev/loop7</CODE> nicht mehr gebraucht, mit=0A=
<UL>=0A=
<LI>Loop-Device konfigurieren:=0A=
<P><CODE>losetup -d /dev/loop7 </CODE>=0A=
</LI>=0A=
</UL>=0A=
=0A=
die Verbindung l=F6sen; danach kann die Datei =
<CODE>/tmp/lvmtest/loop</CODE>=0A=
gel=F6scht werden.=0A=
<P>=0A=
<H2>3.2 Vorbereiten der Physical Volume (pvcreate)</H2>=0A=
=0A=
<P>=0A=
<P>Ein Physical Volume (PV) kann eine Festplatten-Partition, eine=0A=
gesamte Platte, ein Loop-Device, ein MD-Device oder eine beliebiges=0A=
anderes Block-Device sein.=0A=
<P>Das PV mu=DF vor Benutzung durch LVM <I>formatiert</I> werden, =
d.h.=0A=
gewisse Datenstrukturen werden darin abgelegt.=0A=
<P>Wenn eine Partition benutzt wird, mu=DF der Partitionstyp mit =
<CODE>fdisk</CODE>=0A=
auf <CODE>0x8E</CODE> gesetzt werden. Dies dient lediglich dazu, da=DF =
die=0A=
Partition nicht =FCber andere Wege (z.B. Filesystem) benutzt wird.=0A=
<P>Aufruf von <CODE>pvcreate</CODE>:=0A=
<UL>=0A=
<LI> <CODE>pvcreate /dev/loop7</CODE></LI>=0A=
</UL>=0A=
<P>Falls sich dort schon ein PV konfiguriert wurde, zum =
=DCberschreiben=0A=
ev. Parameter <CODE>-f</CODE> oder <CODE>-ff</CODE> angeben.=0A=
<P>=0A=
<H2><A NAME=3D"s4">4. Anlegen einer Volume Group (VG)</A></H2>=0A=
=0A=
<P>Einer Volume Group mu=DF beim Anlegen mindestens ein PV=0A=
zugef=FCgt werden, weitere k=F6nnen sp=E4ter hinzugef=FCgt werden.=0A=
<P>Anlegen einer VG mit dem Namen <CODE>vg00</CODE>:=0A=
<UL>=0A=
<LI> <CODE>vgcreate -v vg00 /dev/loop7</CODE></LI>=0A=
</UL>=0A=
<P>=0A=
<H2><A NAME=3D"s5">5. Anlegen und Benutzen eines Logical Volume =
(LV)</A></H2>=0A=
=0A=
<P>In einer gegebenen VG k=F6nnen mehrere Logical Volume's (LV)=0A=
angelegt werden.=0A=
<P>Ohne spezielle Parameter wird <I>irgendwo</I> freier Platz=0A=
belegt. Normalerweise werden die PV's nacheinander, m=F6glichst=0A=
aneinanderh=E4ngend aufgef=FCllt.=0A=
<P>Wird keine Name f=FCr das LV angegeben, vergibt LVM automatisch =
einen=0A=
(<CODE>lvol1</CODE>, <CODE>lvol2</CODE>, ...)=0A=
<P>Die Gr=F6=DFe der LV wird durch <CODE>-L</CODE> gefolgt von einer =
Zahl mit dem=0A=
Zusatz <CODE>K</CODE>,  <CODE>M</CODE> oder  <CODE>G</CODE> (f=FCr =
Kbyte, MByte, GByte)=0A=
angegeben.=0A=
<P>Beispiel: LV mit dem Namen <CODE>test</CODE> mit 10 MB in der VG =
<CODE>vg00</CODE>:=0A=
<HR>=0A=
<PRE>=0A=
lvcreate -v  -L10M -n test vg00=0A=
        =0A=
</PRE>=0A=
<HR>=0A=
<P>LVM legt damit ein Block-Device <CODE>/dev/vg00/test</CODE> an, =
auf=0A=
das jetzt <I>normal</I> zugegriffen werden kann:=0A=
<HR>=0A=
<PRE>=0A=
mkfs -t ext2 /dev/vg00/test=0A=
mount /dev/vg00/test /tmp/lvmtest/mnt0=0A=
        =0A=
</PRE>=0A=
<HR>=0A=
<P>=0A=
<H2><A NAME=3D"s6">6. Funktionsweise von LVM</A></H2>=0A=
=0A=
<P>=0A=
<P>Aus logischer Sicht stellt LVM ein Block-Device, z.B. =0A=
<CODE>/dev/vg00/test</CODE> zur Verf=FCgung.=0A=
Das Block-Device ist in Bl=F6cke zu 4MB (per Default) unterteilt,=0A=
sogenannte <B>Logical Extents</B> (LE).=0A=
<P>Die PV's sind genauso in Bl=F6cke zu 4MB unterteilt, sogenannte=0A=
<B>Physical Extents</B> (PE).=0A=
<P>LVM erstellt (und pflegt) intern eine Tabelle, in der jeder=0A=
LE eine PE zugeordnet wird.=0A=
<P>Bsp:=0A=
<HR>=0A=
<PRE>=0A=
$ lvdisplay -v /dev/vg00/test  =0A=
--- Logical volume ---=0A=
LV Name               /dev/vg00/test=0A=
VG Name               vg00=0A=
LV Write Access       read/write=0A=
LV Status             available=0A=
LV #                  1=0A=
# open                1=0A=
LV Size               12 MB=0A=
Current LE            3=0A=
Allocated LE          3=0A=
Allocation            next free=0A=
Read ahead sectors    120=0A=
Block device          58:0=0A=
=0A=
   --- Distribution of logical volume on 1 physical volume  ---=0A=
   PV Name                  PE on PV     reads      writes=0A=
   /dev/loop7               3            9          440      =0A=
=0A=
   --- logical volume i/o statistic ---=0A=
   9 reads  440 writes=0A=
=0A=
   --- Logical extents ---=0A=
   LE    PV                        PE     reads      writes=0A=
   00000 /dev/loop7                00004  7          440      =0A=
   00001 /dev/loop7                00005  0          0        =0A=
   00002 /dev/loop7                00006  2          0        =0A=
        =0A=
</PRE>=0A=
<HR>=0A=
<P>=0A=
<H2><A NAME=3D"s7">7. Shutdown und Booten</A></H2>=0A=
=0A=
<P>=0A=
<P>=0A=
<H2>7.1 Shutdown</H2>=0A=
=0A=
<P>LVM mu=DF sauber abgeschlossen werden, damit ein Wiederherstellen=0A=
sp=E4ter m=F6glich ist.=0A=
<P>Zuerst sind alle Filesysteme auf den LV's zu unmounten. Es d=FCrfen =
keine=0A=
ge=F6ffneten LV (gemountete Filesysteme, Swap etc.) exitieren.=0A=
<P>Danach die VG als gesamtes deaktivieren:=0A=
<HR>=0A=
<PRE>=0A=
vgchange -a n=0A=
        =0A=
</PRE>=0A=
<HR>=0A=
<P>=0A=
<H2>7.2 Booten</H2>=0A=
=0A=
<P>Ev. das LVM-Modul laden / pr=FCfen.=0A=
<P>Normalerweise k=F6nnen die gespeicherte LVM-Konfiguration in den=0A=
Dateien/Verzeichnissen <CODE>/etc/lvmtab</CODE>, =
<CODE>/etc/lvmconf</CODE>,=0A=
<CODE>/etc/lvmtab.d</CODE> wieder benutzt werden:=0A=
<HR>=0A=
<PRE>=0A=
vgchange -a y=0A=
        =0A=
</PRE>=0A=
<HR>=0A=
<P>Sollte die gespeicherten Daten korrupt oder nicht vorhanden sein=0A=
(z.B. weil eine Platte in ein fremdes System eingebaut wird)=0A=
k=F6nnen alle potentiellen PV's (alle SCSI- und IDE-Platten, =
Loop-Devices=0A=
etc.) gescannt werden.=0A=
<HR>=0A=
<PRE>=0A=
vgscan -v=0A=
        =0A=
</PRE>=0A=
<HR>=0A=
=0A=
Danach ebenfalls mit <CODE>vgchange -a y</CODE> aktivieren.=0A=
<P>=0A=
<P>=0A=
<H2><A NAME=3D"s8">8. weitere Anwendungen</A></H2>=0A=
=0A=
<P>=0A=
<P>=0A=
<H2>8.1 Verlagerung auf eine andere PV</H2>=0A=
=0A=
<P>Situation: VG <CODE>vg00</CODE>, PV <CODE>/dev/loop7</CODE>, LV: =
<CODE>test</CODE>=0A=
<P>Aufgabe: Verlagerung der PV auf <CODE>/dev/hda1</CODE> im =
Online-Betrieb.=0A=
<P>=0A=
<HR>=0A=
<PRE>=0A=
        (Mit fdisk Partition-ID von hda1 auf 0xfe setzen)=0A=
        pvcreate -v /dev/hda1=0A=
        vgextend -v vg00 /dev/hda1=0A=
        pvmove -v /dev/loop7 /dev/hda1=0A=
        vgreduce -v vg00 /dev/hda1=0A=
        =0A=
</PRE>=0A=
<HR>=0A=
<P>=0A=
<H2>8.2 Anlegen eines Swap-Devices</H2>=0A=
=0A=
<P>50 MB Swap in vg00=0A=
<HR>=0A=
<PRE>=0A=
lvcreate -L50M -n swap1 vg00=0A=
mkswap /dev/vg00/swap1=0A=
/dev/vg00/swap1=0A=
        =0A=
</PRE>=0A=
<HR>=0A=
<P>Eintrag in <CODE>/etc/fstab</CODE>:=0A=
<HR>=0A=
<PRE>=0A=
/dev/vg00/swap1         swap                    swap    defaults        =
0 0=0A=
        =0A=
</PRE>=0A=
<HR>=0A=
<P>=0A=
<H2>8.3 Anlegen einer LV mit Stripes</H2>=0A=
=0A=
<P>=0A=
<HR>=0A=
<PRE>=0A=
        vgextend vg00 /dev/loop7=0A=
        lvcreate -i 2 -L20M -n striped vg00=0A=
        =0A=
</PRE>=0A=
<HR>=0A=
<P>=0A=
<H2>8.4 Umbenennen einer VG</H2>=0A=
=0A=
<P>VG <CODE>vg00</CODE> wird zu <CODE>myvg</CODE> umbenannt.    =0A=
<HR>=0A=
<PRE>=0A=
vgchange -a n vg00=0A=
vgrename vg00 myvg=0A=
vgchange -a y myvg=0A=
        =0A=
</PRE>=0A=
<HR>=0A=
<P>=0A=
<H2>8.5 Ex- und importieren von VG's</H2>=0A=
=0A=
<P>Bsp: VG <CODE>tmpvg</CODE> wird in ein anderes System =
=FCbertragen=0A=
<P>=0A=
<HR>=0A=
<PRE>=0A=
vgexport tmpvg=0A=
        =0A=
</PRE>=0A=
<HR>=0A=
=0A=
Ab jetzt ist die VG <CODE>tmpvg</CODE> im System nicht mehr =
sichtbar.=0A=
Man sollte sich <B>vorher</B> gemerkt haben, auf welchem Device=0A=
sie vorhanden war!=0A=
<P>Auf dem neuen System, kann die VG (unter Angabe eines neuen Namens) =
aus=0A=
dem Device importiert werden (im Beispiel als <CODE>newvg</CODE> von=0A=
<CODE>/dev/loop7</CODE>:=0A=
<HR>=0A=
<PRE>=0A=
vgimport newvg /dev/loop7=0A=
        =0A=
</PRE>=0A=
<HR>=0A=
<P>=0A=
<H2><A NAME=3D"s9">9. Referenz</A></H2>=0A=
=0A=
<P>=0A=
<P>=0A=
<H2>9.1 Abk=FCrzungen</H2>=0A=
=0A=
<P>=0A=
<UL>=0A=
<LI>LVM: Logical Volume Manager</LI>=0A=
<LI>PV: Physical Volume</LI>=0A=
<LI>VG: Volume Group</LI>=0A=
<LI>LV: Logical Volume</LI>=0A=
<LI>LE: Logical Extend</LI>=0A=
<LI>PE: Physiical Extend</LI>=0A=
</UL>=0A=
<P>=0A=
<H2>9.2 Kommandos-=DCbersicht</H2>=0A=
=0A=
<P>=0A=
<P>=0A=
<HR>=0A=
<PRE>=0A=
Prefix:=0A=
        pv=0A=
        vg=0A=
        lv=0A=
=0A=
Cmd:=0A=
        create=0A=
        remove=0A=
        display=0A=
        change=0A=
=0A=
Schalter:=0A=
        -v=0A=
=0A=
Exitcode:=0A=
        0 OK=0A=
        >0 Fehler=0A=
</PRE>=0A=
<HR>=0A=
<P>=0A=
<P>=0A=
<P>=0A=
<UL>=0A=
<LI> pvcreate: Anlegen (<I>formatieren</I>) eines PV</LI>=0A=
<LI> vgcreate: Anlegen einer VG</LI>=0A=
<LI> lvcreate: Anlegen eines LV</LI>=0A=
<LI> pvdisplay: Anzeige einer PV, Option <CODE>-v</CODE></LI>=0A=
<LI> vgdisplay: Anzeige einer VG, Option <CODE>-v</CODE></LI>=0A=
<LI> lvdisplay: Anzeige einer LV, Option <CODE>-v</CODE></LI>=0A=
<LI> pvmove: Verschieben der PE von einer PV zu einer anderen innerhalb =
einer=0A=
VG</LI>=0A=
<LI> lvextend: eine LV in der Gr=F6=DFe =E4ndern (macht beim Filesystem =
noch=0A=
keinen Sinn)</LI>=0A=
</UL>=0A=
<P>Shutdown &amp; Boot=0A=
<UL>=0A=
<LI> vgchange -a n: Deaktivieren von VG's</LI>=0A=
<LI> vgscan: Suche alle potentiellen Devices nach VG's ab</LI>=0A=
<LI> vgchange -a y: Aktivieren von VG's</LI>=0A=
<LI> vgexport: Eine VG aus dem System entfernen (ohne =
L=F6schen)</LI>=0A=
<LI> vgimport: Eine exportierte VG im System einbinden</LI>=0A=
</UL>=0A=
<P>=0A=
<H2><A NAME=3D"s10">10. Vorteile von LVM </A></H2>=0A=
=0A=
<P>=0A=
<UL>=0A=
<LI> gr=F6=DFere Filesysteme als Plattengr=F6=DFe</LI>=0A=
<LI> Auf einer Platte k=F6nnen beliebig viele <I>Partitionen</I>=0A=
angelegt werden (255 ?)</LI>=0A=
<LI> schnelleres Verwalten von Platten, da man nicht exakt=0A=
angeben mu=DF, woher man etwas haben will, man bedient sich=0A=
einfach aus einem Pool</LI>=0A=
<LI> Stripes m=F6glich (sonst nur durch MD)</LI>=0A=
<LI> Devices k=F6nnen mit Namen versehen werden (z.B. f=FCr =
Kunden-ID)</LI>=0A=
<LI> Die Benutzung von Devices ist erkennbar, Fehlerbedienung=0A=
wird vermieden, z.B. bei raw-Devices</LI>=0A=
</UL>=0A=
<P>=0A=
<H2><A NAME=3D"s11">11. Nachteile von LVM </A></H2>=0A=
=0A=
<P>=0A=
<UL>=0A=
<LI> Noch nicht im Std-Kernel</LI>=0A=
<LI> Nicht durch SAP freigegeben</LI>=0A=
<LI> Keine direkte Integration mit Software-Raid (MD)</LI>=0A=
</UL>=0A=
<H2><A NAME=3D"s12">12. Ausblick</A></H2>=0A=
=0A=
<P>=0A=
<UL>=0A=
<LI> Version LVM 0.8 soll auch Mirror unterst=FCtzen.</LI>=0A=
<LI> Wenn das Tool <CODE>resize2fs</CODE> (Ted Tso/Powerquest) =
vorhanden=0A=
ist, k=F6nnen LV mit ext2-Filesystem dynamisch vergr=F6=DFert / =0A=
verkleinert werden. Bsp:=0A=
<HR>=0A=
<PRE>=0A=
e2fsadm -L+100 /dev/test_vg/another_test_lv=0A=
                =0A=
</PRE>=0A=
<HR>=0A=
</LI>=0A=
</UL>=0A=
<P>=0A=
<H2><A NAME=3D"s13">13. Links</A></H2>=0A=
=0A=
<P>=0A=
<UL>=0A=
<LI> =0A=
<A HREF=3D"http://linux.msede.com/lvm">Homepage von LVM: =
http://linux.msede.com/lvm</A></LI>=0A=
</UL>=0A=
<P>=0A=
<P>=0A=
</BODY>=0A=
</HTML>=0A=

------_=_NextPart_000_01BF7F79.A077955B--
