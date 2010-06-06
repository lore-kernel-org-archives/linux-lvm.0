Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o56104kJ025776
	for <linux-lvm@redhat.com>; Sat, 5 Jun 2010 21:00:04 -0400
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o560xsGu019498
	for <linux-lvm@redhat.com>; Sat, 5 Jun 2010 20:59:55 -0400
Received: from [10.255.0.247] (fw.iplink.net [192.139.81.98])
	by smtp.iplink.net (Postfix) with ESMTP id 49B24A9FCB4
	for <linux-lvm@redhat.com>; Sat,  5 Jun 2010 20:59:50 -0400 (EDT)
Message-ID: <4C0AF305.2000807@alteeve.com>
Date: Sat, 05 Jun 2010 20:59:49 -0400
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Imaged a drive, now kernel panics
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,

   I am sure this is a fairly common issue, but it's stumping me.

   I have an old server's drive (IDE) that has CentOS 4 on it. The 
mainboard fried, so I imaged the drive using 'dd' onto a new drive and 
tried booting from it. Not surprisingly, it failed to boot. Specifically:

-------------------------------------------------------------
Uncompressing Linux... Ok, booting the kernel.
Red Hat nash version 4.2.1.8 starting
   Reading all physical volumes.  This may take a while...
   No volume groups found
   Volume group "VolGroup00" not found
ERROR: /bin/lvm exited abnormally! (pid 321)
mount: error 6 mounting ext3
mount: error 2 mounting none
switchroot: mount failed: 22
umount /initrd/dev failed: 2
Kernel panic - not syncing: Attempted to kill init!
-------------------------------------------------------------

   When I boot off the DVD using 'linux rescue', it successfully finds 
the partitions and mounts them. I can 'chroot /mnt/sysimage' just fine. 
I also tried moving the current kernel out of the way and using 
'mkinitrd' to rebuild the image (after chrooting and making sure 
everything looked fine).

   Any idea what I might be missing?

Thanks!

-- 
Digimer
E-Mail:         linux@alteeve.com
AN!Whitepapers: http://alteeve.com
Node Assassin:  http://nodeassassin.org
