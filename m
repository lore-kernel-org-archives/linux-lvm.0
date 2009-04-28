Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3S3p492013884
	for <linux-lvm@redhat.com>; Mon, 27 Apr 2009 23:51:04 -0400
Received: from mail1.fujitsu.com.au (mail1.fujitsu.com.au [216.14.192.229])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3S3ojBW005280
	for <linux-lvm@redhat.com>; Mon, 27 Apr 2009 23:50:46 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail1.fujitsu.com.au (Postfix) with ESMTP id A222060323
	for <linux-lvm@redhat.com>; Tue, 28 Apr 2009 13:50:44 +1000 (EST)
Received: from mail1.fujitsu.com.au ([127.0.0.1])
	by localhost (mail1.fujitsu.com.au [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 03083-01-45 for <linux-lvm@redhat.com>;
	Tue, 28 Apr 2009 13:50:44 +1000 (EST)
Received: from SYD0633.au.fujitsu.com (unknown [137.172.78.131])
	by mail1.fujitsu.com.au (Postfix) with ESMTP id 780D960321
	for <linux-lvm@redhat.com>; Tue, 28 Apr 2009 13:50:44 +1000 (EST)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: RE: [linux-lvm] Random file system errors
Date: Tue, 28 Apr 2009 13:50:42 +1000
Message-ID: <B036E4FE3782C64682B8FCD1C358854507EC4866@FALEX03.au.fjanz.com>
In-Reply-To: <003a01c9c7a3$fa10a000$ee31e000$@no>
References: <003a01c9c7a3$fa10a000$ee31e000$@no>
From: "Steer, Geoff" <Geoff.Steer@au.fujitsu.com>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I've a server with a very similar problem to this.

Running a dd on the /var file system always gives a SCSI error at the
same spot. An fsck will fix the filesystem without errors but it will
always get remounted as read only after a short while.

I'd assumed a disk/controller problem but at the raid card firmware and
bios level, no disk errors are logged. Disks have been rescanned for bad
blocks with no errors reported.

It has 6 disks in a RAID 5 array. IBM 3650 with Serveraid 8K controller.
Redhat 5.3 with latest patches.

Regards
Geoff

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Gaute Lund
Sent: Tuesday, 28 April 2009 11:52 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] Random file system errors

I have searched the web and the mailing list without finding anything
similar to this.

At home I have an LVM setup. Reading data gives random errors. I only
recently discovered it's an LVM issue. I think.

The issue: If I md5sum largeish files, or test archives, I sometimes get
errors or randomly different md5sums. Like now, I have 11 folders, all
with
rar files in parts: some 300 15MB pieces in 6 folders/sets, totaling
4,2GB,
and 560 50MB pieces in 5 folders/sets, totaling 23G.

OK, so I "rar t" all of these 5 times over. Errors pop up randomly, 52
times
in the 50MB pieces, 10 times in the 15MB pieces. That's about 1 error
for
every 2,1GB of data read. Md5suming multiple files gives about the same
error rate.

If I run repeated test on a rar set small enough to fit in cache mem, I
get
errors, but they are indentical with each run. 

Is it really an lvm problem? Well, I have created new LVs and use
different
filesystems, ext3, xfs, jfs - they're all the same. If I create an md on
some other disks, and put a filesystem on it, without LVM, no problems.

I can't find any other errors, in any logs or dmesg. The errors weren't
there to begin with, they came at one point and got worse. It took a
while
before I realized it was a generic disk problem, and for a period I kind
of
gave up on it. So it's been there for ... maybe six months?

The VG consist of two software RAID 5 md's, one consisting of four 200GB
IDEs, one of five 500GB SATAs, yielding av VG totaling 2,37TB. Other
hardware is 4GB memory and a Core 2 Duo 6600 CPU.

Machine runs Ubuntu 8.10 with kernel 2.6.27-11, and
  LVM version:     2.02.39 (2008-06-27)
  Library version: 1.02.27 (2008-06-25)
  Driver version:  4.14.0

But the VG was originally created long ago, on LVM1 even.

Well, I guess that's it. Any other information that could be helpful?
Any
way I could debug this?

Best regards
Gaute Lund

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



This is an email from Fujitsu Australia Limited, ABN 19 001 011 427. It is confidential to the ordinary user of the email address to which it was addressed and may contain copyright and/or legally privileged information. No one else may read, print, store, copy or forward all or any of it or its attachments. If you receive this email in error, please return to sender. Thank you.
 
If you do not wish to receive commercial email messages from Fujitsu Australia Limited, please email unsubscribe@au.fujitsu.com
