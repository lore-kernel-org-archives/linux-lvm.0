content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <8075D5C3061B9441944E137377645118012E9A@cinshrexc03.shermfin.com>
From: "Rechenberg, Andrew" <ARechenberg@shermanfinancialgroup.com>
Subject: [linux-lvm] Problems with snapshots
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
Date: Tue Mar 11 15:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I've just implemented LVM 1.0.3 in the stock Red Hat 2.4.18-19 kernel
and I believe I'm having issues with snapshots.  The past two nights my
backups have locked up the machine hard and I had to power it off to get
it back up.  This morning I forgot to remove the snapshot upon reboot
and about 30 minutes after reboot the machine locked up again.  The
backup script creates a 90G snapshot and this morning it has used ~18GB
of that space.  This is the command that I use:

lvcreate -L90G -c 128 -s -ncubssnap /dev/cubsvg00/cubslv00

I have since removed the snapshot and the box has been happy since then.
I am moving back to my old backup mehtod of suspending my database,
copying files, and then resuming DB operations, but I would like to keep
using snapshots. =20

Is there anything that I should look at to try to determine the problem?
I have one VG on top of a software RAID10 array and one LV carved out of
that with sufficient space left over for snapshots.  Here are the
details of my setup.  If you need more information, please let me know.

Thanks for your help,
Andy.

Regards,
Andrew Rechenberg
Infrastructure Team, Sherman Financial Group

-------------------------------------------------

[root@cinshrcub01 ~]# vgdisplay /dev/cubsvg00
--- Volume group ---
VG Name               cubsvg00
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           1023.97 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               440.53 GB
PE Size               16 MB
Total PE              28194
Alloc PE / Size       22400 / 350 GB
Free  PE / Size       5794 / 90.53 GB
VG UUID               bOuvON-9uze-9Zz8-LW0b-xkWK-z87E-L7r0V1


[root@cinshrcub01 ~]# lvdisplay /dev/cubsvg00/cubslv00
--- Logical volume ---
LV Name                /dev/cubsvg00/cubslv00
VG Name                cubsvg00
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                350 GB
Current LE             22400
Allocated LE           22400
Allocation             next free
Read ahead sectors     1024
Block device           58:0
