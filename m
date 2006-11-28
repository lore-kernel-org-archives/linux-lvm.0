Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAS4t750025387
	for <linux-lvm@redhat.com>; Mon, 27 Nov 2006 23:55:07 -0500
Received: from web36110.mail.mud.yahoo.com (web36110.mail.mud.yahoo.com
	[66.163.179.224])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	kAS4t5VH001193
	for <linux-lvm@redhat.com>; Mon, 27 Nov 2006 23:55:06 -0500
Date: Mon, 27 Nov 2006 19:54:55 -0800 (PST)
From: Martin Fick <mogulguy@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <435898.10295.qm@web36110.mail.mud.yahoo.com>
Subject: [linux-lvm] Cannot pvmove,
	Insufficient suitable contiguous allocatable extents
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM <linux-lvm@redhat.com>

Hi,

I have been using LVM2 for a while now and I am very
pleased with it.  However, I have currently run into a
srtange limitation that I do not understand.  I have a
vg named 'data' and I would like to migrate the data
off of one of its partitions.  Unfortunately the
pvmove command will not let me, despite the fact that
I have plenty of free extents.  When I run pvmove, I
get:

pvmove /dev/hdc3
  Insufficient suitable contiguous allocatable extents
for logical volume pvmove0: 6250 more required
  Unable to allocate temporary LV for pvmove.

The pvdisplay for /dev/hdc3 gives:

 --- Physical volume ---
  PV Name               /dev/hdc3
  VG Name               data
  PV Size               33.30 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              8526
  Free PE               484
  Allocated PE          8042
  PV UUID              
AheuvH-YyXp-83Hl-23JI-y7Kc-eTXt-rMLEm5

Only 8042 allocated PEs, tet, the vgdisplay data
gives:

  --- Volume group ---
  VG Name               data
  System ID
  Format                lvm2
  Metadata Areas        9
  Metadata Sequence No  80
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                26
  Open LV               22
  Max PV                0
  Cur PV                9
  Act PV                9
  VG Size               71.46 GB
  PE Size               4.00 MB
  Total PE              18293
  Alloc PE / Size       9061 / 35.39 GB
  Free  PE / Size       9232 / 36.06 GB
  VG UUID              
XLN0qj-39pm-RhwL-Ragk-KJoP-UZ0R-OWDSmA

As you can see, there are at least 9232 free extents,
more
than the 8042 allocated PEs from /dev/hdc3.

And a lvdisplay shows that all my logical volumes
have:
 Allocation             inherit

So, why is it looking for contiguous PEs?  What does
the inherit signify (I know it is not contiguous, but
it hardly seems like the opposite?)

How can I get the data off of my /dev/hdc3 partition?

Thanks for any insights,

-Martin



 
____________________________________________________________________________________
Cheap talk?
Check out Yahoo! Messenger's low PC-to-Phone call rates.
http://voice.yahoo.com
