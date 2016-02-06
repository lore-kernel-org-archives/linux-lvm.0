Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u16EB1Dm024085
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 6 Feb 2016 09:11:01 -0500
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mx1.redhat.com (Postfix) with ESMTPS id A56F18E375
	for <linux-lvm@redhat.com>; Sat,  6 Feb 2016 14:11:00 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id y9so84739015qgd.3
	for <linux-lvm@redhat.com>; Sat, 06 Feb 2016 06:11:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAGU4k=2NLJqM2P+_fNiOc82Ynfppk5qNShZsSVy4S=hJMxw7_A@mail.gmail.com>
References: <CAGU4k=2NLJqM2P+_fNiOc82Ynfppk5qNShZsSVy4S=hJMxw7_A@mail.gmail.com>
Date: Sat, 6 Feb 2016 22:10:59 +0800
Message-ID: <CAAYit8Q5a0Xwgm=6jNCAuc7q47ikpJozKFDZ=tBmPtK=wX8qhg@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Subject: Re: [linux-lvm] Repair thin pool
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

Let we review your question again. You had run "lvconvert --repair",
so now the volume pool_nas_tmeta0 is the original metadata (if you
didn't swap the metadata again). You can run thin_check and thin_dump
on pool_nas_tmeta0 to know why thin_repair doesn't work.

thin_check /dev/mapper/vgg145155121036c-pool_nas_tmeta0 > thin_check.log 2>&1
thin_dump /dev/mapper/vgg145155121036c-pool_nas_tmeta0 -o thin_dump.xml -r


Ming-Hung Tsai

2016-02-05 9:21 GMT+08:00 Mars <kirapangzi@gmail.com>:
> Hi there,
>
> We're using Centos 7.0 with lvm 2.02.105 and met a problem as underlying:
> After a electricity powerdown in the datacenter room, thin provision volumes
> came up with wrong states:
>
> [root@storage ~]# lvs -a
>   dm_report_object: report function failed for field data_percent
>   LV                              VG               Attr       LSize   Pool
> Origin           Data%  Move Log Cpy%Sync Convert
>   DailyBuild                      vgg145155121036c Vwi-d-tz--   5.00t
> pool_nas
>   dat                             vgg145155121036c Vwi-d-tz--  10.00t
> pool_nas
>   lvol0                           vgg145155121036c -wi-a-----  15.36g
>   [lvol3_pmspare]                 vgg145155121036c ewi-------  15.27g
>   market                          vgg145155121036c Vwi-d-tz--   3.00t
> pool_nas
>   pool_nas                        vgg145155121036c twi-a-tz--  14.90t
> 0.00
>   [pool_nas_tdata]                vgg145155121036c Twi-ao----  14.90t
>   [pool_nas_tmeta]                vgg145155121036c ewi-ao----  15.27g
>   share                           vgg145155121036c Vwi-d-tz--  10.00t
> pool_nas
>
>
>  the thin pool "pool_nas" and general lv "lvol0" are active, but thin
> provision volumes cannot be actived even with cmd "lvchange -ay
> thin_volume_name".
>
> To recover it, we tried following ways refer to these mail conversations:
> http://www.spinics.net/lists/lvm/msg22629.html and
> http://comments.gmane.org/gmane.linux.lvm.general/14828.
>
> 1, USE: "lvconvert --repair vgg145155121036c/pool_nas"
> output as below and thin volumes still cannot be active.
> WARNING: If everything works, remove "vgg145155121036c/pool_nas_tmeta0".
> WARNING: Use pvmove command to move "vgg145155121036c/pool_nas_tmeta" on the
> best fitting PV.
>
> 2, USE manual repair steps:
> 2a: inactive thin pool.
> 2b: create a temp lv "metabak".
> 2c: swap the thin pool's metadata lv: "lvconvert --thinpool
> vgg145155121036c/pool_nas --poolmetadata metabak -y", only with "-y" option
> can submit the command.
> 2d: active temp lv "metabak" and create another bigger lv "metabak1".
> 2e: repair metadata: "thin_restore -i /dev/vgg145155121036c/metabak-o
> /dev/vgg145155121036c/metabak1", and got segment fault.
>
> So, is there any other way to recover this or some steps we do wrong?
>
> Thank you very much.
> Mars
