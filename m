Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r7J4tYD8003887
	for <linux-lvm@redhat.com>; Mon, 19 Aug 2013 00:55:34 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7J4tWvR032175
	for <linux-lvm@redhat.com>; Mon, 19 Aug 2013 00:55:33 -0400
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 7FC9A21479
	for <linux-lvm@redhat.com>; Mon, 19 Aug 2013 00:55:32 -0400 (EDT)
Received: from ryoohko.kodachi.com (unknown [108.49.181.241])
	by mail.messagingengine.com (Postfix) with ESMTPA id 47A836800C4
	for <linux-lvm@redhat.com>; Mon, 19 Aug 2013 00:55:32 -0400 (EDT)
Message-ID: <5211A543.9040603@kodachi.com>
Date: Mon, 19 Aug 2013 00:55:31 -0400
From: Flynn <flynn@kodachi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] PV that's present marked as missing?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I have a fairly complex LVM2/mdadm setup that I'm in the middle of 
turning into a simpler setup.  I made a mistake along the way, though, 
and have landed in a confusing place.

This is kind of long, and I apologize for that -- trying to describe 
completely how I got here.  The complex setup I started with:

/dev/md5 is a RAID5 of /dev/sd{b,d,e,f}5
/dev/md6 is a RAID5 of /dev/sd{b,d,e,f}6
etc on up to /dev/md14
/dev/md99 is a RAID1 of /dev/sdg and /dev/sdh

/dev/md{5-14} plus /dev/md99 are all assembled into a volume group 
(creatively called vglinux), which has three logical volumes.  Only one, 
lvstore, is relevant: the other two are getting destroyed as part of the 
simplication.

The goal is to end with a RAID6 of /dev/sd{b,d,e,f,g,h}, and no 
multiple-partition madness (it's there from the days of old, when mdadm 
couldn't reshape arrays).  The next step was to free up /dev/sdf, 
starting with

     pvmove /dev/md5
     reshape md5 as a RAID5 of /dev/sd{b,d,e}5 (freeing /dev/sdf5)
     lather, rinse, and repeat for the other mds.

The VG has plenty of free space for this; it's slow, but that's OK.

The problem: while md{5,6,7} went fine, I botched the pvmove for md8 and 
ended up starting to reshape the array _before the pvmove happened._ 
Specifically, I did all of these:

mdadm --grow /dev/md8 --array-size 292730880 # it was 439489920
pvresize /dev/md8
mdadm --grow /dev/md8 --raid-devices 3 --backup-file ~/backup

_without_ having moved data off.  Once I figured out what was going on, 
I did

umount (all the filesystems in the VG)
vgchange -a n vglinux
mdadm --stop /dev/md8

which halted the reshape about 5% of the way done.  Then (with some help 
from NeilBrown and a buncha experiments with loopback devices) I used 
the most recent mdadm snapshot to revert the reshape.

mdadm --assemble --update=revert-reshape /dev/md8 /dev/sd{b,d,e,f}8

NOTE WELL: I KNOW THAT THIS HAS DESTROYED SOME DATA.  That's not the 
question.  [ :) ]  There will be damage, yes, I know that, and I should 
be able to detect that and correct it.

At this point /dev/md8 is back to 4 devices, array-size 439489920, and 
can be started.  Next step is to fsck lvstore to get a handle on the 
damage before proceeding -- but vgchange -a y vglinux doesn't start lvstore:

# vgchange  -a y vglinux
   Incorrect metadata area header checksum
   Refusing activation of partial LV lvstore. Use --partial to override.
   2 logical volume(s) in volume group "vglinux" now active

(The two LVs that it did start are the irrelevant ones.)

So things are confusing:

First, it'd be awesome to know where exactly that "incorrect metada area 
header checksum" is coming from.  Maybe, y'know, a device to look at, or 
some further hint of where to start tracking things down?  [ :) ]

Second, if I look in /etc/lvm/archive for vglinux's latest, I find this 
bit buried in there:

     pv2 {
         id = "4F3rcV-sS8p-E6t2-hjGm-gLVB-C6wl-4McUhc"
         device = "/dev/md8"     # Hint only

         status = ["ALLOCATABLE"]
         flags = ["MISSING"]
         dev_size = 878979840    # 419.13 Gigabytes
         pe_start = 384
         pe_count = 107297       # 419.129 Gigabytes
     }

which seems to be why it's complaining about 'partial PV lvstore'.  But, 
uh, 4F3rcV-sS8p-E6t2-hjGm-gLVB-C6wl-4McUhc _is_ the UUID of /dev/md8:

# pvs -o +uuid --unit=4m
   Incorrect metadata area header checksum
   Unable to find "/dev/sdb5" in volume group "vglinux"
   PV         VG      Fmt  Attr PSize      PFree      PV UUID
   /dev/md10  vglinux lvm2 a-   107297.00U         0U 
LO5KoK-1AjU-iXb0-fkLo-lUKR-Yo9P-wDZQPP
   /dev/md11  vglinux lvm2 a-   107297.00U         0U 
gBGcjz-DmIb-pAj9-CWnb-jopW-Wd19-iIs1ur
   /dev/md125 vglinux lvm2 a-   107297.00U   8607.00U 
5JlNTx-yT14-271r-NMAm-a17W-FKe4-pXoOW4
   /dev/md13  vglinux lvm2 a-   107297.00U         0U 
MJlTQO-lCyE-bP80-FlvE-m1nM-DD2x-qhlIQK
   /dev/md14  vglinux lvm2 a-   107297.00U         0U 
XDpA1D-kxbq-SEck-ozTl-rP4Y-bMws-MBwNNf
   /dev/md5           lvm2 a-    71467.50U  71467.50U 
39oFQs-9tlf-ywT4-YgtX-nfcm-rAEq-pAPsdR
   /dev/md6   vglinux lvm2 a-    71531.00U  35856.00U 
ufKOpM-02YG-12rJ-mt1r-DbEm-xoJu-onzEtr
   /dev/md7   vglinux lvm2 a-    71531.00U  71531.00U 
NpAKLQ-4Irn-wDA4-0ZDI-ydW6-eY9n-rDp50e
   /dev/md8   vglinux lvm2 a-   107297.00U         0U 
4F3rcV-sS8p-E6t2-hjGm-gLVB-C6wl-4McUhc
   /dev/md9   vglinux lvm2 a-   107297.00U         0U 
hRmTMN-Mx17-uUEX-rF1Z-hQ1J-8iDd-S7S2t7
   /dev/md99  vglinux lvm2 a-   357667.00U 178748.00U 
jUgxoF-mvwR-6C8A-wzjP-K0Xu-MPf8-XewqUE

Finally, note that "Unable to find /dev/sdb5 in vglinux" complaint, and 
note that /dev/md5 is _not_ listed as part of vglinux.  md5 shouldn't be 
part of vglinux right now, and sdb5 has never been a PV on its own (it's 
only ever been a part of the md5 PV).  WTFO?  As it happens, I didn't 
actually reshape /dev/md5: after the pvmove, I shredded the md and 
recreated it instead.  I suppose it's possible that I forgot to vgreduce 
before doing that?

Googling and reading indicates that I need to clear that MISSING flag, 
and that vgcfgrestore is the only tool for that job -- but editing that 
archive file to remove the MISSING flag and trying vgcfgrestore with 
that doesn't work:

# vgcfgrestore --debug --verbose --test --file wtfvglinux vglinux
   Test mode: Metadata will NOT be updated.
   Incorrect metadata area header checksum
   Incorrect metadata area header checksum
   Restore failed.
     Test mode: Wiping internal cache
     Wiping internal VG cache

so, at this point, some guidance would be most welcome.

(Also note that before I did the revert-reshape, I dd'd 
/dev/sd{b,d,e,f}8 to spare partitions as a backup.  It may be relevant 
that there are two copies of the metadata for md8's devices?)

Thanks very much,
  Flynn

--
The trick is to keep breathing.              (Garbage, from _Version 2.0_)
