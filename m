Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3IIN6j14334
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2004 14:23:06 -0400
Received: from anor.ics.muni.cz (root@anor.ics.muni.cz [147.251.4.35])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3IIN587030929
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2004 14:23:05 -0400
Received: from anxur.fi.muni.cz (IDENT:0@anxur.fi.muni.cz [147.251.48.3])
	by anor.ics.muni.cz (8.12.1/8.12.1) with ESMTP id i3IIN4na015074
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2004 20:23:04 +0200
Received: from anxur.fi.muni.cz (IDENT:11561@localhost [127.0.0.1])
	by anxur.fi.muni.cz (8.12.10/8.12.8) with ESMTP id i3IIN3uw014939
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2004 20:23:03 +0200 (MEST)
Received: (from kas@localhost)
	by anxur.fi.muni.cz (8.12.10/8.12.8/Submit) id i3IIN3Z0014938
	for linux-lvm@redhat.com; Sun, 18 Apr 2004 20:23:03 +0200 (MEST)
Date: Sun, 18 Apr 2004 20:23:03 +0200
From: Jan Kasprzak <kas@informatics.muni.cz>
Message-ID: <20040418182303.GD21069@fi.muni.cz>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvextend fails on v2 metadata
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

	Hello, all!

	I have probably found a bug in lvextend when using v2 metadata.
The description of the problem is quite long, I am sorry.

- The system is Fedora Core 1 on x86_64.
- LVM utils lvm2-2.00.08-5 RPM from the FC2 beta, recompiled from src.rpm
- Kernel is 2.6.5

	I have two RAID-5 volumes - /dev/md5 is about 300GB, and /dev/md6
is about 480GB. I want to join them to a single logical volume, but not
just an ordinary concatenated one, but I want to achieve at leaset some
level of interleaving. So I have ran pvcreate on both volumes, then
vgcreate data_vg /dev/md5 /dev/md6 (128MB extent size, so md5 has 2266
extents and md6 has 3725 extents), and then
lvcreate -l1 /dev/data_vg/test_lv (i.e. test_lv has only one extent).
Then I have written a simple Perl script to lvextend the test_lv volume
by 1 extent from either md5 or md6, depending on which one has the higher
fraction of free extents. This way I will get as perfect interleaving as I
can get on the PVs of different size.

	The problem is that the lvextend failed when test_lv had
1999 PEs from md5 and 3286 PEs from md6, i.e. when I was trying to
add 2000th extent from md5 to test_lv. From this point on, I could
add extents from md6 to test_lv, but not from md5.

	I have repeated this twice, and it failed on the same 2000th PE
from md5. Then I have tried the same using version 1 format of metadata,
and I have successfuly created the interleaved LV from all extents of md5
and md6. I am now running a live system on this LV, so I cannot test it
further. Hope this description helps you to find where the problem is.

	Thanks,

-Yenya

-- 
| Jan "Yenya" Kasprzak  <kas@{fi.muni.cz - work | yenya.net - private}> |
| GPG: ID 1024/D3498839      Fingerprint 0D99A7FB206605D7 8B35FCDE05B18A5E |
| http://www.fi.muni.cz/~kas/   Czech Linux Homepage: http://www.linux.cz/ |
 Any compiler or language that likes to hide things like memory allocations
 behind your back just isn't a good choice for a kernel.   --Linus Torvalds
