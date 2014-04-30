Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3UKvXcI028584
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2014 16:57:33 -0400
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3UKvVW5016873
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2014 16:57:32 -0400
Received: from android-4198c7e77829cbef.linuxnetwork.fr (unknown
	[82.241.253.92])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 177FFA6224
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2014 22:56:50 +0200 (CEST)
In-Reply-To: <20140426204744.25b201e4@netstation>
References: <20140417122315.4c3687ea@netstation> <53502CB5.3060109@gathman.org>
	<20140418231417.7f10605d@netstation>
	<20140426204744.25b201e4@netstation>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: "L. M. J" <linuxmasterjedi@free.fr>
Date: Wed, 30 Apr 2014 22:57:28 +0200
Message-ID: <599815ce-7b0b-4e19-ab23-f3fe804102cc@email.android.com>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 26 avril 2014 20:47:44 CEST, "L.M.J" <linuxmasterjedi@free.fr> wrote:
>
>What do you think about this command :
>
>
>  ~# dd if=/dev/md0 bs=512 count=255 skip=1 of=/tmp/md0.txt
>   
>	[..]
>	physical_volumes {
>		pv0 {
>			id = "5DZit9-6o5V-a1vu-1D1q-fnc0-syEj-kVwAnW"
>			device = "/dev/md0"
>			status = ["ALLOCATABLE"]
>			flags = []
>			dev_size = 7814047360
>			pe_start = 384
>			pe_count = 953863
>		}
>	}
>	logical_volumes {
>
>		lvdata {
>			id = "JiwAjc-qkvI-58Ru-RO8n-r63Z-ll3E-SJazO7"
>			status = ["READ", "WRITE", "VISIBLE"]
>			flags = []
>			segment_count = 1
>	[..]
>
>I presume I still have data on my broken RAID5.
>
>I did a pvcreate --restorefile and vgcfgrestore.
>I can see now my 2 LVM, but my EXT4 filesystem are empty, df reports
>some realist disk usage, fsck (Read
>only) find tons of errors.
>
>Is there a way to recover my data on the EXT4 FS ?
>
>
>
>
>Le Fri, 18 Apr 2014 23:14:17 +0200,
>"L.M.J" <linuxmasterjedi@free.fr> a écrit :
>
>> Le Thu, 17 Apr 2014 15:33:48 -0400,
>> Stuart Gathman <stuart@gathman.org> a écrit :
>> 
>> Thanks for your answer
>> 
>> > Fortunately, your fsck was read only.  At this point, you need to 
>> > crash/halt your system with no shutdown (to avoid further writes to
>the 
>> > mounted filesystems).
>> > Then REMOVE the new drive.  Start up again, and add the new drive
>properly.
>> 
>> RAID5 recreate : started with 2 original drives
>> 
>> ~# mdadm --assemble --force /dev/md0 /dev/sdc1 /dev/sdd1
>> 
>> md0 status is normal, missing new drive : sdb(1)
>> ~# cat /proc/mdstat 
>> md0 : active raid5 sdc1[0] sdd1[1]
>>       3907023872 blocks level 5, 64k chunk, algorithm 2 [3/2] [UU_]
>> 
>> 
>> > You should check stuff out READ ONLY.  You will need fsck (READ
>ONLY at 
>> > first), and at least some data has been destroyed.
>> > If the data is really important, you need to copy the two old
>drives 
>> > somewhere before you do ANYTHING else.  Buy two more drives!  That
>will 
>> > let you recover from any more mistakes typing Create instead of
>Assemble 
>> > or Manage.  (Note that --assume-clean warns you that you really
>need to 
>> > know what you are doing!)
>> 
>> I try a read-only fsck
>> 
>> ~# fsck -n -v -f /dev/lvm-raid/lvmp3 
>> fsck from util-linux-ng 2.17.2
>> e2fsck 1.41.11 (14-Mar-2010)
>> Resize inode not valid.  Recreate? no
>> Pass 1: Checking inodes, blocks, and sizes
>> Inode 7, i_blocks is 114136, should be 8.  Fix? no
>> Inode 786433 is in use, but has dtime set.  Fix? no
>> Inode 786433 has imagic flag set.  Clear? no
>> Inode 786433 has compression flag set on filesystem without
>compression
>> support.  Clear? no Inode 786433 has INDEX_FL flag set but is not a
>directory.
>> Clear HTree index? no
>> HTREE directory inode 786433 has an invalid root node.
>> Clear HTree index? no
>> Inode 786433, i_blocks is 4294967295, should be 0.  Fix? no
>> [...]
>> Directory entry for '.' in ... (11) is big.
>> Split? no
>> Missing '.' in directory inode 262145.
>> Fix? no
>> Invalid inode number for '.' in directory inode 262145.
>> Fix? no
>> Directory entry for '.' in ... (262145) is big.
>> Split? no
>> Directory inode 917506, block #0, offset 0: directory corrupted
>> Salvage? no
>> e2fsck: aborted
>> 
>> 
>> Sounds bad, what should I do know ?
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Help please :-( 
-- 
May the open source be with you my young padawan. 

Envoyé de mon téléphone, excusez la brièveté.
