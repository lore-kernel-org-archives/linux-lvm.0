Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8J33gaZ019054
	for <linux-lvm@redhat.com>; Sun, 18 Sep 2011 23:03:42 -0400
Received: from smtp2.pacifier.net (smtp2.pacifier.net [64.255.237.172])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8J33cne026327
	for <linux-lvm@redhat.com>; Sun, 18 Sep 2011 23:03:38 -0400
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp2.pacifier.net (Postfix) with ESMTPS id 64D932C9FE
	for <linux-lvm@redhat.com>; Sun, 18 Sep 2011 20:03:38 -0700 (PDT)
From: ben <benscott@nwlink.com>
Date: Sun, 18 Sep 2011 20:03:36 -0700
Message-ID: <12190884.WQ2Kanu2Zj@laptop>
In-Reply-To: <2097280.qh0eFtcjbt@laptop>
References: <2097280.qh0eFtcjbt@laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [linux-lvm] (bump) liblvm2app improvement suggestions
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
To: LVM general discussion and development <linux-lvm@redhat.com>

bump

No comments?

On September 12 05:30:58 PM ben wrote:
> When reading the list of logical volumes using the library it can be really
> difficult to determine just what type of volume each one really is. The
> problem is that the attributes field doesn't cover all the possiblities. A
> volume can be an origin and a mirror or it may be a mirror log that is also
> a mirror. I have had to resort to parsing the name string for things like
> "_mlog" to determine what I am dealing with.
> 
> It would be really helpful to have some functions like:
> 
> lvm_lv_is_snapshot(const lv_t lv)
> lvm_lv_is_mirror(const lv_t lv)
> lvm_lv_is_origin(const lv_t lv)
> lvm_lv_is_mirror_log(const lv_t lv)
> lvm_lv_is_mirror_leg(const lv_t lv)
> 
> and you get the idea.
> 
> Thank you.
