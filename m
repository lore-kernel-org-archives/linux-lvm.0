Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m58MNZiv006203
	for <linux-lvm@redhat.com>; Sun, 8 Jun 2008 18:23:35 -0400
Received: from yw-out-2324.google.com (yw-out-2324.google.com [74.125.46.29])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m58MNOwQ027475
	for <linux-lvm@redhat.com>; Sun, 8 Jun 2008 18:23:24 -0400
Received: by yw-out-2324.google.com with SMTP id 5so973202ywb.81
	for <linux-lvm@redhat.com>; Sun, 08 Jun 2008 15:23:24 -0700 (PDT)
Message-ID: <2122f0920806081523w7a7ce274q9707992948f6e1b4@mail.gmail.com>
Date: Sun, 8 Jun 2008 18:23:23 -0400
From: "Girish V" <girish.xen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Loopback mount a disk image with lvm
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
To: linux-lvm@redhat.com

Hello,

I have a disk.img (a disk image file, raw format) with the following "fdisk -l"

    Device Boot      Start         End      Blocks   Id  System
disk.img1   *           1          13      104391   83  Linux
disk.img2              14        2491    19904535   8e  Linux LVM

Now I can loopback mount the first bartition using
"mount -o loop,offset=32256 disk.img /mnt".

I need to mount the second partition. If the secoond partition had
been an ext3 partition, I would have loopback mounted it as
"mount -o loop,offset=$((255*63*512*13) disk.img /mnt", but when I try
that, I get
mount: unknown filesystem type 'LVM2_member'

Any help is greatly appreciated.

Thanks.
