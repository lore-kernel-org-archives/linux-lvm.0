Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i32IG5j18987
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 13:16:05 -0500
Received: from pegasus.siol.net (pegasus.siol.net [193.189.160.25])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i32IG3jj021066
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 13:16:04 -0500
Received: from kudu.siol.net ([10.10.10.22]) by pegasus.siol.net
	(InterMail vK.4.03.05.03 201-232-132-103 license
	1cbf71897a39210db31154c99f0b4628)
	with ESMTP id <20040402181603.RMPF15612.pegasus@kudu.siol.net>
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 20:16:03 +0200
Received: from vector ([193.77.156.30]) by kudu.siol.net
	(InterMail vK.4.03.05.03 201-232-132-103 license
	1cbf71897a39210db31154c99f0b4628)
	with SMTP id <20040402181602.BKEJ5652.kudu@vector>
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 20:16:02 +0200
Message-ID: <001501c418de$9303c280$0400a8c0@vector>
From: "Perplexer" <perplexer@thz.net>
References: <20040402114054.F43447@cs.selu.edu>
Subject: Re: [linux-lvm] Lost Disk, any way to recover data?
Date: Fri, 2 Apr 2004 20:16:06 +0200
MIME-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi. I think I had a similar problem myself a few days ago.
Unfortunately there seemed to be noone willing to help me
out so I tried various stuff myself. I'll try to help you with
what worked for me.

I couldn't mount my LV with one drive missing from the VG
and I think there are two ways to solve this. One is to put in
an idential drive to the one you lost, use pvcreate on it and
restore the VGDA to it using vgcfgrestore. I myself didn't
have a spare drive but I had a small unused partition on some
other drive which I used instead. I used pvcreate on that
partition and then used vgcfgrestore with the -i option which
ignored the size mismatch between my partition and the previous
drive that was in.

I used:

vgcfgrestore - vg1 -i -o /dev/hdc1 -v /dev/hdd1

where hdc(1) was the old drive that died and hdd1
was the 'fake' partition. After that I ran vgscan and
activated the VG. That allowed me to mount the LV and
backup the data off it. I later had to recreate the VG and
LV but at least I saved the remaining data.

I won't say that's the only or the best way to do it but
that's all I've been able to figure out myself which worked
and I guess it's the best suggestion you'll get around here.

Good luck.

---------
Perplexer

----- Original Message ----- 
From: "Jason P Holland" <jholland@cs.selu.edu>
To: <linux-lvm@redhat.com>
Sent: Friday, April 02, 2004 7:43 PM
Subject: [linux-lvm] Lost Disk, any way to recover data?


> 
> Hello all,
> 
> I just lost a disk in my lvm set, and was wondering if there is a way to
> recover the data from the first disk.  I don't believe anything had been
> written to an LE's on the second disk. Is there a way to mount the first
> one and see if my data is still there?  Or is this a lost cause and I
> should forget about it?  Thanks
> 
> Jason
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
