From: "Glenn Shannon" <warl0k@lvcm.com>
Subject: RE: [linux-lvm] vgcreate -- no valid physical volumes in command line
Message-ID: <002901c25746$b78f1510$3200a8c0@warl0k>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200209081533.59821.daniel@danielgardner.org>
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
Date: Sun Sep  8 09:48:11 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Are you running DevFS by chance?

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]
On Behalf Of Daniel Gardner
Sent: Sunday, September 08, 2002 7:34 AM
To: linux-lvm@sistina.com
Subject: [linux-lvm] vgcreate -- no valid physical volumes in command
line

Hi,

I'm new to this whole LVM lark, and something isn't working right for
me...

I've got a partition, /dev/hda2, which I'm trying to put LVM stuff on.

cfdisk says:

            First    Last
 # Type     Sector   Sector   Offset  Length   Filesystem Type (ID)
-- ------- -------- --------- ------ --------- ---------------------- 
 2 Primary  6249285 12466439       0  6217155  Linux LVM (8E)

Then I do:

root@gentoo daniel # pvcreate /dev/hda2
pvcreate -- physical volume "/dev/hda2" successfully created

root@gentoo daniel # pvdisplay /dev/hda2
pvdisplay -- "/dev/hda2" is a new physical volume of 2.96 GB

root@gentoo daniel # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part2" is in no
VG 
[2.96 GB]
pvscan -- total: 1 [2.96 GB] / in use: 0 [0] / in no VG: 1 [2.96 GB]

All looking good... now here's the weird one:

root@gentoo daniel # vgcreate main /dev/hda2
vgcreate -- no valid physical volumes in command line

This is where I'm getting my baby steps from
http://www-106.ibm.com/developerworks/linux/library/l-lvm2.html?dwzone=l
inux

I was using stock kernel 2.4.18 and tools 1.0.5 to start with, but just
tried 
1.1-rc2 with the same results on both.

I don't really know where to go further with this, don't know if it's
just me 
being stupid or what. Anyone got any ideas? I'll provide any info that I
need 
to - just let me know what's needed!

Thanks awfully,
Daniel



_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
