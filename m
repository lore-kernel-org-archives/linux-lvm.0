Received: from o.ww.redhat.com (vpn50-11.rdu.redhat.com [172.16.50.11])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i2VDW5mX010013
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 15:32:05 +0200
Date: Wed, 31 Mar 2004 15:32:05 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Removing an Old disk (LVM HOW-TO)
Message-ID: <20040331133205.GA29222@redhat.com>
References: <001301c4164d$14b733a0$0400a8c0@vector>
	<002201c41651$12d53060$0400a8c0@vector>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002201c41651$12d53060$0400a8c0@vector>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Mar 30, 2004 at 02:18:12PM +0200, Perplexer wrote:
> Additional question:
> 
> Can a PV be removed from the VG without executing pvmove
> before (bruteforce remove if you will) ? What would I have to
> do if I wanted to remove it (e2fsadm?, lvreduce? ...) ?

The steps necessary depend on the situation you start out with.

In case the PV you want to remove is already empty, just vgreduce the VG
by it (eg, "vgreduce YourVG /dev/YourEmptyPV"). Remove the drive from
your system or reuse it for some other purpose after a *successfull* vgreduce.

Please keep in mind, that your PV which got removed from the VG can be
sitting in one partition of the disk and the others might be still in use!


If the PV has LV(s) allocated to it, there's 2 different cases:

o you are able to remove those LVs completely, which is unlikely
  in the typical case
o you need to be able to shrink them (eg, your e2fsadm point in your other mail)


In both cases (remove and shrink) you can (and likely will) end up
with physical extents still allocated to the PV to remove.

*Then* you need pvmove to move their contents off to some or many
other PV(s) in order to free the PV before vgreduce on the VG.
If there's no free space on other PVs of your VG, you can of course
extend the VG by some new PV and pvmove the extents off to it.

You see, it depends on your particular storage situation but there's
just a few cases to distinguish.

Regards,
Heinz    -- The LVM Guy --

> 
> ---------
> Perplexer
> 
> ----- Original Message ----- 
> From: "Perplexer" <perplexer@thz.net>
> To: <linux-lvm@redhat.com>
> Sent: Tuesday, March 30, 2004 1:49 PM
> Subject: [linux-lvm] Removing an Old disk (LVM HOW-TO)
> 
> 
> > There is a section describing how to remove and old disk
> > from LVM at http://tldp.org/HOWTO/LVM-HOWTO/removeadisk.html
> > but nothing is said about reducing LV before this is done.
> > 
> > Must a LV be reduced using e2fsadm before any attempt to remove a PV
> > is made in order to prevent data loss ?
> > 
> > ---------
> > Perplexer
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
