Message-ID: <OF8353947B.FB8E02FC-ON80256BD8.00693D8A@de.ibm.com>
From: "Andre Borkenfeld" <BORKEN@de.ibm.com>
MIME-Version: 1.0
Content-transfer-encoding: quoted-printable
Subject: [linux-lvm] LVM mit einem Readonly rootfs =?iso-8859-1?Q?m=F6glich=3F?=
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Jun 14 13:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-LVM@Sistina.com
Cc: Matthias Hein <mathein@de.ibm.com>

Hallo Herr Mauelshagen,

wir setzen die SuSE Distribution f=FCr die zSeries ein (s390, 64bit). U=
nserer
kernelstand ist 2.4.17-timer mit gcc 2.95.
Wir haben folgendes vor:
- Aufbau eines Linux systems als "Mastersystem"
- Aufbau mehrerer Linux-Clone. Diese haben readonly Zugriff auf das
root-filesystem des Mastersystemes.
Dies soll Plattenplatz aber vor allem Wartung sparen.

Wir haben nun ein Problem:
Wir wollen Ihren LVM einsetzen. Leider schreibt der LVM in /etc mehrere=

files/directories. Die Directories konnten wir durch links in ein
rw-filesystem umlenken; Bei der lvmtab versagt diese Technik jedoch.

Gibt es einen weg, dem LVM mitzuteilen, ein anderes Verzeichnis als /et=
c
zuverwenden (z.B. /rw/etc)? Einen versteckten Parameter oder eine
environment Variable?

Wir haben auch ein wenig getestet und folgendes getan:
In liblvm.h haben wir die Variablen LVMTAB, LVMTAB_DIR, VG_BACKUP_DIR a=
uf
/rw/etc umgesetzt und die lvm sourcen neu compiliert und dann installie=
rt.
Es scheint zu funktionieren. Ist dies ausreichend? Sehen sie noch irgen=
dwo
Probleme?

Wir schreiben gerade ein Buch (Redbook) in den USA =FCber unsere
Implementierung des Cloning. Daher w=E4re uns am liebsten, wenn es soet=
was
wie einen Parameter gibt.

Wir w=FCrden uns sehr =FCber eine baldige Antwort freuen, da wir unsere=
 Arbeit
mitte n=E4chster Woche abschlie=DFen m=FCssen.

Vielen Dank!

Mit freundlichem Gru=DF

   Andre Borkenfeld


IBM Global Service
BIS ERP MP North D=FCsseldorf
Festnetz:
Mobil: 0172/7355725
e-mail: borken@de.ibm.com
=
