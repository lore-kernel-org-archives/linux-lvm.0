Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBL1Tw102820
	for <linux-lvm@redhat.com>; Tue, 20 Dec 2005 20:29:58 -0500
Received: from web88102.mail.re2.yahoo.com (web88102.mail.re2.yahoo.com
	[206.190.37.203])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id jBL1TnZA021529
	for <linux-lvm@redhat.com>; Tue, 20 Dec 2005 20:29:49 -0500
Message-ID: <20051221012944.74448.qmail@web88102.mail.re2.yahoo.com>
Date: Tue, 20 Dec 2005 20:29:44 -0500 (EST)
From: Mr Jimmy Au-Yeung <auyeungjimmy@yahoo.com>
Subject: Re: [linux-lvm] Recovery of data in LVM from a corrupt disk
In-Reply-To: <20051221011236.10857.qmail@web80907.mail.scd.yahoo.com>
MIME-Version: 1.0
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


I guessed what you needed (in AIX terminology) is
shrinkvg and then release disk space to create another
new volume group(VG).

It is much better than doing those (migratevg or
migrate fs) from one vg to another vg.

Michael is right that LVM is a software raid. VG is
the grouping of all the disk drives together. Where
File System is not dependent on the VG. 

Whilst it is even back up the impacted file system to
tapes, destroy the file system, logical volume and
volume group. Then restore the file system after the
VG, LV and FS been created. It will maximumize the
disk throughput and reduce the seek time.


--- mymail mymail <internetbizmail@yahoo.com> wrote:

> 
> 
> Michael Loftis <mloftis@wgops.com> wrote: 
> LVM is not a filesystem, it's a block device layer. 
> If you're 
> running/using LVM on the existing system it's vgscan
> and vgchange on 
> startup should have activated all the old LVs/VGs
> and mapped them to 
> /dev/VGNAME/LVNAME -- those are the devices you
> mount.
> Thanks.
> 
> I realise this. But the disk I'm trying to mount is
> built the same way as the new disk I've built. So
> the both have a VolGroup00. What I would like to do
> is to either understand how I can change the volume
> group info so it will become a distinct volume
> group, and then I can 'import' this into my new
> environment, or how I can get into the block system
> so I can access the filesystem structure it embeds.
> 
> This is where I'm struggling. I would like to create
> a VolGroup01 device file, rename the volume group
> within the physical volume, and then mount that. Is
> it possible to 'hack' the old drive like this?
> 
> 
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam
> protection around 
> http://mail.yahoo.com >
_______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://tldp.org/HOWTO/LVM-HOWTO/
