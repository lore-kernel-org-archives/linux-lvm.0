Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAJ8uknB003316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2015 03:56:46 -0500
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mx1.redhat.com (Postfix) with ESMTPS id 244B48F232
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2015 08:56:45 +0000 (UTC)
Received: by wmww144 with SMTP id w144so106618467wmw.0
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2015 00:56:43 -0800 (PST)
Received: from [10.34.131.78] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id m11sm4620886wma.5.2015.11.19.00.56.42
	for <linux-lvm@redhat.com> (version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Nov 2015 00:56:42 -0800 (PST)
References: <CANvPVN3ZzNiPsa_H-Lr38Ere1kYKzU2EPK_dFu0wG--cgtsZrA@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <564D8EC9.1070406@gmail.com>
Date: Thu, 19 Nov 2015 09:56:41 +0100
MIME-Version: 1.0
In-Reply-To: <CANvPVN3ZzNiPsa_H-Lr38Ere1kYKzU2EPK_dFu0wG--cgtsZrA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Cache block size warning
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

Dne 19.11.2015 v 08:27 Ciprian Hacman napsal(a):
> Hi,
>
> We are configuring lvm with SSD caching on some of our boxes in AWS. When the
> cache is initialised, we see this in logs:
>
>     device-mapper*: cache: You have created a cache device with a lot of
>     individual cache blocks (4915200)*
>
>     *               All these mappings can consume a lot of kernel memory, and
>     take some time to read/write.*
>
>     *               Please consider increasing the cache block size to reduce
>     the overall cache block count.*
>
>
> Is this something to worry? If so, how can we improve it?
>

If you have lots of kernel memory - it's probably ok.
Otherwise you may try to use bigger chunk size.

e.g.  --chunksize 512K   or even more:

lvcreate --type cache-pool -L300G vg/cpool

lvcreate -H --chunksize 512K -L1.5T   --name data  vg/cpool

It's possible future version of lvm2 will try to create this by default.

Zdenek
