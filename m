Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n58G6ole028734
	for <linux-lvm@redhat.com>; Mon, 8 Jun 2009 12:06:50 -0400
Subject: Re: [linux-lvm] read only filesystem on LVM device after changing
	path in SAN
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <200906081748.01937.sebastia@l00-bugdead-prods.de>
References: <200906081748.01937.sebastia@l00-bugdead-prods.de>
Date: Mon, 08 Jun 2009 17:11:12 +0100
Message-Id: <1244477472.18101.159.camel@breeves.fab.redhat.com>
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

On Mon, 2009-06-08 at 17:48 +0200, Sebastian Reitenbach wrote:
> When I run a dd copy job, creating a file on the Operating system partition, 
> e.g. dd if=7dev/zero of=/data/file then everything seems to be fine. I change 
> the path through the SAN via the DS4700 management GUI, and the dd job keeps 
> running as expected, so no problem without LVM.
> When I do the same on the LVM partition, then after some seconds, after I 
> switch the preferred path through the SAN, then the LVM partiton becomes 
> read-only, and the dd job dies. Then on the dom0, a 
> fdisk -l /dev/mapper/3TB-Partion still shows output, but 
> fdisk -l /dev/mapper/3TB--Partion-1 on the LVM device, just shows nothing.
> When I then shutdown the xen host, and do a:
> /etc/init.d/boot.lvm restart
> then fdisk -l /dev/mapper/3TB--Partion-1 on the LVM device, produces output 
> again. However, the startup of the xen domU may still spit out errors, and 
> the mounting of the device in the domU may still not work. I had to reboot 
> the dom0 physical host to get the partition back in a working state. 
> 
> I do not have any kind of special configuration for the LVM device, I created 
> it via yast2. 
> 
> Is there anything what I can do to prevent the LVM based partition to become 
> read-only when a path in the SAN switches? 
> If I need to provide more information let me know whats needed.

Have you configured filtering in lvm.conf to exclude the path devices?
It's worth checking that LVM is using the multipath devices to create
the mappings for the LV that's having the problem and not the underlying
SCSI disk paths.

You don't mention the kernel and lvm2 versions you're using although the
behavior you describe doesn't ring any bells with regards to already
known bugs/problems.

Regards,
Bryn.
