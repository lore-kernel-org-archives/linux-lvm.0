Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8KDUiBZ027695
	for <linux-lvm@redhat.com>; Tue, 20 Sep 2011 09:30:44 -0400
Received: from mail.planungsteam-eb.de (mail.planungsteam-eb.de [217.9.60.248])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8KDUZUD025916
	for <linux-lvm@redhat.com>; Tue, 20 Sep 2011 09:30:36 -0400
Date: Tue, 20 Sep 2011 15:30:23 +0200
From: Holger Parplies <wopp@planungsteam-eb.de>
Message-ID: <20110920133023.GA10330@planungsteam-eb.de>
References: <4E784A95.8060709@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4E784A95.8060709@gmail.com>
Subject: Re: [linux-lvm] Debian 64bit get a "Volume vg0 not found" message
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
Content-Transfer-Encoding: 7bit
To: Brent Clark <brentgclarklist@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

Brent Clark wrote on 20.09.2011 at 10:11:01 [[linux-lvm] Debian 64bit get a "Volume vg0 not found" message]:
> [...]
> On boot, after grub, the kernel loads and it leads to a message of
> 
> Volume vg0 not found.
> 
> And then just defaults to busybox.
> 
> I mounted, and chrooted, and from all that I can see ... all looks good 
> (checked /etc/fstab and in grub.cfg I see 'insmod lvm').
> I cant see what I may and am missing.

what are you passing to the kernel as root= parameter (in grub.cfg)? For me,
root=/dev/mapper/vg-lv (replace 'vg' and 'lv' by the corresponding names)
works just fine - root=/dev/vg/lv may or may not work just as well. You can
experiment with different values at the grub command prompt without changing
grub.cfg. What kernel version are you using?

Hope that helps.

Regards,
Holger
