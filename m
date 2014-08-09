Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s79GQUJV020393
	for <linux-lvm@redhat.com>; Sat, 9 Aug 2014 12:26:30 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s79GQSpI012484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Sat, 9 Aug 2014 12:26:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 9EFE1200428
	for <linux-lvm@redhat.com>; Sat,  9 Aug 2014 18:26:27 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 1f2_edoks7D7 for <linux-lvm@redhat.com>;
	Sat,  9 Aug 2014 18:26:27 +0200 (CEST)
Received: from [192.168.200.131] (host-62-245-233-61.customer.m-online.net
	[62.245.233.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 532602002CB
	for <linux-lvm@redhat.com>; Sat,  9 Aug 2014 18:26:27 +0200 (CEST)
Message-ID: <53E64BB2.6020508@mglug.de>
Date: Sat, 09 Aug 2014 18:26:26 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
References: <53E6259B.8090902@mglug.de>
In-Reply-To: <53E6259B.8090902@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] howto cache a thinpool-device?
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
To: linux-lvm@redhat.com

Hi list,

what now worked:

- creating a cached data-lv
- creating a non-cached meta-lv
- converting data-lv to a thinpool-device with meta-lv as metadata

what not: doing the same thing with a cached meta-lv. Does this make sense?

Is the metadata already cached by lvm-logic? Do i have a cache thinpool
(with non-cached metadata) with the used way?

Tfh!
Oliver


Am 09.08.2014 um 15:43 schrieb Oliver Rath:
> Hi list,
>
> Im playing around with the new cache options. Ive created a lvm-device
> on my cache-disk named lvx-cache (vg is dmivg). Additionally Ive created
> a thinpool-device named winthinpool.
>
> Now i wanted to use my cache-device to cache my thinpool-lvm, but this
> doesnt work:
>
> ~# lvconvert --type cache --cachepool dmivg/lvx_cache dmivg/winthinpool
>   Can't cache thin-pool volume dmivg/winthinpool.
>
> isnt is possible to cache a thinpool-device?
>
> Tfh!
> Oliver
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
