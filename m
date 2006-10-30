Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9UMjkUG001349
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2006 17:45:46 -0500
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.174])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9UMjBL2021569
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2006 17:45:12 -0500
Received: by ug-out-1314.google.com with SMTP id 39so1303914ugf
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2006 14:45:05 -0800 (PST)
Message-ID: <87f94c370610301445i68084a91pe201dbaa6f24275d@mail.gmail.com>
Date: Mon, 30 Oct 2006 17:45:05 -0500
From: "Greg Freemyer" <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] "cloning" from ide to sata drive, can't find root
In-Reply-To: <1162247811.45467e83cae80@webmail.highstream.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1162247811.45467e83cae80@webmail.highstream.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 10/30/06, brianmas@highstream.net <brianmas@highstream.net> wrote:
> I did a straight up mirroring of a drive doing dd if=/dev/hda of=/dev/sda where
> the src is an ide drive and target a sata drive and not unexpectedly it can't
> find the root device on boot.
>
> Typing out the error message ...
>
> [snip]
> Reading all physical volumes this may take a while ...
> No volume groups found
> Unable to find Volume Group "VolGroup00"
> [snip]
>
> I used a rescue disc distro and used dd to extract info subtible for
> vgcfgrestore,
> after which I did some other finagaling with vgchange and I can mount the volume
> and view the data on it, so it's there, vgscan/pvscan and lvscan all show it ...
> but as mentioned boot it's just not picked up on boot so it can be mounted as
> '/'. I thought I fixed it with the vgcfgrestore (changing /dev/hda2 to
> /dev/sda2) but obviously not ... any guidance is appreciated.
>
> thank you,
> brian

Ignoring LVM issues, I believe I've done this in the past with
traditional partitions.  IIRC, all I did was add a root=/dev/sdaX
parameter on my grub boot command line, and then use that to boot
single-user mode and edit my /etc/fstab to reference the correct
device.

Not sure how LVM would change that.

FYI: I personally don't use LVM on my boot and root partitions.

Greg
-- 
Greg Freemyer
The Norcross Group
Forensics for the 21st Century
