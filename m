Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBP9J611028228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 25 Dec 2016 04:19:06 -0500
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 123F88553F
	for <linux-lvm@redhat.com>; Sun, 25 Dec 2016 09:19:05 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id 88so139543252uaq.3
	for <linux-lvm@redhat.com>; Sun, 25 Dec 2016 01:19:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKGZFci3=JchgD_fOLWJYZ4ZdKvUjRx-1vXW++QJ2P-338YOyQ@mail.gmail.com>
References: <CAKGZFci3=JchgD_fOLWJYZ4ZdKvUjRx-1vXW++QJ2P-338YOyQ@mail.gmail.com>
From: Ming-Hung Tsai <mingnus@gmail.com>
Date: Sun, 25 Dec 2016 17:19:03 +0800
Message-ID: <CAAYit8SPecddvYeMRo1-=Erw7kLboQGrhRTWLSrauq0-81bMiw@mail.gmail.com>
Subject: Re: [linux-lvm] LVM Cache Error: Manual Repair Required
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

How did your cache-pool get broken? Power lost or other cause?

lvconvert --repair is for thin-pools only, so you might need to repair
the cache-pool manually, by using cache_repair and other tools in the
package thin-provisioning-tools. I'm not familiar with dm-cache, so I
don't know whether there's any limitation in cache_repair.

Removing the cache layer might also work, but for safety, you can try
to activate the cache origin manually at first (it might be
data-lv_corig), to see whether the data is fine or not.


Ming-Hung Tsai

2016-12-25 1:44 GMT+08:00 Matt Joyce <mttjocy@gmail.com>:
> $ sudo lvchange -ay hdd-vg/data-lv
>   Check of pool hdd-vg/data-lv_cache failed (status:1). Manual repair required!
>
> $ sudo lvconvert --repair hdd-vg/data-lv
>   Can't repair LV "data-lv" of segtype cache.
>
> $ sudo lvconvert --repair hdd-vg/data-lv_cache
>   Internal error: pool_is_active called with non-pool LV data-lv_cache.
> bad checksum in superblock
>   Repair of thin metadata volume of thin pool hdd-vg/data-lv_cache
> failed (status:1). Manual repair required!
>
> $ sudo lvremove hdd-vg/data-lv_cache
> Do you really want to remove and DISCARD logical volume data-lv_cache? [y/n]: y
>   Check of pool hdd-vg/data-lv_cache failed (status:1). Manual repair required!
>   Failed to active cache locally hdd-vg/data-lv.
