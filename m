Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA8Jb7LP004720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 8 Nov 2015 14:37:07 -0500
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mx1.redhat.com (Postfix) with ESMTPS id B04DD461C0
	for <linux-lvm@redhat.com>; Sun,  8 Nov 2015 19:37:06 +0000 (UTC)
Received: by wiva10 with SMTP id a10so22299912wiv.0
	for <linux-lvm@redhat.com>; Sun, 08 Nov 2015 11:37:05 -0800 (PST)
Received: from [192.168.192.221] (ip-94-113-160-102.net.upcbroadband.cz.
	[94.113.160.102]) by smtp.gmail.com with ESMTPSA id
	an7sm11350681wjc.44.2015.11.08.11.37.04 for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Nov 2015 11:37:04 -0800 (PST)
References: <563F8940.3020706@highpoweredhelp.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <563FA45F.4030105@gmail.com>
Date: Sun, 8 Nov 2015 20:37:03 +0100
MIME-Version: 1.0
In-Reply-To: <563F8940.3020706@highpoweredhelp.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] dd on a lv?
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

Dne 8.11.2015 v 18:41 Michael Munger napsal(a):
> In preparing a lv for LUKS, I wanted to write random data to the
> entirety of the logical volume.
>
> (It's one of two lv's in the vg that are running LUKS, the other lv are
> not encrypted, and all reside on the same pv, which is a linux-raid
> (mdadm) device at /dev/md0).
>
> I used dd if=/dev/urandom of=/dev/mygroup/mylogicalvolume to write
> random data to the entirety of the lv device.
>
> Here's the issue:
>
> The lv is only 4TB (yes... this took days). I had estimated it would
> stop some time early this morning. This afternoon when I checked it, dd
> had claimed to have written 4.2 TB of data to a 4TB device.
>
> I immediately thought: "How's that possible" and began to worry that it
> escaped the logical volume and began to write other areas of the array.
> But, dd if=/dev/mygroup/othervol1 bs=1K count=1 | hexdump -C showed a
> LUKS header (as it should) and the same command on the other lv showed
> the proper header as well. I took this to mean that those lv's were in tact.
>
> How is it possible that I can write 4.2TB to a 4.0 TB logical volume?
> Should I be worried that I have somehow overritten something somewhere
> else? If so, how do I find and check that? (I have backups, so if I need
> to restore, I need to do it now).
>
> P.S. When I did this on the other lv, which is only 100GB, dd behaved as
> expected, and wrote only 100GB of random data to the logical volume.


Please check you compare sizes in same 'units'

dd  reports sizes in  1000 units
while lvm2  normally in 1024


And basically if you want to hear any 'analysis' - you need to show us

'dmsetup table'


Zdenek
