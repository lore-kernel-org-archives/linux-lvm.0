Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAA6ww8q001757
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 10 Nov 2015 01:58:58 -0500
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mx1.redhat.com (Postfix) with ESMTPS id 346CB96C2
	for <linux-lvm@redhat.com>; Tue, 10 Nov 2015 06:58:57 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so142442976wmn.1
	for <linux-lvm@redhat.com>; Mon, 09 Nov 2015 22:58:56 -0800 (PST)
Received: from [192.168.192.99] (ip-94-113-160-102.net.upcbroadband.cz.
	[94.113.160.102]) by smtp.gmail.com with ESMTPSA id
	jh4sm1777744wjb.33.2015.11.09.22.58.54 for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Nov 2015 22:58:54 -0800 (PST)
References: <CAOJ8eeBoEGFSpzP2AB8TF28OYDzNAnx3kkSN7NvFwkEJiiu=_w@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <564195AD.2030408@gmail.com>
Date: Tue, 10 Nov 2015 07:58:53 +0100
MIME-Version: 1.0
In-Reply-To: <CAOJ8eeBoEGFSpzP2AB8TF28OYDzNAnx3kkSN7NvFwkEJiiu=_w@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] dm-cache and snapshots
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

Dne 3.11.2015 v 06:02 Syahrul Sazli Shaharir napsal(a):
> Hi,
>
> In dm-cache, how do you do snapshots on a cached LV?
>
> # lvs
>    LV         VG          Attr       LSize   Pool          Origin
>        Data%  Meta%  Move Log Cpy%Sync Convert
>    LogVol00   vg_server17 -wi-ao---- 117.19g
>    LogVol01   vg_server17 -wi-ao----  78.12g
>    kvm163_img vg_server17 Cwi-aoC---   1.05t [DataLVcache]
> [kvm163_img_corig] 10.14  12.29           0.00
>
> # lvcreate -s -n /dev/vg_server17/kvm163_img_snap -L 10G
> /dev/vg_server17/kvm163_img
>
>    Snapshots of cache type volume vg_server17/kvm163_img is not supported.

Hi

Support for snapshot of cached LV is not yet written - so you need to uncache 
LV for now.

Regards

Zdenek
