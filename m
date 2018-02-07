Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A222F17188
	for <linux-lvm@redhat.com>; Wed,  7 Feb 2018 21:19:32 +0000 (UTC)
Received: from mr013msb.fastweb.it (mr013msb.fastweb.it [85.18.95.104])
	by mx1.redhat.com (Postfix) with ESMTP id 2304BC0587E7
	for <linux-lvm@redhat.com>; Wed,  7 Feb 2018 21:19:30 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 07 Feb 2018 22:19:28 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <74c6270dfd9e5f5784556593a706f24a@xenhideout.nl>
References: <483f0010a2bb04054c8434d70e0248a2@xenhideout.nl>
	<36e66a2bedd0821a7976d82c01c8660a@assyoma.it>
	<74c6270dfd9e5f5784556593a706f24a@xenhideout.nl>
Message-ID: <080fb0a6027e5b15e004de36c05a852a@assyoma.it>
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

Il 07-02-2018 21:37 Xen ha scritto:
> This is the reason for the problems but LVM released bad products all
> the same with the solution being to not use them for very long, or
> rather, to upgrade.
> 
> Yes Ubuntu runs a long time behind and Debian also.
> 
> As a user, I can't help that, upgrading LVM just like that to have
> less "there is a pit here but we won't tell you about that" simply
> seems also fraught with peril.
> 
> For example, upgrading LVM slightly to 160 caused udev problems I
> didn't have before.
> 
> So you can blame the distributions, you can also blame features being
> released first and proper protection only being added much later.
> 
> So if you're on Xenial, you are stuck with the features but without
> the protection.
> 
> In particular there is a quagmire of situations you can end up with
> wrt the shielding and dual activation of the same vg, many times of
> which you can only get out of the situation with dmsetup remove, but I
> didn't know this at first.
> 
> Or you end up in the situation where a PV is missing and you cannot
> edit the VG, but in order to remove the PV you have to edit the VG.
> 
> A missing cache device cannot be removed without the missing cache
> device being present.
> 
> I meant to say, you can have 2 disks out of sync and resolving it is
> not possible other than by editing config on disk and doing
> vgcfgrestore.
> 
> But you can't do vgcfgrestore without removing a missing PV first.
> 
> There is a huge amount of chicken and egg problems because physically
> a VG sits inside a PV but logically a PV sits inside a VG and this
> constantly causes issues.
> 
> LVM just has conceptual problems.

As a CentOS user, I *never* encountered such problems. I really think 
these are caused by the lack of proper integration testing from 
Debian/Ubuntu. But hey - all key LVM developers are RedHat people, so it 
should be expected (for the better/worse).

I can not say anything about lvmcache, though.

> 
> I cannot write more yet because I don't have ZFS setup yet.
> 
> I don't like ZFS too much because it's opaque and Linux support seems
> to be flimsy (for example boot support) and the only good
> documentation is Oracle but it often does not apply.

True. I never use it with boot device. LVM and XFS are, on the other 
hand, extremely well integrated into mainline kernel/userspace 
utilities.

Hence my great interest in stratis...
Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
