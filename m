Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k11I7f130827
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 13:07:41 -0500
Received: from mail7.amherst.edu (mail7.amherst.edu [148.85.136.41])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k11I7L9E009587
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 13:07:26 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] 'snapshot' target still experimental :-(
Date: Wed, 1 Feb 2006 13:07:20 -0500
Message-ID: <0456A130F613AD459887FF012652963F33ED0B@mail7.amherst.edu>
From: "Steffen Plotner" <swplotner@amherst.edu>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

Ah, I see, reading is never the problem. Do a simple

cd to a directory on an lv that has an active snapshot

dd if=/dev/zero of=test bs=1M count=10000

And see how hard it is to remove a live active snapshot. You will find
that lvremove hangs, you can press Ctrl-C, then try lvscan and it hangs
- maybe 2.6.15.1 has fixed this?  Would you let us know?

Thanks.

Steffen

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Kevin P. Fleming
Sent: Wednesday, February 01, 2006 12:56 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] 'snapshot' target still experimental :-(

Steffen Plotner wrote:

> With FC4 for example I cannot remove a snapshot while the underlying 
> logical volume is under heavy I/O.  Once all I/O stops I can remove 
> the snapshot. Doing a lvremove will hang.

Interesting.

I am using this on a Gentoo system using vanilla kernel 2.6.15.1, and my
volumes don't experience 'heavy I/O' at the times I make backups, so it
shouldn't be too bad.

Thanks for the info :-)

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
