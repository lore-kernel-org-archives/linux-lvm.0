Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAQ7WQr07329
	for <linux-lvm@redhat.com>; Fri, 26 Nov 2004 02:32:26 -0500
Received: from languor.static.net (lethargy.static.net [66.92.70.19])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAQ7WQLv008537
	for <linux-lvm@redhat.com>; Fri, 26 Nov 2004 02:32:26 -0500
Received: from syndrome.static.net ([66.92.109.119] helo=[192.168.1.103])
	by languor.static.net with asmtp (Exim 3.35 #1) id 1CXadh-0001K9-00
	for linux-lvm@redhat.com; Fri, 26 Nov 2004 02:35:33 -0500
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Message-Id: <6E9EA468-3F7D-11D9-8E13-003065F94C4C@static.net>
From: Armen Babikyan <armenb@static.net>
Date: Fri, 26 Nov 2004 02:33:14 -0500
Subject: [linux-lvm] problem with LVM and fstab...bug?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

I am seeing unexpected behavior with getting LVM drives to 
automatically mount when I boot my machine.  The expected behavior 
works for one LV but not the other.  I specified these lines in my 
/etc/fstab:

/dev/mapper/vg0-www    /www    ext3    rw                      0       2
/dev/mapper/vg0-uml   /uml    ext3    rw                      0       2

These entries didn't work, so I thought I'd try these next two lines:

/dev/vg0/www    /www    ext3    rw                      0       2
/dev/vg0/uml   /uml    ext3    rw                      0       2

Oddly enough, the uml disk mounts on bootup, while the www one does 
not!  Is it just me, or is this chain of events, rather unexpectedly 
strange:

# umount /uml
# mount /dev/vg0/www
mount: wrong fs type, bad option, bad superblock on /dev/vg0/www,
or too many mounted file systems
# ls -al /dev/vg0/www
lrwx------ 1 root root 19 Nov 26 01:29 /dev/vg0/www -> 
/dev/mapper/vg0-www
# mount /dev/mapper/vg0-www /www
#

But:

# mount /dev/vg0/uml
#

After this, both drives are mounted:

# df
Filesystem           1K-blocks      Used Available Use% Mounted on
[my other partitions]
/dev/mapper/vg0-www   30237648  10572760  18128888  37% /www
/dev/mapper/vg0-uml   10079084    945240   8621844  10% /uml
#

I am running Linux 2.6.8 on an Athlon with LVM on top of software 
RAID5.  Both partitions were created with mkfs -t ext3 (i.e. no special 
options...at least...I don't remember using any special options...).  I 
uncommented the "uml" line from /etc/fstab and rebooted, and saw the 
same sort of behavior.  Any ideas?  Feel free to email me for more 
info.

[side question: why is there a symbolic link from /dev/X/Y to 
/dev/mapper/X-Y anyway?]

Any and all advice is greatly appreciated!

Thanks,

   - Armen
