content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <8075D5C3061B9441944E1373776451180F06EA@cinshrexc03.shermfin.com>
From: "Rechenberg, Andrew" <ARechenberg@shermanfinancialgroup.com>
Subject: [linux-lvm] Recovering from a hard crash
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
Date: Mon Feb 24 08:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Good day,

I am testing LVM on some test hardware and I'm trying to break it to see
if I can recover from a hard crash.  Well, I've broke it :)  I've
checked on the HOWTO and I'm subscribed to the mailing list and checked
the archives and I can't find anything to assist me recover so here
goes.

Here's my setup:

Red Hat 7.3 - kernel 2.4.18-24
lvm-1.0.3-4.i386.rpm

20 SCSI's disks in a Linux software RAID10
One volume group (vgcreate -s 16M cubsvg1 /dev/md10)
One logical volume with space left over for snapshots (lvcreate -L150G
-ncubslv1 cubsvg1)
Ext3 on top of mylv1

Here's how I "broke" it - I mounted the filesystem (mount
/dev/myvg1/mylv1 /mnt/test) and then while I was doing a large dd (dd
if=3D/dev/zero of=3Dtestfile bs=3D64k count=3D10000) I powered down the =
server.
When the server came back up I received the following error when trying
to do a vgscan:

vgscan -- reading all physical volumes (this may take a while ...)
vgscan -- only found 0 of 9600 Les for LV /dev/cubsvg1/cubslv1 (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "cubsvg1" from physical volume(s)

Here is what pvdata shows:

--- Physical volume ---
PV Name               /dev/md10
VG Name               cubsvg1
PV Size               339.16 GB [711273728 secs] / NOT usable 16.25 MB
[LVM: 212 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       16384
Total PE              21705
Free PE               12105
Allocated PE          9600
PV UUID               RXNxAi-v6g0-e1Ro-8U1z-1xER-9Fbv-9M1PMo

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           1023.97 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               339.14 GB
PE Size               16 MB
Total PE              21705
Alloc PE / Size       9600 / 150 GB
Free  PE / Size       12105 / 189.14 GB
VG UUID               lKSEyp-1O2N-H1w3-V26c-jcwP-WV1z-x7Vgyu

--- List of logical volumes ---

pvdata -- logical volume "/dev/cubsvg1/cubslv1" at offset   0
pvdata -- logical volume struct at offset   1 is empty
pvdata -- logical volume struct at offset   2 is empty
pvdata -- logical volume struct at offset   3 is empty
pvdata -- logical volume struct at offset   4 is empty
pvdata -- logical volume struct at offset   5 is empty

... [snip] ...

--- List of physical volume UUIDs ---

001: RXNxAi-v6g0-e1Ro-8U1z-1xER-9Fbv-9M1PMo


I've tried using vgcfgrestore to put back the VGDA (am I using the
correct terminology?) but I can't get vgscan to get going.

Can anyone point me in the right direction on how to get my volume
group/logical volume back?  I want to make sure that if something like
this happens in production (and you know it will ;), that I can get us
back up with no data loss.

If you need any more information please let me know.

Thanks for your help,
Andy.

Andrew Rechenberg
Infrastructure Team, Sherman Financial Group
