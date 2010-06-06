Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5640DhG014792
	for <linux-lvm@redhat.com>; Sun, 6 Jun 2010 00:00:13 -0400
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o56404nw012128
	for <linux-lvm@redhat.com>; Sun, 6 Jun 2010 00:00:04 -0400
Message-ID: <4C0B1D3F.8090904@alteeve.com>
Date: Sat, 05 Jun 2010 23:59:59 -0400
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <1275795202.3993.30@raydesk1.bettercgi.com>
In-Reply-To: <1275795202.3993.30@raydesk1.bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Imaged a drive, now kernel panics
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Ray Morris <support@bettercgi.com>

On 10-06-05 11:33 PM, Ray Morris wrote:
>   You mentioned that the old drive is IDE.  If so,
> You may be running into a couple problems I've had.
> I take it the new drive is SATA, SAS, or SCSI?
> Did you edit /etc/fstab to change hda to sda, hdb
> to sdb, etc., before running mkinitrd?

Yup, simple SATA.

> The existing kernel may not have the needed drivers
> compiled in, the drivers for the particular chipset
> and whatever SCSI drivers or modules are needed.
> Assuming that rescue kernel matches the kernel on
> the failed drive, mkinitrd _should_ take care of that
> if /etc/fstab is correct. Might it might look at
> mtab?

I just went through /etc grep'ing for and replace hda for sda. Also, the 
system has CentOS 4.4 and my rescue disk is CentOS 4.8...

> Be sure to bind /proc, /sys, /dev, and /selinux
> into the chroot. We want to be able to see /dev/sda
> it order to set up to boot from it. Along the same lines,
> double check that any other partitions, primarily /boot,
> are mounted in the chroot.

Sorry, how do I bind those fs into chroot?

> That should pretty much you, but before I figured out
> some of the possible failure modes I build modified several
> initrd by hand. You can debug the init script with simple
> echo statements much like you would debug any simple
> script.
>
> One last thing - on some motherboards the BIOS can
> be set to present a SATA drive as if it were IDE, I
> understand. qemu-kvm can also present a hard drive image
> as either SCSI or IDE, regardless of the actual underlying
> hardware. So you could present your SATA or SCSI drive
> as an IDE drive in order to make the old initrd and kernel
> happy.

I'll look at that if all else fails.

-- 
Digimer
E-Mail:         linux@alteeve.com
AN!Whitepapers: http://alteeve.com
Node Assassin:  http://nodeassassin.org
