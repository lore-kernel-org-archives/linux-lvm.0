Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nAUKTSDr011923
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2009 15:29:29 -0500
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.211.179])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nAUKTJrt011538
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2009 15:29:19 -0500
Received: by ywh9 with SMTP id 9so3426005ywh.19
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2009 12:29:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <e33bd8cc0911300844j383b1ab4i6315f53533dd1e20@mail.gmail.com>
References: <3a0a09d20911290306o4e1eb1c0y753a7beb999b66b1@mail.gmail.com>
	<e33bd8cc0911300844j383b1ab4i6315f53533dd1e20@mail.gmail.com>
Date: Mon, 30 Nov 2009 20:29:18 +0000
Message-ID: <3a0a09d20911301229t5be1705dha82671a3b60b4816@mail.gmail.com>
Subject: Re: [linux-lvm] Adjusting stripe size.
From: Robert Mortimer <robert.mortimer@gmail.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

2009/11/30 Giovanni Tirloni <tirloni@gmail.com>:
> On Sun, Nov 29, 2009 at 9:06 AM, Robert Mortimer
> <robert.mortimer@gmail.com> wrote:
>> I have a volume group =EF=BF=BDthat I migrated from 1 physical drive to =
two
>> RAID 0 drives. Looking at the disk access it appears that I have no
>> stripe. All data access seems to be on the first drive. How do I
>> re-configure the volume group to stripe accross the two physical
>> drives?
>
> I think you've to recreate the Logical Volume(s) using the stripes option=
 (-i)
>
> http://linux.die.net/man/8/lvcreate
>
Not really the answer I wanted. I assumed that the default was for LVM
to stripe and by adding bot disks to the volume group before migrating
it of the physical extent I would be OK. I migrations can loose stripe
then surely that is an issue?

The Volume was created as part of a xen server virtual machine install
so I have limited control over initial LV creation parameters.

Rob
> --
> Giovanni.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
