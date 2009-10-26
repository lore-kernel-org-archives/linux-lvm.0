Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9QKYQ7o009526
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 16:34:26 -0400
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9QKY7FA013219
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 16:34:08 -0400
Subject: Re: [linux-lvm] Removing a very old physical drive
From: Nicholas Robinson <npr@bottlehall.co.uk>
In-Reply-To: <20091026161005.GB23405@us.ibm.com>
References: <1256547598.22335.32.camel@elm.bottlehall.co.uk>
	<20091026161005.GB23405@us.ibm.com>
Date: Mon, 26 Oct 2009 20:33:56 +0000
Message-Id: <1256589236.27439.2.camel@elm.bottlehall.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Help!

I did the pvremove command and everything seemed fine. I carried on
working on the first question and tried to do the pvmove

Immediately the machine hung and when I try to reboot, it finds the boot
partition and begins the boot, but then hangs with a blank screen and
top-left cursor. Occasionally, I can stop it with some messages about
dm-1 and logical block 0 to 8 missing.

I wonder if the pvremove over-wrote something important on the other
partition as it had an incorrect view of the size of the sda1?

Thanks

Nick


On Mon, 2009-10-26 at 09:10 -0700, malahal@us.ibm.com wrote:
> Nicholas Robinson [npr@bottlehall.co.uk] wrote:
> > Hi
> > 
> > I've been using lvm for quite a few years, but only occasionally when I
> > need to add/remove new drives. So, my knowledge is limited and a bit
> > rusty! I should have removed the old drive when I added a new one a
> > couple of years ago, but for reasons I cannot remember, I didn't.
> > 
> > I only know how to remove a drive when there is a new drive about to
> > move the stuff onto. My problem now is that the new drive is fully
> > allocated and so this route won't work. There is plenty of free space on
> > the new drive so it should be possible to move everything that might be
> > on the old physical drive and then remove it from the lvg. I just can't
> > work out how. The HOWTOs and threads don't seem to cover this starting
> > point.
> > 
> > My questions are:
> > 
> > 1. Can I do move the data off the old drive to the new drive without
> > adding another new drive?
>  
> pvmove followed by vgreduce. If you have enough free space, pvmove
> should work and there is no need to add another new drive.
> 
> > 2. I don't understand the output from pvdisplay - why is it telling me
> > about /dev/sda1 at the bottom when this partition is a boot partition
> > and tiny?
> 
> It also reports a large size! Somehow, it detected PV signature in that
> partition. You can remove such signature by running pvremove. Note that
> it wipes out LVM label, so back up your data in /dev/sda1 somewhere else
> before you run "pvremove /dev/sda1". If the partition is mountable after
> 'pvremove', you are fine. Otherwise restore the backup!
> 
> > 3. Where has the LogVol01 come from and what is it doing? Can I remove
> > it?
> 
> Try mounting it and see if there is anything there. You can use lvremove
> if you don't need it.
> 
> > 4. Can I rename the volgroup/logvols to the same pattern used by new
> > installations? e.g. vg_hostname and lv_root, etc.
> 
> Yes, see lvrename and vgrename commands.
>  
> > If you've read this far, then thank you! I hope the following extracts
> > are sufficient.
> 
> You are welcome.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
