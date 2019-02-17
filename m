Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E6B860BF7
	for <linux-lvm@redhat.com>; Sun, 17 Feb 2019 14:57:28 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7ECD111DB98
	for <linux-lvm@redhat.com>; Sun, 17 Feb 2019 14:57:26 +0000 (UTC)
Received: from [192.168.0.5] (unknown [82.66.78.161])
	(Authenticated sender: georges.giralt)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 351DD780340
	for <linux-lvm@redhat.com>; Sun, 17 Feb 2019 14:57:22 +0000 (UTC)
From: Georges Giralt <georges.giralt@free.fr>
Message-ID: <395d4bbb-6463-1534-a0ce-13ec8ec30ba2@free.fr>
Date: Sun, 17 Feb 2019 15:57:22 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: [linux-lvm] Unknown PV missing ?
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

I've this computer running since a very long time on the same LVM 
configuration consisting of 2 PV  and one VG onto which the whole system 
is installed (it is bare metal running now Ubuntu 18.04.2 LTS.).

Every time I do an upgrade-grub, I get the following message :

======================

Création du fichier de configuration GRUB…
/usr/sbin/grub-probe : attention : Impossible de trouver le volume 
physique « pv0 ». Certains modules risquent de manquer dans l'image de 
base..
Image Linux trouvée : /boot/vmlinuz-4.18.0-15-generic

======================

IF I do a pvscan -v I get this :

======================

# pvscan  -v
     Wiping internal VG cache
     Wiping cache of LVM-capable devices
   PV /dev/md1         VG vg0             lvm2 [<291,91 GiB / 126,66 GiB 
free]
   PV /dev/nvme0n1p1   VG vg0             lvm2 [<119,24 GiB / <91,80 GiB 
free]
   Total: 2 [411,14 GiB] / in use: 2 [411,14 GiB] / in no VG: 0 [0   ]
#

And this is the extract of vgdisplay -v pertaining to PVs

=======================
   --- Physical volumes ---
   PV Name               /dev/md1
   PV UUID               gcjLSH-3lL5-NjBq-QdYh-vddQ-pwlg-UmEiZs
   PV Status             allocatable
   Total PE / Free PE    74728 / 32426

   PV Name               /dev/nvme0n1p1
   PV UUID               UGWM1s-GSly-Riyp-3hfE-s2nr-ng2E-wNuTVS
   PV Status             allocatable
   Total PE / Free PE    30525 / 23500

#

========================

Nowhere is a "pv0" referenced. So I wonder what is this pv0 and from 
where it comes ?

Could you, please, help me get rid of this message ?

Because it puzzle me since a long time and I can't find how to suppress it.

Many thanks in advance for your help and advice.


-- 
"If a man empties his purse into his head, no man can take it away from him.
An investment in knowledge always pays the best interest"


Benjamin Franklin.
