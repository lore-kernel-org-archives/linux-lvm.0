Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FF0C620AD
	for <linux-lvm@redhat.com>; Sat, 18 Nov 2017 16:26:21 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30FDCC0587D2
	for <linux-lvm@redhat.com>; Sat, 18 Nov 2017 16:26:20 +0000 (UTC)
Received: from [192.168.0.4] (unknown [82.66.78.161])
	(Authenticated sender: georges.giralt)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6191078039F
	for <linux-lvm@redhat.com>; Sat, 18 Nov 2017 16:26:17 +0000 (UTC)
From: Georges Giralt <georges.giralt@free.fr>
Message-ID: <a420da15-bd09-cb6c-618f-5308e71d5b01@free.fr>
Date: Sat, 18 Nov 2017 17:26:16 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: [linux-lvm] Strange behavior
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

Hello !

Ubuntu 16.04.3 LTS with all updates applied.

Mdadm gets updated.

Then grub is updated to reflect the changes.

Got this message :

root@menfin:/etc/lvm# update-grub
Création du fichier de configuration GRUB…
/usr/sbin/grub-probe : attention : Impossible de trouver le volume 
physique « pv0 ». Certains modules risquent de manquer dans l'image de 
base..
Image Linux trouvée : /boot/vmlinuz-4.4.0-98-generic
Image mémoire initiale trouvée : /boot/initrd.img-4.4.0-98-generic
Image Linux trouvée : /boot/vmlinuz-4.4.0-97-generic
Image mémoire initiale trouvée : /boot/initrd.img-4.4.0-97-generic
Image Linux trouvée : /boot/vmlinuz-3.19.0-66-generic
Image mémoire initiale trouvée : /boot/initrd.img-3.19.0-66-generic
Found memtest86+ image: /memtest86+.elf
Found memtest86+ image: /memtest86+.bin
fait

The pv0 device is (according to the lvm conf) :

        physical_volumes {

                 pv0 {
                         id = "gcjLSH-3lL5-NjBq-QdYh-vddQ-pwlg-UmEiZs"
                         device = "/dev/md1"     # Hint only

                         status = ["ALLOCATABLE"]
                         flags = []
                         dev_size = 612173696    # 291,907 Gigabytes
                         pe_start = 384
                         pe_count = 74728        # 291,906 Gigabytes
                 }

and as per blkid :

/dev/md0: UUID="a27ec3c6-3f64-4133-a600-500ffd37ef6a" TYPE="ext4"
/dev/md1: UUID="gcjLSH-3lL5-NjBq-QdYh-vddQ-pwlg-UmEiZs" TYPE="LVM2_member"

I checked mdstat :

root@menfin:/etc/lvm# cat /proc/mdstat
Personalities : [raid1] [linear] [multipath] [raid0] [raid6] [raid5] 
[raid4] [raid10]
md1 : active raid1 sdb2[2] sdc2[0] sda2[1]
       306087040 blocks [3/3] [UUU]

md0 : active raid1 sdb1[2] sdc1[1] sda1[0]
       6291000 blocks [3/3] [UUU]

unused devices: <none>

So everything is correct.

What do you think of that ?

Thanks for your help and advice  !




-- 
"If a man empties his purse into his head, no man can take it away from him.
An investment in knowledge always pays the best interest"


Benjamin Franklin.
