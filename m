Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4S6k1024195
	for <linux-lvm@redhat.com>; Fri, 28 May 2004 02:46:01 -0400
Received: from angle.badbox.com (bgp543256bgs.ewndsr01.nj.comcast.net
	[68.38.148.149])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4S6jxi5029535
	for <linux-lvm@redhat.com>; Fri, 28 May 2004 02:45:59 -0400
Received: from angle.badbox.com (localhost [127.0.0.1])
	by angle.badbox.com (8.12.10/8.12.5) with ESMTP id i4S6jsbr001088
	for <linux-lvm@redhat.com>; Fri, 28 May 2004 02:45:54 -0400
Received: (from alexy@localhost)
	by angle.badbox.com (8.12.10/8.12.10/Submit) id i4S6jrc0001081
	for linux-lvm@redhat.com; Fri, 28 May 2004 02:45:53 -0400
Date: Fri, 28 May 2004 02:45:53 -0400
From: Alexy Khrabrov <list+lvm@setup.org>
Message-ID: <20040528064553.GA1007%alexy.khrabrov@setup.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] dd of a used part of a logical volume?
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
To: Linux LVM List <linux-lvm@redhat.com>


I cross-post a part of my ReiserFS list message, as it
concernes copying of a used part of a filesystem running
on top of LVM.

I'd like to recover some files from a huge reiserfs file system.  It is
created above an LVM volume, which in its turn sits on a RAID.  The LVM
volume is the only one in a group which consists of the sole RAID device.
I just deleted two files in a directory I know by name, the directory is
still there.  No writing was done after the rm, except all files copied
elsewhere and diff -r'ed checked, hope that does not alter the originals.

Now I'd like to play with the dd copying of the whole reiserfs (I'm
avoiding the word partition since it covers the whole logical volume
which spans the whole RAID device).  I simply do not have space to copy
the whole RAID, but the size of the used space on this reiserfs volume was
under about 9 GB.  I wonder how can I copy just about that -- I assume it
fills the logical volume contiguously, so I can dd the first 9 GB and then
try the loopback mount/rebuild.  Now that I'm running it, it scrolls lines

pass0: reading block 20626210 failed

like crazy, perhaps up to the whole 150 GB original size declared
somewhere...

Then is quits, saying something about invalid argument to lseek,
not surprisingly as I cut dd short.

Are there LVM methods to shrink it/copy just the used blocks in
conjunction with reiserfs, such as resize_reiserfs?

-- 
Cheers,
Alexy Khrabrov :: www.setup.org :: Age Quod Agis
