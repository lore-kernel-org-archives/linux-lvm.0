Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u16DE6WX013996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 6 Feb 2016 08:14:06 -0500
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52]) by mx1.redhat.com (Postfix) with ESMTPS id B1605263C
	for <linux-lvm@redhat.com>; Sat,  6 Feb 2016 13:14:04 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id y9so84110407qgd.3
	for <linux-lvm@redhat.com>; Sat, 06 Feb 2016 05:14:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56B4DBAA.1010902@redhat.com>
References: <CAGU4k=2NLJqM2P+_fNiOc82Ynfppk5qNShZsSVy4S=hJMxw7_A@mail.gmail.com>
	<CAAYit8T1Wh+zQT_fsEk88D=1hv2A=kLVGWQAcdccjzx5xPuh5g@mail.gmail.com>
	<56B4BD12.3050103@redhat.com>
	<CAAYit8SG+PrSfGzi6S0eYpX8SQhECCvaeWvN9Gqq9z8VwA8SmQ@mail.gmail.com>
	<56B4DBAA.1010902@redhat.com>
Date: Sat, 6 Feb 2016 21:14:04 +0800
Message-ID: <CAAYit8TcGytL+6vGmJUW-Hti82PtkP_obH73F5n=v3L46SXu2Q@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Subject: Re: [linux-lvm] Repair thin pool
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

2016-02-06 1:28 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
> But that's actually what described 'swap' is for.
>
> You 'replace/swap'  existing metadata LV with some selected LV in VG.
>
> Then you activate this LV - and you may do whatever you need to do.
> (so you have content of  _tmeta LV  accessible through your  tmp_created_LV)

I forget that we can use swapping to make _tmeta visible. The steps in
this page are correct.
http://www.spinics.net/lists/lvm/msg22629.html
The only typo in this post is that we should use thin_repair instead
of thin_restore.
http://permalink.gmane.org/gmane.linux.lvm.general/14829

> lvm2 currently doesn't support activation of 'subLVs'  as it makes
> activation of the whole tree of LVs much more complicated (clvmd support
> restrictions)
>
> So ATM we take only top-level LV lock in cluster (and yes - there is still
> unresolved bug for thin-pool/thinLV - when user may 'try' to activate
> different thin LVs from a single thin-pool on multiple nodes - so for now -
> there is just one advice - don't do that - until we provide a fix for this.

I didn't try clvm. Thanks for noticing.


Ming-Hung Tsai
