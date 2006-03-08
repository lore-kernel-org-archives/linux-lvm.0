Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k28LFd123008
	for <linux-lvm@redhat.com>; Wed, 8 Mar 2006 16:15:39 -0500
Received: from monster.flashfabrik.hu (postfix@flashfabrik.hu [195.70.36.192])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k28LFVLV029272
	for <linux-lvm@redhat.com>; Wed, 8 Mar 2006 16:15:32 -0500
Received: from localhost (localhost [127.0.0.1])
	by monster.flashfabrik.hu (Postfix) with ESMTP id 27CB9276FF4
	for <linux-lvm@redhat.com>; Wed,  8 Mar 2006 22:15:30 +0100 (CET)
Received: from monster.flashfabrik.hu ([127.0.0.1])
	by localhost (monster.flashfabrik.hu [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 22901-01 for <linux-lvm@redhat.com>;
	Wed, 8 Mar 2006 22:15:28 +0100 (CET)
Received: from mir.fatav.hu (host-87-242-14-86.prtelecom.hu [87.242.14.86])
	by monster.flashfabrik.hu (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Wed,  8 Mar 2006 22:15:28 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mir.fatav.hu (Postfix) with ESMTP id 1692A37194
	for <linux-lvm@redhat.com>; Wed,  8 Mar 2006 22:15:28 +0100 (CET)
Received: from mir.fatav.hu ([127.0.0.1])
	by localhost (mir.fatav.hu [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 20653-05 for <linux-lvm@redhat.com>;
	Wed,  8 Mar 2006 22:15:14 +0100 (CET)
Received: from loon.fatav.hu (loon.fatav.hu [192.168.31.14])
	by mir.fatav.hu (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Wed,  8 Mar 2006 22:15:14 +0100 (CET)
Subject: Re: [linux-lvm] Problem creating snapshot with 2.6.15, lvm2
From: Szabo Akos <fonya@fatav.hu>
In-Reply-To: <Pine.LNX.4.63.0603081020340.848@tungsten.msp.technicality.org>
References: <Pine.LNX.4.63.0603081020340.848@tungsten.msp.technicality.org>
Date: Wed, 08 Mar 2006 22:15:14 +0100
Message-Id: <1141852514.11075.12.camel@loon.fatav.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2006-03-08 at 10:22 -0600, Nate Carlson wrote:

> I'm running lvm2 on a Debian box; LVM utilities version 2.01.04-5 and 
> kernel version 2.6.15. I'm trying to create a snapshot, and get the 
> following error:
> 
> fs:~# lvcreate -L1G -s -n Documents-backup /dev/HomeVG/Documents
>    LV HomeVG/Documents-backup in use: not removing
>    Couldn't deactivate new snapshot.
>
> Any idea what I can do to debug the above error? Documents-backup does not 
> have a valid filesystem structure on it, but I can kill it with a 
> lvremove.

I've this error too, and I update to lvm2-2.02.01-1.2.1 /Fedora version,
it's meaning 2.02.01/ and usually it's working now for me. I don't dare
to use it with a productive environment.

-- 
Ciao:
        Fonya

     Ami�ta NT-t install�ltam a porsz�v�mra, semmi sziv�s nincs vele.
                PGP key ID F86614E5, GPG key ID 83AD9365
