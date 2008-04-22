Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3MGcrgL000856
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:38:53 -0400
Received: from exprod7og101.obsmtp.com (exprod7og101.obsmtp.com [64.18.2.155])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3MGcN0o031895
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:38:24 -0400
Received: from stephane by ant.artesyncp.com with local (Exim 4.69)
	(envelope-from <stephane@artesyncp.com>) id 1JoLVc-0005Ho-LH
	for linux-lvm@redhat.com; Tue, 22 Apr 2008 17:38:20 +0100
Date: Tue, 22 Apr 2008 17:38:20 +0100
From: Stephane Chazelas <stephane.chazelas@emerson.com>
Subject: Re: [linux-lvm] Snapshot question...
Message-ID: <chaz20080422163820.GB6559@artesyncp.com>
References: <480DBE54.1090406@Media-Brokers.com>
	<chaz20080422104744.GI20413@artesyncp.com>
	<1208880734.7871.86.camel@pc.ilinx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1208880734.7871.86.camel@pc.ilinx>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

2008-04-22 12:12:14 -0400, Brian J. Murrell:
> On Tue, 2008-04-22 at 11:47 +0100, Stephane Chazelas wrote:
> > 
> > but
> > when you write to it, the system makes sure that unless it has
> > been done already, the block you're modifying are being copied
> > first from the "real" volume to COW volume before being modified
> > in the "real" volume.
> 
> And to be clear, the COW volumes of _all_ snapshots[1].  This is where
> the snapshot scaling problem arises.
> 
> Zumastor claim to have solved that with their snapshots.  I'd love to
> have time to play with it, indeed.
[...]

Indeed,

actually I've spent the last 3 days trying to put zumastor (well
actually ddsnap as I didn't use zumastor in the end) in place
here.

The fact that there are user space daemons involved in the
process make it very difficult to use it for the root file
system. I had to use a number of hacks for that.

Also, it seems that you can't snapshot a live (mounted) file
system as you would do with LVM2 unless you have setup that FS
beforehand as a virtual ddsnap device (LVM2 is able to suspend
the device, and reload it as a snapshot_origin for that, I
couldn't manage to do the same with ddsnap).

I also tried applying the patches to 2.6.25 and got some oops
(2.6.24.2 is fine though).

Once I've finalised it, I can post what I've come up with if
anyone is interested.

The least I can say is that I learnt a lot about grub2,
initramfs-tools, device-mapper, raid/mdadm, lvm2 in the past few
days ;).

Cheers,
Stephane
