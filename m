From: Andreas Wilhelm <awilhelm@sielnet.de>
Message-ID: <Pine.LNX.4.33.0112060055350.19570-100000@sielserv.sielkamp.etc.tu-bs.de>
MIME-Version: 1.0
Subject: [linux-lvm] vgimport with lost partitions?
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
Date: Wed Dec  5 18:19:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

I have exported a VG and pluged the HD's into another machine for import
them. Unfortunately meantime I have damaged 2 partitions belonging to this
VG. (/dev/hdi5 and /dev/hdk5, both 3.69GB)

Is it posible to restore data stored on the other partitions?

Thanks in advance,

Andreas


Output of pvscan/vgimport:
(It is strange, that /dev/hdk5 does not appear and /dev/hdi5 appears with
wrong size.)

# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md1"   of VG "siel_6"         [18.56 GB / 0
free]
pvscan -- inactive PV "/dev/hdk6"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdk7"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdk8"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdk9"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdk10"  is in EXPORTED VG "sieltemp" [11.12 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdk11" is in no VG  [11.18 GB]
pvscan -- inactive PV "/dev/hdk12"  is in EXPORTED VG "sieltemp" [11.12 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdk13" is in no VG  [11.18 GB]
pvscan -- inactive PV "/dev/hdk14"  is in EXPORTED VG "sieltemp" [11.12 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdi5"  is in no VG  [7.45 GB]
pvscan -- inactive PV "/dev/hdi6"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdi7"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdi8"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdi9"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdi10"  is in EXPORTED VG "sieltemp" [11.12 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdi11" is in no VG  [11.18 GB]
pvscan -- inactive PV "/dev/hdi12"  is in EXPORTED VG "sieltemp" [11.12 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdi13" is in no VG  [11.18 GB]
pvscan -- inactive PV "/dev/hdi14"  is in EXPORTED VG "sieltemp" [11.12 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdg5"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdg6"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdg7"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdg8"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdg9"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdg10"  is in EXPORTED VG "sieltemp" [11.12 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdg11" is in no VG  [11.18 GB]
pvscan -- inactive PV "/dev/hdg12"  is in EXPORTED VG "sieltemp" [11.12 GB
/ 0 free]
pvscan -- inactive PV "/dev/hdg13" is in no VG  [11.18 GB]
pvscan -- inactive PV "/dev/hdg14"  is in EXPORTED VG "sieltemp" [11.12 GB
/ 0 free]
pvscan -- inactive PV "/dev/hde5"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hde6"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hde7"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hde8"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hde9"   is in EXPORTED VG "sieltemp" [3.69 GB
/ 0 free]
pvscan -- inactive PV "/dev/hde10"  is in EXPORTED VG "sieltemp" [11.12 GB
/ 0 free]
pvscan -- inactive PV "/dev/hde11" is in no VG  [11.18 GB]
pvscan -- inactive PV "/dev/hde12"  is in EXPORTED VG "sieltemp" [11.12 GB
/ 0 free]
pvscan -- inactive PV "/dev/hde13" is in no VG  [11.18 GB]
pvscan -- inactive PV "/dev/hde14"  is in EXPORTED VG "sieltemp" [11.12 GB
/ 0 free]
pvscan -- total: 40 [316.75 GB] / in use: 31 [219.86 GB] / in no VG: 9
[96.89 GB]


# vgimport sieltemp /dev/hdk6 /dev/hdk7 /dev/hdk8 /dev/hdk9 /dev/hdk10
/dev/hdk12 /dev/hdk14 /dev/hdi6 /dev/hdi7 /dev/hdi8 /dev/hdi9 /dev/hdi10
/dev/hdi12 /dev/hdi14 /dev/hdg5 /dev/hdg6 /dev/hdg7 /dev/hdg8 /dev/hdg9
/dev/hdg10 /dev/hdg12 /dev/hdg14 /dev/hde5 /dev/hde6 /dev/hde7 /dev/hde8
/dev/hde9 /dev/hde12 /dev/hde14
vgimport -- ERROR: wrong number of physical volumes to import volume group
"sieltemp"


# vgimport sieltemp /dev/hdk6 /dev/hdk7 /dev/hdk8 /dev/hdk9 /dev/hdk10
/dev/hdk12 /dev/hdk14 /dev/hdi6 /dev/hdi7 /dev/hdi8 /dev/hdi9 /dev/hdi10
/dev/hdi12 /dev/hdi14 /dev/hdg5 /dev/hdg6 /dev/hdg7 /dev/hdg8 /dev/hdg9
/dev/hdg10 /dev/hdg12 /dev/hdg14 /dev/hde5 /dev/hde6 /dev/hde7 /dev/hde8
/dev/hde9 /dev/hde12 /dev/hde14 /dev/hdi5 /dev/hdk5
vgimport -- ERROR: physical volume "/dev/hdi5" doesn't belong to an
exported volume group
