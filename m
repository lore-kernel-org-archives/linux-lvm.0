Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1DDR28W030853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 08:27:02 -0500
Received: from mps1.wohnheimg.uni-frankfurt.de
	(mps1.wohnheimg.uni-frankfurt.de [141.2.118.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0F0E8046B
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 13:27:00 +0000 (UTC)
Received: from p4fcef50d.dip0.t-ipconnect.de ([79.206.245.13]
	helo=[192.168.0.102]) (Authed sender Sven 'DarKRaveR' Eschenberg)
	by mps1.wohnheimg.uni-frankfurt.de via ESMTPSA
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1cdGMY-0004BJ-4J
	for linux-lvm@redhat.com; Mon, 13 Feb 2017 14:08:14 +0100
References: <bd71a2a1-9519-662b-f7a3-bd9d40049930@yahoo.co.uk>
From: Sven Eschenberg <sven@whgl.uni-frankfurt.de>
Message-ID: <36a67e3b-fea9-ae9c-a128-89fe6c1783de@whgl.uni-frankfurt.de>
Date: Mon, 13 Feb 2017 14:08:11 +0100
MIME-Version: 1.0
In-Reply-To: <bd71a2a1-9519-662b-f7a3-bd9d40049930@yahoo.co.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] discard with luks and the FS itself
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
To: linux-lvm@redhat.com

Depends on your storage stack configuration, but the answer is mostly yes:
cryptsetup has discard disabled by default, for very good reasons.
filesystems vary, so you'd have to check on your particular filesystem 
documentation.

That's probably why you cannot find the ultimate answer - there's none.

Regards

-Sven


Am 13.02.2017 um 12:59 schrieb lejeczek:
> hi everyone
>
> I realize question does not pertain LVM directly but knowing that on the
> list wonder around some very crypt-savvy  guys&gals I thought I'd ask:
>
> Does one have to flag mounts with discard for both crypttab and fstab in
> order for TRIM to be in effect?
> Or just one? Just crypttab?
>
> I've searched but failed to find an ultimate answer.
> b.w.
> L.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
