Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4SJjo010784
	for <linux-lvm@redhat.com>; Fri, 28 May 2004 15:45:50 -0400
Received: from imf24aec.mail.bellsouth.net (imf24aec.mail.bellsouth.net
	[205.152.59.72])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4SJjgi5030850
	for <linux-lvm@redhat.com>; Fri, 28 May 2004 15:45:42 -0400
Received: from [10.0.1.41] ([68.213.19.251]) by imf24aec.mail.bellsouth.net
	(InterMail vM.5.01.06.08 201-253-122-130-108-20031117) with ESMTP
	id <20040528194537.JEIT6744.imf24aec.mail.bellsouth.net@[10.0.1.41]>
	for <linux-lvm@redhat.com>; Fri, 28 May 2004 15:45:37 -0400
Subject: Re: [linux-lvm] dd of a used part of a logical volume?
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <20040528064553.GA1007%alexy.khrabrov@setup.org>
References: <20040528064553.GA1007%alexy.khrabrov@setup.org>
Message-Id: <1085773495.518.9.camel@david.internal.norcrossgroup.com>
Mime-Version: 1.0
Date: Fri, 28 May 2004 15:44:55 -0400
Content-Transfer-Encoding: 7bit
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
To: Linux LVM List <linux-lvm@redhat.com>

On Fri, 2004-05-28 at 02:45, Alexy Khrabrov wrote:
> I cross-post a part of my ReiserFS list message, as it
> concernes copying of a used part of a filesystem running
> on top of LVM.
> 
> I'd like to recover some files from a huge reiserfs file system.  It is
> created above an LVM volume, which in its turn sits on a RAID.  The LVM
> volume is the only one in a group which consists of the sole RAID device.
> I just deleted two files in a directory I know by name, the directory is
> still there.  No writing was done after the rm, except all files copied
> elsewhere and diff -r'ed checked, hope that does not alter the originals.
> 
> Now I'd like to play with the dd copying of the whole reiserfs (I'm
> avoiding the word partition since it covers the whole logical volume
> which spans the whole RAID device).  I simply do not have space to copy
> the whole RAID, but the size of the used space on this reiserfs volume was
> under about 9 GB.  I wonder how can I copy just about that -- I assume it
> fills the logical volume contiguously, so I can dd the first 9 GB and then
> try the loopback mount/rebuild.  Now that I'm running it, it scrolls lines
> 
> pass0: reading block 20626210 failed
> 
> like crazy, perhaps up to the whole 150 GB original size declared
> somewhere...
> 
> Then is quits, saying something about invalid argument to lseek,
> not surprisingly as I cut dd short.
> 
> Are there LVM methods to shrink it/copy just the used blocks in
> conjunction with reiserfs, such as resize_reiserfs?

Personally, if the files are valuable I would spend $400 on a 200GB
drive and a ATA133 controller.  Then you can make dd copy of the whole
filesystem.  If you put that into a single large file, then you can use
the loopback driver to mount it read-only, or to search, etc.

If there is a chance there are some bad blocks on the original disks,
then be sure to use the "conv=noerror,sync" argument to dd.

You can find an interesting primer on how to do this at
http://www.linux-forensics.com/linuxintro-LEFE-2.0.5.pdf

I would also want to see if I could find any "computer forensic" tools
for working with reiser. 

In particular, the penguin sleuth CD
http://www.linux-forensics.com/downloads.html may be able to help you.

I don't know what filesystems it supports, but the concept is you boot
off of the penguin sleuth CD (based on Knoppix), then use either basic
tools like dd, grep, etc. to recover your files.  Or they also have some
true recovery tools on the CD like autopsy.  

The above primer talks about how to do much of this.

Assuming you know linux you can skim the first half of this, but the
second half may be of more interest.

Commercial note: We do this professionally, and thus have a couple of
commercial packages, but I don't know if they support reiser or not.  If
you would consider outsourcing your recovery, let me know and I can
check.

HTH
Greg
-- 
Greg Freemyer
