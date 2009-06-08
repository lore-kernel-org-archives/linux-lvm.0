Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n58LneMY020872
	for <linux-lvm@redhat.com>; Mon, 8 Jun 2009 17:49:40 -0400
Received: from mail-gx0-f221.google.com (mail-gx0-f221.google.com
	[209.85.217.221])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n58LnMCC027470
	for <linux-lvm@redhat.com>; Mon, 8 Jun 2009 17:49:23 -0400
Received: by gxk21 with SMTP id 21so3444280gxk.7
	for <linux-lvm@redhat.com>; Mon, 08 Jun 2009 14:49:21 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 8 Jun 2009 18:48:19 -0300
Message-ID: <d4016b450906081448i165c25aelb98a196bb53b5d38@mail.gmail.com>
From: Carlos Eduardo Tavares Terra <eduardo.terra@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove or lv mirror/unmirror
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

Dears,

I need to migrate 400GB data from some disks to new disks. The old
disk frame is getting obsolete and will be powered off.

To do this I thought in 3 possibilites:
1. Create a new VG, with new LVs, and CP everything to it. (It'll take
too many time)
2. Include the new disks into the current VG and use pvmove to free
the old disks.
3. Include the new disks into the current VG, convert the LVs to make
use of mirroring, then brake the mirror keeping the new disks as the
running ones.

My doubt is... is it secure to use pvmove in disks with lots of data?
I thought in using mirroring to keep my data safe, until breaking the
mirror. All the syncing would be safer.
This solution will work? What is the best option? May I move, or
mirror, my data in a production environment?

My environment:
HP Blades, connected to SAN disks using FC.
Red Hat 5.2 running Oracle 9.2

Thanks

-- 
Carlos Eduardo Tavares Terra
GNU/Linux #413291 [http://counter.li.org]
