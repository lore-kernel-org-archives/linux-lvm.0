Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2BEet827501
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 09:40:55 -0500
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2BEes07001678
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 09:40:54 -0500
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id E679275B1
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 09:40:53 -0500 (EST)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19867-05 for <linux-lvm@redhat.com>;
	Thu, 11 Mar 2004 09:40:53 -0500 (EST)
Received: from localhost (salusa.ix.dyndns.org [192.168.1.2])
	by salusa.poochiereds.net (Postfix) with ESMTP id 6C7D62926
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 09:40:53 -0500 (EST)
Subject: Re: [linux-lvm] Patch for Miguel Cabeca's lvm2create_initrd script
From: Jeffrey Layton <jtlayton@poochiereds.net>
In-Reply-To: <1078968102.3348.20.camel@localhost>
References: <1078968102.3348.20.camel@localhost>
Message-Id: <1079016053.2262.26.camel@tesla.mmt.bellhowell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Mar 11 09:39:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Wed, 2004-03-10 at 20:21, Jeff Layton wrote:
> Ok -- I think I have it now (for real this time :-). I've overhauled the
> mechanism for cleaning up device entries:
> 
> 1) we first remove /rootvol/dev/mapper
> 2) mknod a /rootvol/dev/mapper/control device file
> 3) chroot to /rootvol, mount /proc, run /sbin/vgmknodes, and umount
> /proc
> 
> This should make all the correct device entries and vg symlinks under
> /dev, and should allow the initrd images to cope with the renumbering of
> major/minor numbers, as I've found sometimes happens on kernel upgrades.
> 
> Attached is a patch to Miguel's original script. The current one is
> available from:
> 
> http://poochiereds.net/svn/lvm2create_initrd
> 
> As always, comments and/or patches are welcome.

Alas, I think I've solved this problem in the wrong place. The real
problem is that the LVM startup script on Debian that runs prior to the
mountall script doesn't add the --mknodes flag when it runs vgscan.

I think that's the correct place to have it fix the device entries. I'm
working with the maintainer of the lvm-common debian package now to see
if we can get the fix rolled into their package.

So the only change that should be needed to Miguel's script is to add
/initrd entries to the PATH.

Cheers,
Jeff
