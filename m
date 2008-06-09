Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m590rPKv017681
	for <linux-lvm@redhat.com>; Sun, 8 Jun 2008 20:53:25 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.157])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m590qtPg023902
	for <linux-lvm@redhat.com>; Sun, 8 Jun 2008 20:52:56 -0400
Received: by fg-out-1718.google.com with SMTP id e21so1549855fga.7
	for <linux-lvm@redhat.com>; Sun, 08 Jun 2008 17:52:55 -0700 (PDT)
Message-ID: <b072968d0806081752s79f32e66h4c6d7de1b42094a0@mail.gmail.com>
Date: Mon, 9 Jun 2008 10:52:54 +1000
From: "David Robinson" <zxvdr.au@gmail.com>
Subject: Re: [linux-lvm] Loopback mount a disk image with lvm
In-Reply-To: <2122f0920806081523w7a7ce274q9707992948f6e1b4@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <2122f0920806081523w7a7ce274q9707992948f6e1b4@mail.gmail.com>
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

On Mon, Jun 9, 2008 at 8:23 AM, Girish V <girish.xen@gmail.com> wrote:
> Hello,
>
> I have a disk.img (a disk image file, raw format) with the following "fdisk -l"
>
>    Device Boot      Start         End      Blocks   Id  System
> disk.img1   *           1          13      104391   83  Linux
> disk.img2              14        2491    19904535   8e  Linux LVM
>
> Now I can loopback mount the first bartition using
> "mount -o loop,offset=32256 disk.img /mnt".
>
> I need to mount the second partition. If the secoond partition had
> been an ext3 partition, I would have loopback mounted it as
> "mount -o loop,offset=$((255*63*512*13) disk.img /mnt", but when I try
> that, I get
> mount: unknown filesystem type 'LVM2_member'
>
> Any help is greatly appreciated.

losetup /dev/loop0 disk.img
kpartx -a /dev/loop0

Then to mount the first partition:

mount /dev/mapper/loop0p1 /mnt

Or to activate the volume group then mount the logical volume:

vgscan
vgchange -ay vg
mount /dev/vg/lv /mnt

Hope that helps.

--Dave
