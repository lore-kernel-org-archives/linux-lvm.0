Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6AHJDDF015660
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 13:19:13 -0400
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6AHJ0bl005935
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 13:19:05 -0400
Subject: Re: [linux-lvm] Copying LVM from one system to another
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <32F72C4D4D0EC8458CA5BFD76A6D6C680ACF39D0@gimli.xb.local>
References: <32F72C4D4D0EC8458CA5BFD76A6D6C680ACF39D0@gimli.xb.local>
Date: Mon, 10 Jul 2006 13:18:45 -0400
Message-Id: <1152551925.8360.52.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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

if HW is the same, why not use ghost or alike software to do a clone?

Ming

On Mon, 2006-07-10 at 16:01 +0200, Shaun Mccullagh wrote:
> Hi,
> 
> I would like to copy an entire volume group to another PC with identical
> hardware and the same disc config.
> 
> I would like to do this using a method like this:
> 
> Boot destination PC from a USB stick with a full copy of RH ES v4 on it.
> 
> Create a Volume Group and all necessary Logical Volumes etc on
> destination hard discs so that they are the same sizes as on the source.
> All the filesystems associated with these logical volumes will be mount
> under /restore.
> 
> Restore all the data that was on the source to the destination to
> /restore.
> 
> Note that /restore/boot is a small primary partition.
> 
> Once I have done this, do I copy /etc/lvm to /restore/etc/lvm, and then
> chroot /restore, then do vgscan? Finally label the discs, exec grub,
> then reboot
> 
> I guess the last bit is wrong?
> 
> TIA
> 
> Shaun
> 
> 
> 
> 
> 
> Op dit e-mailbericht is een disclaimer van toepassing, welke te vinden is op http://www.xb.nl/disclaimer.html
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
