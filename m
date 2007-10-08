Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l98HP9Px031437
	for <linux-lvm@redhat.com>; Mon, 8 Oct 2007 13:25:09 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.251])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l98HOvH7018668
	for <linux-lvm@redhat.com>; Mon, 8 Oct 2007 13:24:57 -0400
Received: by an-out-0708.google.com with SMTP id c31so150079ana
	for <linux-lvm@redhat.com>; Mon, 08 Oct 2007 10:24:57 -0700 (PDT)
Subject: Re: [linux-lvm] Problem resizing partition
From: marraco <guillermo.marraco@gmail.com>
In-Reply-To: <95fec8860710080730u71876ca6y5827c86f8c4294ae@mail.gmail.com>
References: <95fec8860710080629h773abe69i9f5f367f80e2488f@mail.gmail.com>
	<BAY119-W8033C29888F079BA14B57A5A40@phx.gbl>
	<95fec8860710080711i6436ab36o7e4d32a099a95d25@mail.gmail.com>
	<95fec8860710080730u71876ca6y5827c86f8c4294ae@mail.gmail.com>
Date: Mon, 08 Oct 2007 14:24:43 -0300
Message-Id: <1191864283.3261.22.camel@guille.DPTO-ISRH>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: guillermo.marraco@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Solved. LVM uses pvresize command to change physical partition size...

It is in the manual.=20

For a graphical interface, is necessary to install system-config-lvm
In CentOS 5 is in the package:

system-config-lvm-1.0.22-1.0.el5



On Mon, 2007-10-08 at 16:30 +0200, Guillermo Marraco wrote:
> bad... Gparted does not recognize filesysytem, and can't resize tha
> partition...
>=20
> (I have utilized Puppy Linux Live CD. It have a gparted preinstalled)
>=20
> On 10/8/07, Guillermo Marraco <guillermo.marraco@gmail.com> wrote:
>         Thanks for your answer!.
>        =20
>         I was unaware that That partition was needed unmounted.
>        =20
>         =C2=BFI can unmount the main Linux Partition, start gparted, and
>         then remount it?, or I need a Live CD?
>        =20
>         I have the Puppy Linux Live CD, and I have burn the Gparted
>         Live CD. I gonna try to use them.=20
>        =20
>        =20
>         On 10/8/07, NTOUGHE GUY-SERGE <ntoughe@hotmail.com> wrote:
>                =20
>                 hi,=20
>                 According to your  description you want to decrease a
>                 partition, so you 'll need to umount your file system
>                 an d change the size, with fdisk or gparted.
>                 After that remount your partition.
>                =20
>                =20
>                 ntoughe@hotmail.com
...
>=20
