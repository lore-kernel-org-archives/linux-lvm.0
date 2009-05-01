Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n411SVVF010352
	for <linux-lvm@redhat.com>; Thu, 30 Apr 2009 21:28:31 -0400
Received: from out-of-band.media.mit.edu (out-of-band.media.mit.edu
	[18.85.1.38])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n411SIkP003976
	for <linux-lvm@redhat.com>; Thu, 30 Apr 2009 21:28:18 -0400
Date: Thu, 30 Apr 2009 21:28:17 -0400 (EDT)
Message-Id: <200905010128.VAA12590@out-of-band.media.mit.edu>
From: f-lvm@media.mit.edu
In-reply-to: <49FA355A.3060408@cox.net> (rascal.jumper-747@cox.net)
Subject: [linux-lvm] Random file system errors
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

    > Date: Thu, 30 Apr 2009 19:33:46 -0400
    > From: "Clyde E. Kunkel" <rascal.jumper-747@cox.net>

    > On 04/28/2009 11:52 PM, f-lvm@media.mit.edu wrote:
    > > Btw, one way to proceed on the test-your-hardware angle without
    > > yanking disks (or even opening the case) and possibly turning this
    > > into a heisenbug if it really -is- something like cabling would be
    > > to do something like this:
    > >
    > >     dd if=/dev/hda bs=1M count=1000 | md5sum

    > Frequent mismatched sha1sums on /dev/sdf which has the PV for the 
    > problem LV.  All other /dev/sd* ran clean.

    > Thanks for the valuable debugging method.  Looks like a SIL 680 card, or 
    > cable, or Seagate drive problem, but will be easy to isolate.

Good to hear.  Well, not good really, since hardware issues never are,
but at least you've got something you can now debug...

(And it lets LVM off the hook as well.)
