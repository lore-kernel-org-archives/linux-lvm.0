Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2M2KYj16630
	for <linux-lvm@redhat.com>; Sun, 21 Mar 2004 21:20:34 -0500
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2M2KXWA025225
	for <linux-lvm@redhat.com>; Sun, 21 Mar 2004 21:20:33 -0500
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id C95FFBA72
	for <linux-lvm@redhat.com>; Sun, 21 Mar 2004 21:20:27 -0500 (EST)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28861-02 for <linux-lvm@redhat.com>;
	Sun, 21 Mar 2004 21:20:27 -0500 (EST)
Received: from tleilax.ix.dyndns.org (tleilax.ix.dyndns.org [192.168.1.3])
	by salusa.poochiereds.net (Postfix) with ESMTP id 0A4DA16EE
	for <linux-lvm@redhat.com>; Sun, 21 Mar 2004 21:20:26 -0500 (EST)
Subject: Re: [linux-lvm] root on lvm
From: Jeff Layton <jtlayton@poochiereds.net>
In-Reply-To: <1079729272.2126.12.camel@pascal>
References: <1079478024.2432.9.camel@rich>
	<1079705946.29353.6.camel@tesla.mmt.bellhowell.com>
	<1079729272.2126.12.camel@pascal>
Message-Id: <1079922026.2361.7.camel@localhost>
Mime-Version: 1.0
Date: Sun, 21 Mar 2004 21:20:26 -0500
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

My solution for this (so far) is to make a non-LVM2 /boot partition and
store a kernel and initrd in that. You can then build everything else as
a LVM partition. Perhaps when the available bootloaders become LVM2
aware we'll be able to do away with a seperate /boot, but for now it
seems to be the best way to deal with it.
Cheers,
-- Jeff


On Fri, 2004-03-19 at 15:47, Garcia Pascal wrote:
> Hello,
> I experienced also difficulties with / and lvm2.
> configuration: 
>    MANDRAKE 10.0, 
>    kernel 2.6.3, 
>    lilo 22.5.8, 
>    reiserfs 3.6.11 ?
>    lvm 2.00.08
>  
> The message I have got is something like lilo does not handle device
> type 0x1f00 
> 
> Can not ensure that it is the exact message and type.
> 
> I understood that the version of lilo I use can not handle lvm2 and
> reiserfs partition for / during boot ! And especially can not get boot
> image in /boot.
> 
> Shame :(
> 
> regards
> 
> Pascal Garcia
> 
> Le ven 19/03/2004 � 15:19, Jeffrey Layton a �crit :
> > On Tue, 2004-03-16 at 18:00, Rich Turner wrote:
> > > i am trying to mount / on a logical volume with reiserfs. my initrd
> > > appears to be loading all of the appropriate modules (lvm-mod, dm-mod,
> > > reiserfs) but i get the following error when the initrd exits and tries
> > > to mount /.
> > > 
> > > device-mapper: unknown block ioctl 0x5310
> > > sh-2021: reiserfs_read_super: can not find reiserfs on device mapper
> > > (254,1)
> > > 
> > > is this related to reiserfs or lvm? or my initrd?
> > > using:
> > > lvm-2.00.07
> > > reiserfs-3.6.9-37
> > > suse-9.0
> > > kernel-2.4.21-144-athlon
> > > 
> > 
> > You likely are hitting a problem with the device numbering for DM
> > devices. The kernel dynamically allocates major and minor numbers for
> > the DM, so booting to a different kernel can renumber your DM devices.
> > Have a look at the lvm2create_initrd script that's been posted on this
> > list several times to see how I (and others) have handled this
> > situation. It's also available here:
> > 
> > http://poochiereds.net/svn/lvm2create_initrd
> > 
> > -- Jeff
> > 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
Jeff Layton <jtlayton@poochiereds.net>
