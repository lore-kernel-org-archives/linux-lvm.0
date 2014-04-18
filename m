Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s3ILD4Iu006766
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2014 17:13:04 -0400
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3ILD3ZN006043
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2014 17:13:03 -0400
Received: from gateway.linuxnetwork.fr (unknown [82.241.253.92])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 6BD959400AC
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2014 23:12:52 +0200 (CEST)
Received: from netstation (netstation.linuxnetwork.fr [192.168.0.1])
	by gateway.linuxnetwork.fr (Postfix) with ESMTP id 40462317CB
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2014 23:13:02 +0200 (CEST)
Date: Fri, 18 Apr 2014 23:14:17 +0200
From: "L.M.J" <linuxmasterjedi@free.fr>
Message-ID: <20140418231417.7f10605d@netstation>
In-Reply-To: <53502CB5.3060109@gathman.org>
References: <20140417122315.4c3687ea@netstation> <53502CB5.3060109@gathman.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] LVM issues after replacing linux mdadm RAID5 drive
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Le Thu, 17 Apr 2014 15:33:48 -0400,
Stuart Gathman <stuart@gathman.org> a =EF=BF=BDcrit :

Thanks for your answer

> Fortunately, your fsck was read only.  At this point, you need to=20
> crash/halt your system with no shutdown (to avoid further writes to the=20
> mounted filesystems).
> Then REMOVE the new drive.  Start up again, and add the new drive properl=
y.

RAID5 recreate : started with 2 original drives

~# mdadm --assemble --force /dev/md0 /dev/sdc1 /dev/sdd1

md0 status is normal, missing new drive : sdb(1)
~# cat /proc/mdstat=20
md0 : active raid5 sdc1[0] sdd1[1]
      3907023872 blocks level 5, 64k chunk, algorithm 2 [3/2] [UU_]


> You should check stuff out READ ONLY.  You will need fsck (READ ONLY at=20
> first), and at least some data has been destroyed.
> If the data is really important, you need to copy the two old drives=20
> somewhere before you do ANYTHING else.  Buy two more drives!  That will=20
> let you recover from any more mistakes typing Create instead of Assemble =

> or Manage.  (Note that --assume-clean warns you that you really need to=20
> know what you are doing!)

I try a read-only fsck

~# fsck -n -v -f /dev/lvm-raid/lvmp3=20
fsck from util-linux-ng 2.17.2
e2fsck 1.41.11 (14-Mar-2010)
Resize inode not valid.  Recreate? no
Pass 1: Checking inodes, blocks, and sizes
Inode 7, i_blocks is 114136, should be 8.  Fix? no
Inode 786433 is in use, but has dtime set.  Fix? no
Inode 786433 has imagic flag set.  Clear? no
Inode 786433 has compression flag set on filesystem without compression
support.  Clear? no Inode 786433 has INDEX_FL flag set but is not a directo=
ry.
Clear HTree index? no
HTREE directory inode 786433 has an invalid root node.
Clear HTree index? no
Inode 786433, i_blocks is 4294967295, should be 0.  Fix? no
[...]
Directory entry for '.' in ... (11) is big.
Split? no
Missing '.' in directory inode 262145.
Fix? no
Invalid inode number for '.' in directory inode 262145.
Fix? no
Directory entry for '.' in ... (262145) is big.
Split? no
Directory inode 917506, block #0, offset 0: directory corrupted
Salvage? no
e2fsck: aborted


Sounds bad, what should I do know ?
