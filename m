Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7GH92BX032249
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 13:09:02 -0400
Received: from smtp-4.hut.fi (smtp-4.hut.fi [130.233.228.94])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7GH8s2t022213
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 13:08:54 -0400
Received: from localhost (katosiko.hut.fi [130.233.228.115])
	by smtp-4.hut.fi (8.13.6/8.12.10) with ESMTP id l7GH8meu007268
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 20:08:48 +0300
Received: from smtp-4.hut.fi ([130.233.228.94])
	by localhost (katosiko.hut.fi [130.233.228.115]) (amavisd-new,
	port 10024) with LMTP id 13760-38-2 for <linux-lvm@redhat.com>;
	Thu, 16 Aug 2007 20:08:47 +0300 (EEST)
Received: from aski.hut.fi (aski.hut.fi [130.233.79.196])
	by smtp-4.hut.fi (8.13.6/8.12.10) with ESMTP id l7GH8aKx007205
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 20:08:36 +0300
Received: from localhost (localhost [127.0.0.1])
	by aski.hut.fi (Postfix) with ESMTP id 9B9B95F1B2
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 20:08:36 +0300 (EEST)
Date: Thu, 16 Aug 2007 20:08:36 +0300 (EEST)
From: Vesa-Pekka Palmu <palmu@aski.hut.fi>
Subject: Re: [linux-lvm] pvmove problems
In-Reply-To: <1187283837.16162.2.camel@localhost.localdomain>
Message-ID: <Pine.LNX.4.64.0708162007140.3563@aski.hut.fi>
References: <1187283837.16162.2.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-377305521-1723552204-1187284116=:3563"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---377305521-1723552204-1187284116=:3563
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 16 Aug 2007, michael wrote:

> I'm trying to reduce a logical vol so that I can remove a HD from it.
> However, I get errors with pvmove but I don't know why. I saw some old
> postings with a kernel patch but the URL is extinct.
>
> I'm running Fedora: Linux xxx.phy.umist.ac.uk 2.6.22.1-41.fc7 #1 SMP Fri
> Jul 27 18:21:43 EDT 2007 x86_64 x86_64 x86_64 GNU/Linux
>
>
> chris@veri:~$ sudo /usr/sbin/pvdisplay /dev/sdb1
> Password:
>   --- Physical volume ---
>   PV Name               /dev/sdb1
>   VG Name               VolGroup00
>   PV Size               698.64 GB / not usable 10.34 MB
>   Allocatable           yes
>   PE Size (KByte)       32768
>   Total PE              22356
>   Free PE               19156
>   Allocated PE          3200
>   PV UUID               xDWUQB-wdEx-AtEs-YFkh-BKBR-7Jgd-9ik3p0
>
>
> chris@veri:~$ sudo /usr/sbin/pvdisplay /dev/sda2
>   --- Physical volume ---
>   PV Name               /dev/sda2
>   VG Name               VolGroup00
>   PV Size               465.66 GB / not usable 3.56 MB
>   Allocatable           yes
>   PE Size (KByte)       32768
>   Total PE              14901
>   Free PE               14839
>   Allocated PE          62
>   PV UUID               GLGcHf-b3Ga-M61f-okkW-HaAk-Al7P-leVK91
>
>
> chris@veri:~$ sudo /usr/sbin/pvmove /dev/sdb1
>   Failure parsing mirror status fraction: 1 core
>   Failure parsing mirror status fraction: 1 core
>   ABORTING: Mirror percentage check failed.
>
>

2.6.22 has a bug in dm-mirror status reporting, and as lvm relies on that=
=20
to parse the progress of pvmove, it causes pvmove to fail, use 2.6.21 or=20
patch your kernel.

--=20
^^^ T=E4m=E4 on siguerotin, se ei pure.
---377305521-1723552204-1187284116=:3563--
