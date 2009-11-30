Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nAUGiqDx021128
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2009 11:44:53 -0500
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.211.179])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nAUGhtBj000617
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2009 11:44:40 -0500
Received: by mail-yw0-f179.google.com with SMTP id 9so3201768ywh.19
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2009 08:44:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <3a0a09d20911290306o4e1eb1c0y753a7beb999b66b1@mail.gmail.com>
References: <3a0a09d20911290306o4e1eb1c0y753a7beb999b66b1@mail.gmail.com>
Date: Mon, 30 Nov 2009 14:44:37 -0200
Message-ID: <e33bd8cc0911300844j383b1ab4i6315f53533dd1e20@mail.gmail.com>
Subject: Re: [linux-lvm] Adjusting stripe size.
From: Giovanni Tirloni <tirloni@gmail.com>
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

On Sun, Nov 29, 2009 at 9:06 AM, Robert Mortimer
<robert.mortimer@gmail.com> wrote:
> I have a volume group =EF=BF=BDthat I migrated from 1 physical drive to t=
wo
> RAID 0 drives. Looking at the disk access it appears that I have no
> stripe. All data access seems to be on the first drive. How do I
> re-configure the volume group to stripe accross the two physical
> drives?

I think you've to recreate the Logical Volume(s) using the stripes option (=
-i)

http://linux.die.net/man/8/lvcreate

--=20
Giovanni.
