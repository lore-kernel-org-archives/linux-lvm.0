Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7NELd7J013504
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 10:21:39 -0400
Received: from mail.zipman.it (mail.zipman.it [188.40.73.116])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7NELc05016492
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 10:21:38 -0400
Received: from [IPv6:2001:1418:100:1ca::2] (cl-459.trn-01.it.sixxs.net
	[IPv6:2001:1418:100:1ca::2])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.zipman.it (Postfix) with ESMTPSA id AAC3F2F861
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 16:21:36 +0200 (CEST)
Message-ID: <50363C6D.7090104@zipman.it>
Date: Thu, 23 Aug 2012 16:21:33 +0200
From: flavio-redhat@zipman.it
MIME-Version: 1.0
References: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
	<CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
In-Reply-To: <CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvextend NEVER works but screws up
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

On 08/23/2012 01:14 PM, tariq wali wrote:
> I wanted to use the free 42.7 G and allocate it to /bin-logs so this is
> what I ran in order to extended
> 
> # lvextend -L +42.7G -n /dev/vg0/logs
>   Rounding up size to full physical extent 42.70 GB
>   Extending logical volume logs to 142.70 GB
>   Logical volume logs successfully resized
> 
> #resize2fs /dev/vg0/logs    ( and it gets screwed up here )
> resize2fs 1.39 (29-May-2006)
> *resize2fs: Filesystem has unsupported feature(s) while trying to open
> /dev/vg0/logs*
> *Couldn't find valid filesystem superblock.*

This problem seems to be with your filesystem tools, not with LVM. If I
were you I'd create a new LV, make a new filesystem, move all the files
on the new LV, mount it, remove the OLD LV and then extend the new LV.


-- 
Flavio Visentin

A computer is like an air conditioner,
it stops working when you open Windows
