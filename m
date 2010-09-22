Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8M6LiBn010669
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2010 02:21:44 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8M6LWKp009140
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2010 02:21:33 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 2337D86FE5
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2010 08:21:31 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id YuBJNy-dIIJ9 for <linux-lvm@redhat.com>;
	Wed, 22 Sep 2010 08:21:26 +0200 (CEST)
Date: Wed, 22 Sep 2010 08:21:26 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100922062125.GA4707@maude.comedia.it>
References: <4C8677BF.40500@thenewhams.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4C8677BF.40500@thenewhams.com>
Subject: Re: [linux-lvm] Unable to mount LVM partition - table too small
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
To: linux-lvm@redhat.com

On Tue, Sep 07, 2010 at 10:34:55AM -0700, Adam Newham wrote:
> vgdisplay
> --- Volume group ---
> VG Name lvm-raid5
> System ID
> Format lvm2
> Metadata Areas 1
> Metadata Sequence No 2
> VG Access read/write
> VG Status resizable
> MAX LV 0
> Cur LV 1
> Open LV 0
> Max PV 0
> Cur PV 1
> Act PV 1
> VG Size 2.73 TiB
> PE Size 32.00 MiB
> Total PE 89425
> Alloc PE / Size 89425 / 2.73 TiB
> Free PE / Size 0 / 0
> VG UUID wovrCm-knof-Ycdl-LdXt-4t28-mPWq-kngufG

does vgchange -a y fail?
is there any error message

> /proc/partitions (note the missing sub partitions �V this I why I belive 
> the lv/pv scan��s don��t see any LVM info)
> major minor #blocks name
>
> 3 0 156290904 hda
> 3 1 200781 hda1
> 3 2 4192965 hda2
> 3 3 151894575 hda3
> 8 0 976762584 sda
> 8 16 976762584 sdb
> 8 32 976762584 sdc
> 8 48 976762584 sdd
> 9 0 2930287488 md0

the partition info for md component devices is corectly removed from the
kernel, to avoid confusion
the md device itself should be partitionable, can i see your
/etc/mdadm.conf ?

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
