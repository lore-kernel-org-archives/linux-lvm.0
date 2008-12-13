Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBDHdrFU010784
	for <linux-lvm@redhat.com>; Sat, 13 Dec 2008 12:39:53 -0500
Received: from mail-bw0-f20.google.com (mail-bw0-f20.google.com
	[209.85.218.20])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBDHbSsJ018299
	for <linux-lvm@redhat.com>; Sat, 13 Dec 2008 12:37:29 -0500
Received: by bwz13 with SMTP id 13so6708424bwz.3
	for <linux-lvm@redhat.com>; Sat, 13 Dec 2008 09:37:28 -0800 (PST)
Message-ID: <b072968d0812130937y64eca7dcjb6863f95397d8e7e@mail.gmail.com>
Date: Sat, 13 Dec 2008 17:37:28 +0000
From: "David Robinson" <zxvdr.au@gmail.com>
Subject: Re: [linux-lvm] Help after disk crash
In-Reply-To: <4943CB7A.305@JRAF.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4943CB7A.305@JRAF.org>
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
To: BoD@jraf.org, LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Dec 13, 2008 at 2:49 PM, BoD <BoD@jraf.org> wrote:
> Hi!
> I recently bought a new hard drive and used LVM to add it to my system.
> Unfortunately the disk just crashed. This is not too bad since I have a
> backup of the most important files.
> But currently my system can't work correctly as the crashed disk belonged to
> the vg that contains /usr, /home, /opt, /var and /tmp. (It also contains a
> /docs which I have a backup of, so it doesn't matter if I lose it.) The
> system still boots though and I can login as root.
>
> The vg is on pv0, pv1 and pv2 - It is pv2 that crashed.
> I am kind of a newbie so I don't know how to proceed, but I believe it
> should be possible to resize the vg to only use the first 2 pvs.
>
> From what I see on my /etc/lvm/backup/vg file (see below), it seems that
> only the 'docs' lv uses pv2, I think it is a good sign, right?

yep, and it does look like the docs LV was the only volume using pv2.

> So far, after googling a bit I tried vgscan -P and vgchange -Pay and tried
> to mount /dev/vg/usr but it didn't work with the following error: EXT3-fs:
> INFO: recovery required on readonly filesystem. / write access unavailable,
> cannot proceed.

That sounds like the volume group has been activated but there are
problems with the filesystem (but that does sound strange because usr
wasn't using pv2). Are you able to mount the other filesystems OK? If
so, then I'd run a fsck on /dev/vg/usr (make sure the filesystem isn't
mounted when you run fsck... not that you're able to atm :-) ).

"vgchange -Pay" will allow you to enable the volume group, but its
only temporary, ie you'll still have problems whilst booting (the VG
needs to be consistent at boot time). If the other volumes (and the
filesystems on them) are OK and running a fsck on usr fixes the
problem then use "vgreduce --removemissing vg" to permanently remove
pv2 from the volume group.

--Dave
