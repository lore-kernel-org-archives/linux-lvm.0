Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KCOIdh006181
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 08:24:18 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.232])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8KCOC4n012588
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 08:24:12 -0400
Received: by wx-out-0506.google.com with SMTP id i30so465465wxd
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 05:24:11 -0700 (PDT)
Message-ID: <67d53e40609200524s5270e4b8kaef8dfd6f886cb1f@mail.gmail.com>
Date: Wed, 20 Sep 2006 15:24:11 +0300
From: "Markus Laire" <malaire@gmail.com>
Subject: Re: [linux-lvm] pvcreate on a loopback device - error: (newbie)
In-Reply-To: <ada605fb0609200427k5e86c7f5ueddcd47d00f0b14c@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <ada605fb0609200427k5e86c7f5ueddcd47d00f0b14c@mail.gmail.com>
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

On 9/20/06, John Que <qwejohn@gmail.com> wrote:
> Hello,
>
> I had tried to do some test with LVM on a loopback device
> follwing some tutorials on the web.
>
> I get errors.
> what I do is this:
>
> dd if=/dev/zero of=/work/tmp/disk-image count=10240
> mke2fs /work/tmp/disk-image
> mount -o loop /work/tmp/disk-image /work/loop/    78  14:23
>
> pvcreate /dev/loop1
>
> error:
>  Failed to wipe new metadata area
>   /dev/loop1: Format-specific setup of physical volume failed. Failed
> to setup physical volume "/dev/loop1"
>
>
> what did I do wrong ?

If you want to use LVM on a loopback device, you don't create a
filesystem on it first.

You need to do something like
  # Create new empty disk-image
  dd if=/dev/zero of=disk-image count=10240
  # set up a loop-device for it
  losetup /dev/loop2 disk-image
  # initialize that loop-device for LVM
  pvcreate /dev/loop2
  # Create a VG on it
  vgcreate Test /dev/loop2

Now you can create Logical Volumes on that VG, e.g.:
  # Create a logical volume
  lvcreate --size 4M --name MyLV Test
  # Create a filesystem on it
  mke2fs /dev/Test/MyLV
  # mount the filesystem
  mkdir MyLV
  mount /dev/Test/MyLV MyLV

And if you want to remove everything...
  umount MyLV
  rmdir MyLV
  lvremove /dev/Test/MyLV
  vgremove Test
  losetup -d /dev/loop2
  rm disk-image

-- 
Markus Laire
