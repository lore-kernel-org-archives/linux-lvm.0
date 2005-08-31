Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7VLqHV28420
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 17:52:17 -0400
Received: from smtp.aaisp.net.uk (B.painless.aaisp.net.uk [81.187.81.52])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7VLqEtA017442
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 17:52:14 -0400
Received: from ebourne.me.uk ([81.187.210.78] helo=hordein.ebourne.me.uk)
	by smtp.aaisp.net.uk with esmtp (Exim 4.43) id 1EAaV3-0001NT-S9
	for linux-lvm@redhat.com; Wed, 31 Aug 2005 22:52:06 +0100
Received: from avenin.ebourne.me.uk (avenin.ebourne.me.uk [192.168.66.4])
	by hordein.ebourne.me.uk (Postfix) with ESMTP id 9225012CE80
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 22:52:02 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by avenin.ebourne.me.uk (Postfix) with ESMTP id 41BECC80F9
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 22:52:02 +0100 (BST)
Subject: Re: [linux-lvm] pvmove is stuck
From: Martin Ebourne <lists@ebourne.me.uk>
In-Reply-To: <20050831213759.GI15141@agk.surrey.redhat.com>
References: <1125522968.11068.9.camel@avenin.ebourne.me.uk>
	<20050831213759.GI15141@agk.surrey.redhat.com>
Content-Type: multipart/mixed; boundary="=-omU50+xjutbb5lGlqYn+"
Date: Wed, 31 Aug 2005 22:52:01 +0100
Message-Id: <1125525121.11068.12.camel@avenin.ebourne.me.uk>
Mime-Version: 1.0
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


--=-omU50+xjutbb5lGlqYn+
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2005-08-31 at 22:37 +0100, Alasdair G Kergon wrote:
> On Wed, Aug 31, 2005 at 10:16:08PM +0100, Martin Ebourne wrote:
> > volume onto the new disk. Now pvmove is stuck at 75.1% and refuses to
> > progress any further:
>  
> Diagnostics required:
>   lvs -av
>   dmsetup info -c
>   dmsetup table
>   dmsetup status

Attached.

I should probably have also added before, I'm running a pretty up to
date Fedora Core 3 on x86_64. Kernel 2.6.11-1.35_FC3 (which is a couple
of versions behind now).

Cheers,

Martin.

--=-omU50+xjutbb5lGlqYn+
Content-Disposition: attachment; filename=lvs.txt
Content-Type: text/plain; name=lvs.txt; charset=UTF-8
Content-Transfer-Encoding: 7bit

    Finding all logical volumes
  LV        VG             #Seg Attr   LSize   Maj Min KMaj KMin Origin Snap%  Move      Copy%  LV UUID                               
  audio     vg_hordein        2 -wI-ao 180.00G  -1  -1 253  3                                   i9L0WJ-nNvx-vIl0-oXzU-qmtO-Z82s-wSeGSS
  home      vg_hordein        1 -wi-ao  30.00G  -1  -1 253  9                                   6j9rxg-IBdZ-RchM-ekTJ-TxY6-kEd1-uwPwcg
  pvmove0   vg_hordein        4 p-C-ao 372.56G  -1  -1 253  10                 /dev/hda1  75.14 247BqL-aEnl-ApBy-bLCf-W2Cs-1spS-GFfERx
  recording vg_hordein        1 -wi-ao 120.00G  -1  -1 253  5                                   NAPzsw-gZZf-QHV9-vJbQ-4Kk5-u6dH-2PYCUJ
  root      vg_hordein        1 -wi-ao  10.00G  -1  -1 253  6                                   R1y64w-TTj3-ySJv-4FWM-GlgZ-72Eb-EMbTNd
  srv       vg_hordein        1 -wi-ao  30.00G  -1  -1 253  8                                   WELq71-vloL-xIeo-orgo-JJIV-lR4Z-FQw19T
  swap      vg_hordein        1 -wi-ao   1.00G  -1  -1 253  7                                   dwX5yR-GCFH-WKNr-DHoR-vKEa-I7JN-KTwJE6
  video     vg_hordein        3 -wI-ao 307.75G  -1  -1 253  4                                   tBAfcE-INrd-6Apw-9Sm8-WfyE-F4SM-Tg1LCJ
  backup    vg_hordein_bak    2 -wi-ao 248.81G  -1  -1 253  1                                   PjMSKH-qRyF-WfrB-WOA5-fCCK-39gM-yyEGKm
  root      vg_hordein_bak    1 -wi-a-  10.00G  -1  -1 253  0                                   r6rGXT-WOY5-d7co-KbHE-LmAc-V1ux-xFmarq
  tmp       vg_hordein_bak    1 -wi-a-  20.00G  -1  -1 253  2                                   VwK0Se-miJ8-1cOV-L8uQ-SGni-UgjA-2fyC4j

--=-omU50+xjutbb5lGlqYn+
Content-Disposition: attachment; filename=dmsetup-info.txt
Content-Type: text/plain; name=dmsetup-info.txt; charset=UTF-8
Content-Transfer-Encoding: 7bit

Name             Maj Min Stat Open Targ Event  UUID
vg_hordein-swap  253   7 L--w    1    1      0 0Wu5CaXiyLznux0Iskyav7r8Fux2XG5EdwX5yRGCFHWKNrDHoRvKEaI7JNKTwJE6
vg_hordein-root  253   6 L--w    1    1      0 0Wu5CaXiyLznux0Iskyav7r8Fux2XG5ER1y64wTTj3ySJv4FWMGlgZ72EbEMbTNd
vg_hordein-srv   253   8 L--w    1    1      0 0Wu5CaXiyLznux0Iskyav7r8Fux2XG5EWELq71vloLxIeoorgoJJIVlR4ZFQw19T
vg_hordein_bak-backup 253   1 L--w    1    2      0 J4ZxJEIw770Pl6dFnHTDyxELSg7VQ19OPjMSKHqRyFWfrBWOA5fCCK39gMyyEGKm
vg_hordein-video 253   4 L--w    1    3      0 0Wu5CaXiyLznux0Iskyav7r8Fux2XG5EtBAfcEINrd6Apw9Sm8WfyEF4SMTg1LCJ
vg_hordein-audio 253   3 L--w    1    2      0 0Wu5CaXiyLznux0Iskyav7r8Fux2XG5Ei9L0WJnNvxvIl0oXzUqmtOZ82swSeGSS
vg_hordein_bak-tmp 253   2 L--w    0    1      0 J4ZxJEIw770Pl6dFnHTDyxELSg7VQ19OVwK0SemiJ81cOVL8uQSGniUgjA2fyC4j
vg_hordein-pvmove0 253  10 L--w    2    4      2 0Wu5CaXiyLznux0Iskyav7r8Fux2XG5E247BqLaEnlApBybLCfW2Cs1spSGFfERx
vg_hordein_bak-root 253   0 L--w    0    1      0 J4ZxJEIw770Pl6dFnHTDyxELSg7VQ19Or6rGXTWOY5d7coKbHELmAcV1uxxFmarq
vg_hordein-home  253   9 L--w    1    1      0 0Wu5CaXiyLznux0Iskyav7r8Fux2XG5E6j9rxgIBdZRchMekTJTxY6kEd1uwPwcg
vg_hordein-recording 253   5 L--w    1    1      0 0Wu5CaXiyLznux0Iskyav7r8Fux2XG5ENAPzswgZZfQHV9vJbQ4Kk5u6dH2PYCUJ

--=-omU50+xjutbb5lGlqYn+
Content-Disposition: attachment; filename=dmsetup-table.txt
Content-Type: text/plain; name=dmsetup-table.txt; charset=UTF-8
Content-Transfer-Encoding: 7bit

vg_hordein-swap: 0 2097152 linear 8:2 20971904
vg_hordein-root: 0 20971520 linear 8:2 384
vg_hordein-srv: 0 62914560 linear 8:2 23069056
vg_hordein_bak-backup: 0 419430400 linear 3:66 23069056
vg_hordein_bak-backup: 419430400 102367232 linear 3:66 568328576
vg_hordein-video: 0 209715200 linear 253:10 377487360
vg_hordein-video: 209715200 194117632 linear 253:10 587202560
vg_hordein-video: 403832832 241565696 linear 8:2 148898176
vg_hordein-audio: 0 356515840 linear 253:10 0
vg_hordein-audio: 356515840 20971520 linear 253:10 356515840
vg_hordein_bak-tmp: 0 41943040 linear 3:66 670695808
vg_hordein-pvmove0: 0 356515840 linear 22:64 384
vg_hordein-pvmove0: 356515840 20971520 linear 22:64 356516224
vg_hordein-pvmove0: 377487360 209715200 mirror core 1 1024 2 3:1 356516224 22:64 377487744 
vg_hordein-pvmove0: 587202560 194117632 linear 3:1 587202944
vg_hordein_bak-root: 0 20971520 linear 3:66 384
vg_hordein-home: 0 62914560 linear 8:2 85983616
vg_hordein-recording: 0 251658240 linear 8:16 384

--=-omU50+xjutbb5lGlqYn+
Content-Disposition: attachment; filename=dmsetup-status.txt
Content-Type: text/plain; name=dmsetup-status.txt; charset=UTF-8
Content-Transfer-Encoding: 7bit

vg_hordein-swap: 0 2097152 linear 
vg_hordein-root: 0 20971520 linear 
vg_hordein-srv: 0 62914560 linear 
vg_hordein_bak-backup: 0 419430400 linear 
vg_hordein_bak-backup: 419430400 102367232 linear 
vg_hordein-video: 0 209715200 linear 
vg_hordein-video: 209715200 194117632 linear 
vg_hordein-video: 403832832 241565696 linear 
vg_hordein-audio: 0 356515840 linear 
vg_hordein-audio: 356515840 20971520 linear 
vg_hordein_bak-tmp: 0 41943040 linear 
vg_hordein-pvmove0: 0 356515840 linear 
vg_hordein-pvmove0: 356515840 20971520 linear 
vg_hordein-pvmove0: 377487360 209715200 mirror 2 3:1 22:64 204799/204800
vg_hordein-pvmove0: 587202560 194117632 linear 
vg_hordein_bak-root: 0 20971520 linear 
vg_hordein-home: 0 62914560 linear 
vg_hordein-recording: 0 251658240 linear 

--=-omU50+xjutbb5lGlqYn+--
