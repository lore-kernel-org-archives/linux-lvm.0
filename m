Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20D832026D68
	for <linux-lvm@redhat.com>; Wed, 22 Jan 2020 13:50:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 563D5180061D
	for <linux-lvm@redhat.com>; Wed, 22 Jan 2020 13:50:08 +0000 (UTC)
Received: from wiki.gathman.org ([IPv6:2001:470:8:809::2])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 00MD6RHO032422
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 22 Jan 2020 08:06:31 -0500
Date: Wed, 22 Jan 2020 08:06:28 -0500 (EST)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <CAHEKYV7Uvqm2knzb4QsTxtdec2Wi+mnFi2Q6MbP95gseS5V7Ow@mail.gmail.com>
Message-ID: <alpine.LRH.2.21.2001220803070.14824@fairfax.gathman.org>
References: <CAHEKYV7Uvqm2knzb4QsTxtdec2Wi+mnFi2Q6MbP95gseS5V7Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Failed merge, still running?
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

On Wed, 22 Jan 2020, Mauricio Tavares wrote:

> lvconvert --merge vmhost_vg0/desktop_snap_20200121
>
> and instead of seeing the usual percentage of how far it has
> completed, I got nothing. lvs -a -o +devices shows
>
>  LV                      VG         Attr       LSize  Pool Origin
> Data%  Meta%  Move Log Cpy%Sync Convert Devices
>  desktop                 vmhost_vg0 Owi-a-s--- 20.00g
>                                     /dev/sdb3(14848)
>  [desktop_snap_20200121] vmhost_vg0 Swi-a-s--- 10.00g      desktop 100.00

While not a guru, I think I can tell you the issue.  It looks like
the snapshot was full (says 100.00).  The snapshot is unusable at
that point.  Maybe it wasn't before you started the merge, and the
merge sets it to 100.00 when it starts, I haven't noticed.

> Before I blow that lv up, what else should I be checking?

What was the snapshot percent used before you started the merge?

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
