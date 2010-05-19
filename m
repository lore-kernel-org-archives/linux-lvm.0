Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JGCQxb010079
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:12:26 -0400
Received: from mail-gx0-f216.google.com (mail-gx0-f216.google.com
	[209.85.217.216])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JGCEtP013591
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:12:14 -0400
Received: by gxk8 with SMTP id 8so4155071gxk.9
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 09:12:12 -0700 (PDT)
From: "kevin" <k@kevinkevin.com>
References: <059801caf769$fc848350$f58d89f0$@com>
	<AANLkTimoynsSwFzCPn0G5il56UqG8smEKlCXsoPx6I7C@mail.gmail.com>
In-Reply-To: <AANLkTimoynsSwFzCPn0G5il56UqG8smEKlCXsoPx6I7C@mail.gmail.com>
Date: Wed, 19 May 2010 12:12:04 -0400
Message-ID: <05c001caf76e$06b7ea20$1427be60$@com>
MIME-Version: 1.0
Content-Language: en-us
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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
Content-Type: text/plain; charset="windows-1252"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

> - Add disk to system
> - Partition it via fdisk. Set partition type to 8e (Linux LVM)
> - run pvcreate initialize the partition for LVM
> - run vgextend to expand your existing volume group with the new device.
> - run lvextend to grow your logical volume.
> - finally, run resize2fs (assuming you are using ext3/4) to grow the
> file system.
>
>Rich


I should note that this is a logical volume for a collection of Xen virtual=
ized environments so its not an actual EXT3 filesystem. I wouldn=E2=80=99t =
need to run the last step I imagine.
