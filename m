Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p5HG03f6005086
	for <linux-lvm@redhat.com>; Fri, 17 Jun 2011 12:00:12 -0400
Received: from out4.smtp.messagingengine.com (out4.smtp.messagingengine.com
	[66.111.4.28])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p5HFxxx2005031
	for <linux-lvm@redhat.com>; Fri, 17 Jun 2011 11:59:59 -0400
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.messagingengine.com (Postfix) with ESMTP id B510020B10
	for <linux-lvm@redhat.com>; Fri, 17 Jun 2011 11:59:58 -0400 (EDT)
Message-Id: <1308326398.9219.1464298109@webmail.messagingengine.com>
From: "Lee Gold" <leegold@operamail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
References: <1308260745.12257.1464013973@webmail.messagingengine.com>
	<alpine.LRH.2.00.1106170004310.20086@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1106170004310.20086@bmsred.bmsi.com>
Date: Fri, 17 Jun 2011 08:59:58 -0700
Subject: Re: [linux-lvm] Help to mount ext3 boot partiton which reports it's
 LVM2_member when I try to mount it
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
To: LVM general discussion and development <linux-lvm@redhat.com>


  

On Fri, 17 Jun 2011 00:11 -0400, "Stuart D. Gathman" <stuart@bmsi.com>
wrote:
> On Thu, 16 Jun 2011, Lee Gold wrote:
> 
> > How can this be right? I clearly remember installing the /boot as an
> > ext3 partiton.
> >
> > sudo pvs says:
> >
> > PV        VG       Fmt   Attr   PSize    PFree
> >
> > /dev/sda1          lvm2  a-     190.00m  190.00m
> >
> > /dev/sda2 system   lvm2  a-      92.97g       0
> >
> > I can mount the partitons in /dev/sda2 by installing LVM2 while using
> > the live disk and some command-line - so I can recover the data if
> > necessay so all is not lost. But I would really like to know what is
> > going on and how to get the system booting again. Again the boot
> > partition was ext3 and separate, why can't I access it, fdisk
> > confirms...?  Thanks.
> 
> I would suspect that sda and sdb do not point to the disks you think
> they do.  BIOS often swaps these around without warning.  You don't
> mention
> your physical connection (IDE/SATA/USB/FW/iSCSI/...).  This would give a
> clue
> as to what BIOS might have done - although it really isn't an LVM
> question.
> This is why it is preferred to use filesystem/PV UUIDs or labels 
> rather that whatever the current device address happens to be.
> 
> So it looks like you made /boot into a PV, although pvcreate should have
> warned that the block device was mounted.
> 

In my opinion LVM2 should of flagged me when it went about changing my
config - which it did - the boot partition's location and spec could not
of changed on it's own and while the bios could shuffle things around
only an active script could of changed things as it did and it should
have warned me - that's Comp Sci 101 - when something happens pull over
to the side of the road AND put your indicator on too. Maybe I'm wrong
but if I am it's moot. "Once burned twice shy".

-- 
http://www.fastmail.fm - Access all of your messages and folders
                          wherever you are
