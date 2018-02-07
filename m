Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92B70171B3
	for <linux-lvm@redhat.com>; Wed,  7 Feb 2018 20:37:32 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46617628
	for <linux-lvm@redhat.com>; Wed,  7 Feb 2018 20:37:29 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp1.signet.nl (Postfix) with ESMTP id B306335F2B
	for <linux-lvm@redhat.com>; Wed,  7 Feb 2018 21:37:27 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 07 Feb 2018 21:37:26 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <36e66a2bedd0821a7976d82c01c8660a@assyoma.it>
References: <483f0010a2bb04054c8434d70e0248a2@xenhideout.nl>
	<36e66a2bedd0821a7976d82c01c8660a@assyoma.it>
Message-ID: <74c6270dfd9e5f5784556593a706f24a@xenhideout.nl>
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
To: linux-lvm@redhat.com

Gionatan Danti schreef op 07-02-2018 19:42:

> I am both a LVM/ThinLVM and ZFS heavy user, so I hope to be impartial 
> here...
> 
> LVM and its lvmthin counterpart are *rock solid* in my experience,
> except in the (very) edge case of full thin pool (this was lengthly
> discussed in the past, and both Zednek and Jonathan gave accurate
> suggestions on how to avoid that).
> 
> However, in my experience, the only distribution which keep updated
> version of lvm kernel and user space utilities is RHEL/CentOS. I found
> Debian and Ubuntu based distributions particularly *bad* at managing
> LVM and device mapper targets in general.

This is the reason for the problems but LVM released bad products all 
the same with the solution being to not use them for very long, or 
rather, to upgrade.

Yes Ubuntu runs a long time behind and Debian also.

As a user, I can't help that, upgrading LVM just like that to have less 
"there is a pit here but we won't tell you about that" simply seems also 
fraught with peril.

For example, upgrading LVM slightly to 160 caused udev problems I didn't 
have before.

So you can blame the distributions, you can also blame features being 
released first and proper protection only being added much later.

So if you're on Xenial, you are stuck with the features but without the 
protection.

In particular there is a quagmire of situations you can end up with wrt 
the shielding and dual activation of the same vg, many times of which 
you can only get out of the situation with dmsetup remove, but I didn't 
know this at first.

Or you end up in the situation where a PV is missing and you cannot edit 
the VG, but in order to remove the PV you have to edit the VG.

A missing cache device cannot be removed without the missing cache 
device being present.

I meant to say, you can have 2 disks out of sync and resolving it is not 
possible other than by editing config on disk and doing vgcfgrestore.

But you can't do vgcfgrestore without removing a missing PV first.

There is a huge amount of chicken and egg problems because physically a 
VG sits inside a PV but logically a PV sits inside a VG and this 
constantly causes issues.

LVM just has conceptual problems.

> That said, ZFS really is outstanding (especially checksum and
> compression, albeit is sorely lacks reflinks). I really have high
> hopes for stratis (https://github.com/stratis-storage), which plan to
> provide ZFS-like feature using stacked device mapper targets (which
> our beloved LVM targets on top).

I cannot write more yet because I don't have ZFS setup yet.

I don't like ZFS too much because it's opaque and Linux support seems to 
be flimsy (for example boot support) and the only good documentation is 
Oracle but it often does not apply.
