Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3E9phct004886
	for <linux-lvm@redhat.com>; Mon, 14 Apr 2014 05:51:43 -0400
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3E9pdmL001888
	for <linux-lvm@redhat.com>; Mon, 14 Apr 2014 05:51:40 -0400
Received: from zimbra39-e7.priv.proxad.net (unknown [172.20.243.189])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 73F274C8176
	for <linux-lvm@redhat.com>; Mon, 14 Apr 2014 11:51:35 +0200 (CEST)
Date: Mon, 14 Apr 2014 11:51:34 +0200 (CEST)
From: georges.giralt@free.fr
Message-ID: <1226124282.727919626.1397469094153.JavaMail.root@zimbra39-e7.priv.proxad.net>
In-Reply-To: <534BAD14.6060908@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] =?utf-8?q?Re=C2=A0=3A_Re=3A__GRUB_boot_problem_with_l?=
 =?utf-8?q?vm_mirror_type_raid1?=
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>


----- Mail d'origine -----
De: Peter Rajnoha <prajnoha@redhat.com>
À: gk180984@interia.pl
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Envoyé: Mon, 14 Apr 2014 11:40:36 +0200 (CEST)
Objet: Re: [linux-lvm] GRUB boot problem with lvm mirror type raid1

On 04/14/2014 10:42 AM, gk180984@interia.pl wrote:
> Hi
> I want to ask it is possible boot root file system (via GRUB) from LVM RAID1 volume?
> I can boot root file system (with /boot) from linera LVM volume and from mirror volume, but when I create raid1 mirror GRUB can't boot from it:
> 
> lvconvert --type raid1 -m1 gsys/vsys
> 
> LVM mirror is work:
> lvconvert -m1 gsys/vsys
> 
> I have two disk and use only LVM, not other raid software. GRUB have lvm module.

Grub doesn't support LVM RAID1 (it supports only RAID 4/5/6 type IIRC).

However, I don't recommend using /boot on LVM at the moment since
grub support for LVM is limited and unofficial. There's a plan to add
official and more robust support though - there are ongoing discussions
between grub and LVM team...

-- 
Peter
Hello !
May I chime in on this ? 
If the raid1 is made OUTSIDE lvm (ie soft raid1 giving /dev/md0 as a PV for LVM) will the Grub be apt to find it and boot ? 
Or is it the same case as above ? 
Thanks.
