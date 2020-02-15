Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66EC110D18D5
	for <linux-lvm@redhat.com>; Sat, 15 Feb 2020 19:07:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 292FD800A17
	for <linux-lvm@redhat.com>; Sat, 15 Feb 2020 19:07:58 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 15 Feb 2020 20:07:46 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <20200214204028.GB20792@redhat.com>
References: <098d6e8d-2d2c-5067-1435-eefd7e2d09bc@suse.com>
	<20200214191115.GA20792@redhat.com>
	<1f438b012d606d06d77ff9a1fc3a6926@assyoma.it>
	<20200214204028.GB20792@redhat.com>
Message-ID: <f2afdaffed97fbb4d555f619917899e3@assyoma.it>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] commit c527a0cbfc3 may have a bug
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
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com, heming.zhao@suse.com

Il 2020-02-14 21:40 David Teigland ha scritto:
> You're right, filters are difficult to understand and use correctly.  
> The
> complexity and confusion in the code is no better.  With the removal of
> lvmetad in 2.03 versions (e.g. RHEL8) there's no difference between 
> filter
> and global_filter, so that's some small improvement.  But, I think 
> filters
> should be replaced or overhauled with something easier to use and more
> useful at a technical level.
> 
> I've created a bz about that and welcome thoughts about what a 
> replacement
> should or should not be like.  With input the work is more likely to be
> prioritized.
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1803266

Hi David, I think that part of the problem is the unclear/vague 
description of filters (eg: "plain" filter vs global_filter). In other 
words, maybe the real problem is a documentation one.

For example: am I right saying that global_filter were introduced as a 
"fail-safe" mechanism to protect udev & the likes by 
command-line-overwritten "plain" filter directive?

If so, I am not sure the comment in lvm.conf fully convey this message 
(and I can not find much on man pages, also). If not, and I am wrong 
about filter vs global_filter, then, well, this somewhat proves the 
point above :)

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it [1]
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
