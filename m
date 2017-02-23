Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42ECEB6FFF
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2017 19:26:03 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B746D65401
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2017 19:26:01 +0000 (UTC)
Received: from [192.168.0.38] (unknown [82.66.78.161])
	(Authenticated sender: georges.giralt)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id A15DB7801C8
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2017 20:25:57 +0100 (CET)
From: Georges Giralt <georges.giralt@free.fr>
Message-ID: <b55d9679-db08-7e72-ff0f-ec471fc8f514@free.fr>
Date: Thu, 23 Feb 2017 20:25:26 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Sorry to ask here ...
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello !

I'm sorry to ask for help here, but I'm lost in the middle of nowhere ...

The context :

A PC hardware with an UEFI "BIOS" set to legacy boot only.

3 disks with 2 partitions each. The 3 first partitions are set in 
software mirror (md0) and used for /boot (Ext4) .The second 3 partitions 
are used as a software mirror and the resulting md1 is the sole PV of a 
vg0 group onto which 8 logical volumes are set. This is used to run 
Ubuntu 16.04.2 software (after many upgrades...).   *

This setup has worked for years and seen changes in disk sizes, main 
board, etc...

Lastly, I bet the cause is an upgrade of some packages, the machine 
refuses to boot. It drops onto initramfs shell because the vg0 volume 
group is not activated. Launching lvm and doing a vgchange -a y does the 
trick and the system boots fine afterwards.

I've searched everything I can (but maybe the setup was so rock solid I 
became lazy or unconscious) and tried to make again the initramfs with 
no luck.

So every leads or advice would be greatly appreciated. Please, refrain 
to hit me hard on the face. I'm already mourning....

Many thanks in advance for your help !


* : The 3 disks are here because at one time, long ago, I used mirroring 
in the LVM software. ... I switched to software raid and kept the 3 
disks as I had them into the box.


-- 
"If a man empties his purse into his head, no man can take it away from him.
An investment in knowledge always pays the best interest"


Benjamin Franklin.
