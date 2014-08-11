Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7BCu04A005617
	for <linux-lvm@redhat.com>; Mon, 11 Aug 2014 08:56:00 -0400
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7BCtwoc026862
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 11 Aug 2014 08:55:59 -0400
Received: by mail-we0-f169.google.com with SMTP id u56so8601329wes.0
	for <linux-lvm@redhat.com>; Mon, 11 Aug 2014 05:55:58 -0700 (PDT)
Received: from [10.34.131.31] (nat-pool-brq-t.redhat.com. [209.132.186.34])
	by mx.google.com with ESMTPSA id a4sm43574956wie.21.2014.08.11.05.55.57
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 05:55:57 -0700 (PDT)
Message-ID: <53E8BD5B.2070002@gmail.com>
Date: Mon, 11 Aug 2014 14:55:55 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <53E65987.8010605@mglug.de>
In-Reply-To: <53E65987.8010605@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] what todo with broken cachedev?
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

Dne 9.8.2014 19:25, Oliver Rath napsal(a):
> Hi list,
>
> assuming a cached device mylv from /dev/sda1 with cachepool from
> /dev/sdb1 (ssd i.e.):
>
> If now the ssd crashes and the cachemode is "writethrough" i think,
> there is no data loss for my lv's, right?
>
> But then mylv runs without a cache device although the device is set in
> metadata.
>
> The command lvreduce cant remove the cache-attribut. vgreduce *could*
> remove it, right? But only if there is no usage bei the cachepool-device
> anymore.
>
> Is there a solution for that?


Cache support is still experimental - so please open bugzillas
for your issues found on  bugzilla.redhat.com
(if you are not using Fedora/RHEL - use Fedora Rawhide for your reports)

I assume your problem is likely related to still missing repair support
for cached volumes.

You would need to use  cache utils  (cache_check, cache_repair, cache_dump...) 
to fix broken metadata.

Zdenek
