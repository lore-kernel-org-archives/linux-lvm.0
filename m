Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2AGcR806087
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 11:38:27 -0500
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2AGcQ07004583
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 11:38:26 -0500
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id B10864F21
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 11:38:25 -0500 (EST)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19605-10 for <linux-lvm@redhat.com>;
	Wed, 10 Mar 2004 11:38:25 -0500 (EST)
Received: from localhost (salusa.ix.dyndns.org [192.168.1.2])
	by salusa.poochiereds.net (Postfix) with ESMTP id EE5982785
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 11:38:24 -0500 (EST)
Subject: Re: [linux-lvm] Patch for Miguel Cabe?a's lvm2create_initrd script
From: Jeffrey Layton <jtlayton@poochiereds.net>
In-Reply-To: <20040310132858.GD643@reti>
References: <403E8A0E.9070308@ist.utl.pt>
	 <1078884314.2919.16.camel@localhost>  <20040310132858.GD643@reti>
Message-Id: <1078936704.18469.33.camel@tesla.mmt.bellhowell.com>
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
Date: Wed Mar 10 11:36:28 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Wed, 2004-03-10 at 08:28, Joe Thornber wrote:
> On Tue, Mar 09, 2004 at 09:05:14PM -0500, Jeff Layton wrote:
> >  The second one is an ugly hack, and I'm definitely open to better ways
> > of handling it. After my kernel upgrade (from 2.6.1 to 2.6.4-rc2), the
> > major number of the device mapper devices on my system changed. So, I
> > added a hack to copy the contents of the ramdisk /dev/mapper directory
> > to the /dev/mapper directory on the lvm2 root filesystem, prior to the
> > pivot_root. It works for me, but I'd love to hear about better ways of
> > handling this.
> 
> Mount tmpfs on /dev/mapper, and then run 'dmsetup mknods' ?
> 
> - Joe

Hmm that might work, but what will happen to the devices after you
remount the filesystem. Will /dev/mapper always be a tmpfs filesystem
after this?

Actually, I'm thinking another way to handle this might be to do a
'chroot /rootvol /sbin/vgmknodes' prior to the pivot_root instead of the
tar copy. There might be some way to handle it without the chroot, but I
think this will work.

I'll try this method out soon.

-- Jeff
