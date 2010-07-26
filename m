Message-Id: <1280183526.18769.1386844083@webmail.messagingengine.com>
From: "giovanni_re" <john_re@fastmail.us>
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
References: <1279942095.12963.1386480183@webmail.messagingengine.com>
	<4C4D4B47.8000201@redhat.com>
In-Reply-To: <4C4D4B47.8000201@redhat.com>
Date: Mon, 26 Jul 2010 15:32:06 -0700
Subject: Re: [linux-lvm] Disk Partitioning tools, - for having multi distros
 bootable - GUI preferably- best for LVM Logical Volume Management ; jor
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks Stuart, Harald & Bryn for your replies :)


On Mon, 26 Jul 2010 09:45:59 +0100, "Bryn M. Reeves" <bmr@redhat.com>
said:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 07/24/2010 04:28 AM, giovanni_re wrote:
> > So, I've got that big LV 4th partition, with empty space (2TB drive),
> > and now I want to create some more linux partitions so I can install
> > some other distros.
> 
> I'm a bit confused by your requirements. Are the other distros going to
> be installed as virtual machines (e.g. using KVM/Xen etc) or are you
> planning to boot them on "bare metal"?

Not as Virtual Machines (VMs), so must be what you are calling "bare
metal".

Ie, booting up into GRUB should show:
sda1    - linux distro 1
sda2    - linux distro 2
sda??   - in the sda4 LVM, linux distro 3
sda??+1 - in the sda4 LVM, linux distro 4
etc.


SDA4 LM currently has a /home data partition, & free space

The only place I see to put another distro partition is in the sda4 LVM.


==
BTW, I used to put an extended partition in sda4, & inside that create
logical partitions to put more distros into.

But, this time, using the KUbuntu 10.4 "alternate" (I always install
with the alternate install) installer CD (text, not gui mode), the 4th
partition was created as a LVM, not an extended partition.


> If you want to boot these directly on the hardware however you might
> want to reconsider your approach. Partitioned LVs are not supported
> out-of-the box by any distro that I know of. I think you would need to
> mess around with custom boot scripts to get the system to boot properly
> and you'll probably need to do some special tricks to get a standard
> distro installer to install onto these partitioned LVs. You would also
> need to figure out a way of sharing a /boot partition (on the physical
> disk) between all the installed distributions to avoid conflicts since
> PC BIOS boot support does not handle LVM devices.

Based on your discussion following your post, with Stuart, is that still
true?


In any case, now that Logical Volume technology exists, in addition to
the previous Extended Partition technology, what is the way to configure
the partitions with LVs to have multiple partitions available to GRUB to
boot from?


> 
> If this is your goal then you might find it easier to allocate a single
> LV to each new installation and use that directly. With a bit of fancy
> footwork in grub (and as long as each distro supports installation to an
> existing LVM2 volume group) I think this should work and would be easier
> and simpler to set up.

==  Join in the Global weekly meetings, via VOIP, about all Free SW HW & Culture
http://sites.google.com/site/berkeleytip/
