Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED174609B4
	for <linux-lvm@redhat.com>; Wed,  7 Feb 2018 18:50:20 +0000 (UTC)
Received: from mr013msb.fastweb.it (mr013msb.fastweb.it [85.18.95.104])
	by mx1.redhat.com (Postfix) with ESMTP id EC7514900E
	for <linux-lvm@redhat.com>; Wed,  7 Feb 2018 18:50:11 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 07 Feb 2018 19:42:13 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <483f0010a2bb04054c8434d70e0248a2@xenhideout.nl>
References: <483f0010a2bb04054c8434d70e0248a2@xenhideout.nl>
Message-ID: <36e66a2bedd0821a7976d82c01c8660a@assyoma.it>
Subject: Re: [linux-lvm] Saying goodbye to LVM
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
Cc: Xen <list@xenhideout.nl>

Il 01-02-2018 17:45 Xen ha scritto:
> You are probably happy about this, but...
> 
> I managed to get LVM to corrupt my data on Ubuntu Xenial 3 times now.
> 
> All of that is related to:
> 
> - LVM not checking or behaving correctly when a duplicate PV appears
> - LVM not checking or behaving correctly when a cache volume is out of
> sync with its origin.
> 
> In addition the thin DM target of kernel 3.x was so buggy I couldn't
> compile anything big without the system hanging.
> 
> I will probably become a ZFS user.
> 
> Goodbye, and thanks for all the fish.

I am both a LVM/ThinLVM and ZFS heavy user, so I hope to be impartial 
here...

LVM and its lvmthin counterpart are *rock solid* in my experience, 
except in the (very) edge case of full thin pool (this was lengthly 
discussed in the past, and both Zednek and Jonathan gave accurate 
suggestions on how to avoid that).

However, in my experience, the only distribution which keep updated 
version of lvm kernel and user space utilities is RHEL/CentOS. I found 
Debian and Ubuntu based distributions particularly *bad* at managing LVM 
and device mapper targets in general.

I am not using lvmcache, so I can not speak for it.

That said, ZFS really is outstanding (especially checksum and 
compression, albeit is sorely lacks reflinks). I really have high hopes 
for stratis (https://github.com/stratis-storage), which plan to provide 
ZFS-like feature using stacked device mapper targets (which our beloved 
LVM targets on top).

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
