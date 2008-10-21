Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9LLZgH0026882
	for <linux-lvm@redhat.com>; Tue, 21 Oct 2008 17:35:42 -0400
Received: from mtaout5.012.net.il (mtaout5.012.net.il [84.95.2.13])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9LLYS2u020257
	for <linux-lvm@redhat.com>; Tue, 21 Oct 2008 17:34:29 -0400
Received: from ip6-localhost ([77.125.89.121]) by i_mtaout5.012.net.il
	(HyperSendmail v2004.12) with ESMTPA id
	<0K9300LR7YMVFCP2@i_mtaout5.012.net.il> for
	linux-lvm@redhat.com; Tue, 21 Oct 2008 23:35:19 +0200 (IST)
Received: from localhost ([127.0.0.1] helo=dovidhalevi.homelinux.net)	by
	ip6-localhost with esmtp (Exim 4.69)	(envelope-from
	<d_baron@012.net.il>)	id 1KsOrM-0001sF-Og	for
	linux-lvm@redhat.com; Tue, 21 Oct 2008 23:33:48 +0200
Date: Tue, 21 Oct 2008 23:33:45 +0200
From: David Baron <d_baron@012.net.il>
In-reply-to: <20081020171512.6198A619799@hormel.redhat.com>
Message-id: <200810212333.46240.d_baron@012.net.il>
MIME-version: 1.0
Content-disposition: inline
References: <20081020171512.6198A619799@hormel.redhat.com>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Re:HELP! (SOLVED)
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
To: linux-lvm@redhat.com

On Monday 20 October 2008 19:15:12 linux-lvm-request@redhat.com wrote:
> Set up lvm, a breeze. NO lv root so should boot with a normal lilo.
> I was able to boot mounting the lvm volumes to the old failing disk.
> I cannot boot the new disk.
>
> Configuration
> 1 boot-ext3
> 2 root-ext3
> 3 swap
> 5 vfat
> 6 lvm volumes
>
> What type of lilo do I need for this. I ran it with
> boot /dev/hdc1
> root =EF=BF=BD/dev/hdc2
>
> All I get is the bootmagic text "preparing machine to start linux", then
> nothing.
>
> I am typing this in (gulp) window 98 (at least that still works--somewhat=
).
>
> The boot record of the old failing disk is messed so I canot use that
> knoppix 3.* will not allow me to chroot (its kernel too old)
> knoppix 5.01 will, but will not let me run lilo. The device mapper is too
> old for the (Sid) system.
>
> Please reply to my email as well as the list.
> Thank for any help

Figured this out! Udev is a catch-22. The /dev on a chroot'ed root is not a=
=20
real /dev but a copy of whatever might have been there or even less than th=
at.=20
A search led to the answer: Use mount -bind to give that file-system a real=
=20
/dev, then chroot and knoppix 5.01 will do that and lilo worked.

Other stuff did not work because of permissions to the copied /tmp. A quick=
=20
google found /tmp permissions as the common thread in numerous problems. 77=
7.

Up and running!
