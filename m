Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n18A0R1S007299
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2009 05:00:27 -0500
Received: from fk-out-0910.google.com (fk-out-0910.google.com [209.85.128.188])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n18A0AfZ026179
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2009 05:00:11 -0500
Received: by fk-out-0910.google.com with SMTP id k31so1350913fkk.3
	for <linux-lvm@redhat.com>; Sun, 08 Feb 2009 02:00:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1233644558.21625.12.camel@box0>
References: <1233644558.21625.12.camel@box0>
Date: Sun, 8 Feb 2009 10:00:10 +0000
Message-ID: <b072968d0902080200s7ba825cbs79432556c7551496@mail.gmail.com>
Subject: Re: [linux-lvm] Is my xen hosting tech support misleading me?
From: David Robinson <zxvdr.au@gmail.com>
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

> Attached is a question I've asked my xen hosting provider's technical
> support and the answer they've supplied.
>
> Sam sais "There is no LVM module available, so you would need to compile
> LVM by yourself from the Xen kernel sources." but I've no problem
> loading dm_mod and to my understanding of LVM, this is the only module
> needed. So is he just wrong?

If you're able to activate the volumes after the system has booted
(which the discussion below suggests), then the device-mapper modules
would already be available so there's no need to compile anything.

> The issue is that logical volumes are not activated on bootup. This prevents me from using /etc/fstab to mount them.
>
> root@shacharor:~# lvdisplay | grep 'LV Status' && udevtrigger && udevsettle && lvdisplay | grep 'LV Status'
>   LV Status              NOT available
>   LV Status              available
> root@shacharor:~#
>
> This shows that udev handles logical volumes correctly and does activate them. But why doesn't it do it on bootup?

If the volumes aren't created at boot time you're probably missing the
relevant stuff in your initial ram disk... usually, if you're root fs
is on an LVM volume, the ram disk would contain the relevant dm_*
kernel modules and a script that (amongst other things) loads the
relevant kernel modules and activates the volumes. Your simplest
solution may be to just add "vgscan --mknodes" and "vgchange -ay" to
rc.local (its uglier than fixing the initrd, but you may not be able
to recreate the initrd in your situation).

--Dave
