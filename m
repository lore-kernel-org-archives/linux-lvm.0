Content-Class: urn:content-classes:message
Message-Id: <E8AEFF3401E82E4699359F1EBBED6A2105BED8@exchange.his.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
From: =?iso-8859-1?Q?=22M=FC=DFig-Trapp=2C_Peter=22?= <Muessig-Trapp@his.de>
Subject: [linux-lvm] pvmove -- not enough free/allocatable physical extends .. but:
 there had to be enough!
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
Date: Tue Feb 26 07:49:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Hi,

perhaps I have a misunderstanding in concept, therefore I am
glad for each assistance:

My plan is, to remove a partition (/dev/hda4) from lv and use
it seperatly (mount it on /usr).

I tried pvmove and get errors:

root@icezentral:/home/muessig > pvmove /dev/hda4 /dev/hdb1
pvmove -- moving physical extents in active volume group "daten"
pvmove -- WARNING: if you lose power during the move you may need to
restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- not enough free/allocatable physical extents
=20
Than I used pvscan to check pv and see, there are no extends
allocatable (on each partition 0 free). How is that possible?
df tells me, there enough space available.

root@icezentral:/home/muessig > pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sda1" of VG "daten" [8.51 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdb1" of VG "daten" [8.51 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdc1" of VG "daten" [4.25 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hda4" of VG "daten" [5.05 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdb1" of VG "daten" [57.27 GB / 0 free]
pvscan -- total: 5 [83.59 GB] / in use: 5 [83.59 GB] / in no VG: 0 [0]

root@icezentral:/home/muessig > df -h=20
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda3             2.5G  2.2G  163M  94% /
/dev/hda1              15M  3.3M   11M  23% /boot
/dev/daten/1           84G   22G   61G  27% /daten
shmfs                 238M     0  238M   0% /dev/shm

Can anybody explain me, whats going on?

Thanks in advance, Peter

--

root@icezentral:/home/muessig > lvdisplay /dev/daten/1
--- Logical volume ---
LV Name                /dev/daten/1
VG Name                daten
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                83.58 GB
Current LE             21396
Allocated LE           21396
Allocation             next free
Read ahead sectors     120
Block device           58:0

root@icezentral:/home/muessig > pvdisplay /dev/hdb1
--- Physical volume ---
PV Name               /dev/hdb1
VG Name               daten
PV Size               57.27 GB / NOT usable 4.11 MB [LVM: 178 KB]
PV#                   5
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              14660
Free PE               0
Allocated PE          14660
PV UUID               Z7AuR8-61ZB-7uze-kq8h-dH3Z-REfN-JRG0dX


--=20
Peter M=FC=DFig-Trapp (muessig@his.de), HIS =
Hochschul-Informations-System,
Goseriede 9, D 30159 Hannover, Tel.: +49-511-1220-193,  Fax: -1220-250
EDV-Gruppe Abteilung II    Studierendenforschung / Informationssysteme
http://  www.his.de   iceland.his.de    hisbus.his.de    evanet.his.de
=20
