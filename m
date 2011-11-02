Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pA2AIxPS024736
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 06:18:59 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA2AIvux003419
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 06:18:58 -0400
Received: from gtw.srd.co.uk ([82.69.77.54] helo=agnew.srd.co.uk)
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1RLXU9-0001fs-2k
	for linux-lvm@redhat.com; Wed, 02 Nov 2011 09:51:53 +0000
Message-ID: <4EB1190A.30501@ankh.org>
Date: Wed, 02 Nov 2011 10:18:50 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <604704853.1651560.1320172792894.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
In-Reply-To: <604704853.1651560.1320172792894.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] N00b Question: Logical Volume without a Logical
 Volume Group ?
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

Dan White wrote:
> Is a logical volume group necessary before one can start making mountable partitions ?
>
> I'm trying to work with a SAN.  We were allocated a 10Gb LUN to "play" with. Another admin created a logical volume on the LUN and then made a single partition out of the logical volume.  The flow I am familiar with from Red Hat's GUI is to first make a logical volume group, then make partitions in the group that I can adjust in size as necessary.
>
> Are both workflows valid ?
>
>   

It would have been possible to just build a filesystem directly on the 
disk, to do a single partition with all the space, I would never do the 
first thing as it is possible for other sysadmins easily make the 
mistake of thinking the disk was blank, (particularly if it is not 
mounted all the time). The second one is fine however the problem is if 
you ever with to change to size of the partition, it is possible but it 
is hard work.

Personally even with LVM I would still write a partition table the disk, 
this helps show the disk as being used to other system administrators, 
however there would be one partition on it of type 8e, and on that I 
would create a PV (physical volume), this PV can then be used to create 
a VG (Volume group) or be added to an exisiting one, when i create VGs I 
normally use an ext size of arround 128m->256m to keep down the number 
of disk fragments managed by the kernel. From that VG I can create an LV 
(Logical Volume) Personally I would never allocate the whole space in a 
volume group to an LV, even the volume group was just being used to join 
disks together to make one huge filesystem, I try to keep by 5% of the 
disk space this will allow the use of snapshots which are create for 
keeping things consistent when backups are done.

As other posters have said, LVM always making changes to disk space much 
easier, try the following with a partion table along...

Shrink 10g filesystem to 2g
Create another 2g filesystem
Expand first filesystem back to 8g
And another 10g peice of disk and add the space to the first filesystem.

James
