Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE95110021B1
	for <linux-lvm@redhat.com>; Mon, 18 Feb 2019 02:06:17 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 283577F6C5
	for <linux-lvm@redhat.com>; Mon, 18 Feb 2019 02:06:16 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id d14so1768918ljl.9
	for <linux-lvm@redhat.com>; Sun, 17 Feb 2019 18:06:16 -0800 (PST)
MIME-Version: 1.0
References: <395d4bbb-6463-1534-a0ce-13ec8ec30ba2@free.fr>
In-Reply-To: <395d4bbb-6463-1534-a0ce-13ec8ec30ba2@free.fr>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Sun, 17 Feb 2019 20:06:02 -0600
Message-ID: <CAAMCDedWVwM=1Os2=2QyaWbiARQHfCyBxUYixXFD7_k6xVTWPg@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Unknown PV missing ?
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

pv0 the first pv in the vg, internally lvm keeps track of disks that way.

It is an md device, do you have the md modules and pieces needed for
boot in your dracut.conf and/or dracut.conf.d files?

On Sun, Feb 17, 2019 at 8:58 AM Georges Giralt <georges.giralt@free.fr> wrote:
>
> Hello,
>
> I've this computer running since a very long time on the same LVM
> configuration consisting of 2 PV  and one VG onto which the whole system
> is installed (it is bare metal running now Ubuntu 18.04.2 LTS.).
>
> Every time I do an upgrade-grub, I get the following message :
>
> ======================
>
> Création du fichier de configuration GRUB…
> /usr/sbin/grub-probe : attention : Impossible de trouver le volume
> physique « pv0 ». Certains modules risquent de manquer dans l'image de
> base..
> Image Linux trouvée : /boot/vmlinuz-4.18.0-15-generic
>
> ======================
>
> IF I do a pvscan -v I get this :
>
> ======================
>
> # pvscan  -v
>      Wiping internal VG cache
>      Wiping cache of LVM-capable devices
>    PV /dev/md1         VG vg0             lvm2 [<291,91 GiB / 126,66 GiB
> free]
>    PV /dev/nvme0n1p1   VG vg0             lvm2 [<119,24 GiB / <91,80 GiB
> free]
>    Total: 2 [411,14 GiB] / in use: 2 [411,14 GiB] / in no VG: 0 [0   ]
> #
>
> And this is the extract of vgdisplay -v pertaining to PVs
>
> =======================
>    --- Physical volumes ---
>    PV Name               /dev/md1
>    PV UUID               gcjLSH-3lL5-NjBq-QdYh-vddQ-pwlg-UmEiZs
>    PV Status             allocatable
>    Total PE / Free PE    74728 / 32426
>
>    PV Name               /dev/nvme0n1p1
>    PV UUID               UGWM1s-GSly-Riyp-3hfE-s2nr-ng2E-wNuTVS
>    PV Status             allocatable
>    Total PE / Free PE    30525 / 23500
>
> #
>
> ========================
>
> Nowhere is a "pv0" referenced. So I wonder what is this pv0 and from
> where it comes ?
>
> Could you, please, help me get rid of this message ?
>
> Because it puzzle me since a long time and I can't find how to suppress it.
>
> Many thanks in advance for your help and advice.
>
>
> --
> "If a man empties his purse into his head, no man can take it away from him.
> An investment in knowledge always pays the best interest"
>
>
> Benjamin Franklin.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
