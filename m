Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JFwXpt008097
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 11:58:34 -0400
Received: from mail-pw0-f46.google.com (mail-pw0-f46.google.com
	[209.85.160.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JFwPHJ016877
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 11:58:25 -0400
Received: by pwi5 with SMTP id 5so1700113pwi.33
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 08:58:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <059801caf769$fc848350$f58d89f0$@com>
References: <059801caf769$fc848350$f58d89f0$@com>
Date: Wed, 19 May 2010 11:58:24 -0400
Message-ID: <AANLkTimoynsSwFzCPn0G5il56UqG8smEKlCXsoPx6I7C@mail.gmail.com>
From: Richard Jerrido <rjerrido@outsidaz.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, May 19, 2010 at 11:43 AM, kevin <k@kevinkevin.com> wrote:
> Howdy,
>
>
>
>
>
> I have a live production system w/ logical volume that i want to add a dr=
ive
> to. I just wanted to confirm that adding a drive
> (fdisk+mkfs+pvcreate+vgextend+lvextend) is the right way to go about addi=
ng
> a disk to logical volumes? I want to ensure that the existing data on the
> logical volume isn=E2=80=99t compromised and have never done this before.
>
>
>
> If theres something I should be aware of or if my process is incorrect,
> please let me know. Any help is extremely appreciated J
>
>
>
>
>
> Thanks,
>
>
>
> Kevin
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

The "mkfs" step isnt needed if you are expanding an existing logical
volume. A revised procedure would be the following:

- Add disk to system
- Partition it via fdisk. Set partition type to 8e (Linux LVM)
- run pvcreate initialize the partition for LVM
- run vgextend to expand your existing volume group with the new device.
- run lvextend to grow your logical volume.
- finally, run resize2fs (assuming you are using ext3/4) to grow the
file system.

Rich
