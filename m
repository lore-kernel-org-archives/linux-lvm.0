From: "=?iso-8859-1?Q?Ronan=2DYann?= Lorin" <ronan@les-lorin.homeip.net>
Message-ID: <20031205.Vak.86770400@gw.les-lorin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Subject: [linux-lvm] half my space lost
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
Date: Fri Dec  5 07:19:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I'm using LVM 1.0.7 on Linux 2.4.22 (Mandrake 9.2).
I'm triyng to setup a VG build on RAID 1 partitions.
When the parition is added to the VG, half of it space mysteriously disapear.

for example:

my RAID 1 partitions are /dev/md/7 and /dev/md/8 and are about 128Mb size.

[root@fw root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/md/7"                               is in no VG
[125.38 MB]
pvscan -- inactive PV "/dev/md/8"                               is in no VG
[125.38 MB]
pvscan -- ACTIVE   PV "/dev/ide/host0/bus1/target0/lun0/part13" of VG "lvm1" [17
GB / 16.97 GB free]
pvscan -- total: 3 [17.28 GB] / in use: 1 [17.04 GB] / in no VG: 2 [250.75 MB]

I create one VG using one of the RAID 1 partitions:

[root@fw root]# vgcreate secured /dev/md/7
vgcreate -- INFO: using default physical extent size 32 MB
vgcreate -- INFO: maximum logical volume size is 2 Terabyte
vgcreate -- doing automatic backup of volume group "secured"
vgcreate -- volume group "secured" successfully created and activated

The size of the partition get shrink by half:

[root@fw root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md/7"                               of VG "secured"
[64 MB / 64 MB free]
pvscan -- inactive PV "/dev/md/8"                               is in no VG
[125.38 MB]
pvscan -- ACTIVE   PV "/dev/ide/host0/bus1/target0/lun0/part13" of VG "lvm1"
[17 GB / 16.97 GB fr
pvscan -- total: 3 [17.28 GB] / in use: 2 [17.16 GB] / in no VG: 1 [125.38 MB]

Is this a known/solved problem?
Did I made a mistake?

Thanks in advance for your help.
Regards.

--
R.Y. Lorin
mailto:ryl@free.fr
http://les-lorin.webhop.net/
