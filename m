Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u15BinFv025020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 5 Feb 2016 06:44:49 -0500
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46]) by mx1.redhat.com (Postfix) with ESMTPS id 83A84A852
	for <linux-lvm@redhat.com>; Fri,  5 Feb 2016 11:44:47 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id o11so64875898qge.2
	for <linux-lvm@redhat.com>; Fri, 05 Feb 2016 03:44:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAGU4k=2NLJqM2P+_fNiOc82Ynfppk5qNShZsSVy4S=hJMxw7_A@mail.gmail.com>
References: <CAGU4k=2NLJqM2P+_fNiOc82Ynfppk5qNShZsSVy4S=hJMxw7_A@mail.gmail.com>
Date: Fri, 5 Feb 2016 19:44:46 +0800
Message-ID: <CAAYit8T1Wh+zQT_fsEk88D=1hv2A=kLVGWQAcdccjzx5xPuh5g@mail.gmail.com>
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

Seems that your steps are wrong.  You should run thin_repair before
swapping the pool metadata.
Also, thin_restore is for XML(text) input, not for binary metadata
input, so it's normal to get segmentation fault...

"lvconvert --repair ... " is a command wrapping "thin_repair +
swapping metadata"  into a single step.
If it doesn't work, then you might need to dump the metadata manually,
to check if there's serious corruption in mapping trees or not....
(I recommend to use the newest thin-provisioning-tools to get better result)

1. active the pool metadata (It's okay if the command failed. We just
want to activate the hidden metadata LV)
lvchange -ay vgg1/pool_nas

2. dump the metadata, then checkout the output XML
thin_dump /dev/mapper/vgg1-pool_nas_tmeta -o thin_dump.xml -r

I have experience in repairing many seriously corrupted thin pools. If
the physical medium is okay, I think that most cases are repairable.
I also wrote some extension to thin-provisioning-tools (not yet
published. the code still need some refinement...), maybe it could
help.


Ming-Hung Tsai


2016-02-05 9:21 GMT+08:00 Mars <kirapangzi@gmail.com>:
>
> Hi there,
>
> We're using Centos 7.0 with lvm 2.02.105 and met a problem as underlying:
> After a electricity powerdown in the datacenter room, thin provision volumes came up with wrong states:
>
> [root@storage ~]# lvs -a
>   dm_report_object: report function failed for field data_percent
>   LV                              VG               Attr       LSize   Pool        Origin           Data%  Move Log Cpy%Sync Convert
>   DailyBuild                      vgg145155121036c Vwi-d-tz--   5.00t pool_nas
>   dat                             vgg145155121036c Vwi-d-tz--  10.00t pool_nas
>   lvol0                           vgg145155121036c -wi-a-----  15.36g
>   [lvol3_pmspare]                 vgg145155121036c ewi-------  15.27g
>   market                          vgg145155121036c Vwi-d-tz--   3.00t pool_nas
>   pool_nas                        vgg145155121036c twi-a-tz--  14.90t                                0.00
>   [pool_nas_tdata]                vgg145155121036c Twi-ao----  14.90t
>   [pool_nas_tmeta]                vgg145155121036c ewi-ao----  15.27g
>   share                           vgg145155121036c Vwi-d-tz--  10.00t pool_nas
>
>
>  the thin pool "pool_nas" and general lv "lvol0" are active, but thin provision volumes cannot be actived even with cmd "lvchange -ay thin_volume_name".
>
> To recover it, we tried following ways refer to these mail conversations: http://www.spinics.net/lists/lvm/msg22629.html and http://comments.gmane.org/gmane.linux.lvm.general/14828.
>
> 1, USE: "lvconvert --repair vgg145155121036c/pool_nas"
> output as below and thin volumes still cannot be active.
> WARNING: If everything works, remove "vgg145155121036c/pool_nas_tmeta0".
> WARNING: Use pvmove command to move "vgg145155121036c/pool_nas_tmeta" on the best fitting PV.
>
> 2, USE manual repair steps:
> 2a: inactive thin pool.
> 2b: create a temp lv "metabak".
> 2c: swap the thin pool's metadata lv: "lvconvert --thinpool vgg145155121036c/pool_nas --poolmetadata metabak -y", only with "-y" option can submit the command.
> 2d: active temp lv "metabak" and create another bigger lv "metabak1".
> 2e: repair metadata: "thin_restore -i /dev/vgg145155121036c/metabak-o /dev/vgg145155121036c/metabak1", and got segment fault.
>
> So, is there any other way to recover this or some steps we do wrong?
>
> Thank you very much.
> Mars
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
