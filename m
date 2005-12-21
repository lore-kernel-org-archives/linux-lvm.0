Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBLIfX102424
	for <linux-lvm@redhat.com>; Wed, 21 Dec 2005 13:41:33 -0500
Received: from dcs.nac.uci.edu (dcs.nac.uci.edu [128.200.34.32])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBLIfK9t006287
	for <linux-lvm@redhat.com>; Wed, 21 Dec 2005 13:41:26 -0500
Subject: Re: [linux-lvm] Recovery of data in LVM from a corrupt disk
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <20051221073020.70367.qmail@web36204.mail.mud.yahoo.com>
References: <20051221073020.70367.qmail@web36204.mail.mud.yahoo.com>
Date: Wed, 21 Dec 2005 10:41:08 -0800
Message-Id: <1135190468.1122.394.camel@seki.nac.uci.edu>
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


Please see http://dcs.nac.uci.edu/~strombrg/data-recovery.html -
especially the link about ext3 and LVM2.

On Tue, 2005-12-20 at 23:30 -0800, Hale India wrote:
> Hi 
> 
> I had a recovery problem with LVM before : I failed. I
> got no real help from this mailing list.
> I finaly succeed to start the disk for a short term on
> another machine and I will never use LVM before to see
> succeful recovery process.
> Nobody at redhat take care about such problem........
> In the future take ext2, ext3, reiserfs and you will
> have plenty good recovcery solutions.
> 
> Sorry to not be able to help you more.
> Good luke.
> 
> Best regards
> 
> Andre Legendre
> 
> --- mymail mymail <internetbizmail@yahoo.com> wrote:
> 
> > 
> > 
> > Michael Loftis <mloftis@wgops.com> wrote: 
> > LVM is not a filesystem, it's a block device layer. 
> > If you're 
> > running/using LVM on the existing system it's vgscan
> > and vgchange on 
> > startup should have activated all the old LVs/VGs
> > and mapped them to 
> > /dev/VGNAME/LVNAME -- those are the devices you
> > mount.
> > Thanks.
> > 
> > I realise this. But the disk I'm trying to mount is
> > built the same way as the new disk I've built. So
> > the both have a VolGroup00. What I would like to do
> > is to either understand how I can change the volume
> > group info so it will become a distinct volume
> > group, and then I can 'import' this into my new
> > environment, or how I can get into the block system
> > so I can access the filesystem structure it embeds.
> > 
> > This is where I'm struggling. I would like to create
> > a VolGroup01 device file, rename the volume group
> > within the physical volume, and then mount that. Is
> > it possible to 'hack' the old drive like this?
> > 
> > 
> > __________________________________________________
> > Do You Yahoo!?
> > Tired of spam?  Yahoo! Mail has the best spam
> > protection around 
> > http://mail.yahoo.com >
> _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at
> http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
