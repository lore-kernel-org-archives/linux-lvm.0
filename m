Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6SIAT7E023723
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2010 14:10:30 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6SIAIfj013119
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2010 14:10:18 -0400
Message-ID: <4C507287.7050007@bmsi.com>
Date: Wed, 28 Jul 2010 14:10:15 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <1279942095.12963.1386480183@webmail.messagingengine.com>	<4C4D4B47.8000201@redhat.com>
	<1280183526.18769.1386844083@webmail.messagingengine.com>
In-Reply-To: <1280183526.18769.1386844083@webmail.messagingengine.com>
Content-Transfer-Encoding: 7bit
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
Cc: giovanni_re <john_re@fastmail.us>

On 07/26/2010 06:32 PM, giovanni_re wrote:
> Not as Virtual Machines (VMs), so must be what you are calling "bare
> metal".
>
> Ie, booting up into GRUB should show:
> sda1    - linux distro 1
> sda2    - linux distro 2
> sda??   - in the sda4 LVM, linux distro 3
> sda??+1 - in the sda4 LVM, linux distro 4
> etc.
>
>
> SDA4 LM currently has a /home data partition, & free space
>
> The only place I see to put another distro partition is in the sda4 LVM.
> Based on your discussion following your post, with Stuart, is that still
> true?
>
>
> In any case, now that Logical Volume technology exists, in addition to
> the previous Extended Partition technology, what is the way to configure
> the partitions with LVs to have multiple partitions available to GRUB to
> boot from?
>   
Use a large /boot partition.  The last time I used Ubuntu, it did not
easily support having a separate /boot filesystem (instead making the
root fs bootable), so that could be a problem, unless Ubuntu also
supports grub 2 (with LVM support).

So, with distros that support separate /boot (e.g. Fedora and EL), just
share the /boot partition between them (they should name the files to
avoid conflicts).  Each grub entry specifies the root filesystem, which
can be a LV. 
There can be multiple instances with the same kernel version (e.g. F12
before scary update, F12 after scary update).

With distros that don't support /boot, but *do* support grub 2 (and you
have grub 2), then grub entries refer to kernel files in LVs for the distro.

With distros that support both, do it either way.

With OS that do not support LVM (E.g. Windows), you will have to have a
partition and chain load in grub.
