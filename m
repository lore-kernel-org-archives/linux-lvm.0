Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2JEJTM26114
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2004 09:19:29 -0500
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx2.redhat.com (8.11.6/8.11.6) with SMTP id i2JDrbA01636
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2004 08:53:38 -0500
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id E5D4082F4
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2004 09:19:26 -0500 (EST)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09230-03 for <linux-lvm@redhat.com>;
	Fri, 19 Mar 2004 09:19:06 -0500 (EST)
Received: from localhost (salusa.ix.dyndns.org [192.168.1.2])
	by salusa.poochiereds.net (Postfix) with ESMTP id A8F688215
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2004 09:19:06 -0500 (EST)
Subject: Re: [linux-lvm] root on lvm
From: Jeffrey Layton <jtlayton@poochiereds.net>
In-Reply-To: <1079478024.2432.9.camel@rich>
References: <1079478024.2432.9.camel@rich>
Message-Id: <1079705946.29353.6.camel@tesla.mmt.bellhowell.com>
Mime-Version: 1.0
Date: Fri, 19 Mar 2004 09:19:06 -0500
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

On Tue, 2004-03-16 at 18:00, Rich Turner wrote:
> i am trying to mount / on a logical volume with reiserfs. my initrd
> appears to be loading all of the appropriate modules (lvm-mod, dm-mod,
> reiserfs) but i get the following error when the initrd exits and tries
> to mount /.
> 
> device-mapper: unknown block ioctl 0x5310
> sh-2021: reiserfs_read_super: can not find reiserfs on device mapper
> (254,1)
> 
> is this related to reiserfs or lvm? or my initrd?
> using:
> lvm-2.00.07
> reiserfs-3.6.9-37
> suse-9.0
> kernel-2.4.21-144-athlon
> 

You likely are hitting a problem with the device numbering for DM
devices. The kernel dynamically allocates major and minor numbers for
the DM, so booting to a different kernel can renumber your DM devices.
Have a look at the lvm2create_initrd script that's been posted on this
list several times to see how I (and others) have handled this
situation. It's also available here:

http://poochiereds.net/svn/lvm2create_initrd

-- Jeff
