Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 248C760635
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2017 13:05:12 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92A8CCF7C
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2017 13:05:08 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id D9C8440B312B
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2017 15:05:06 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 20 Sep 2017 15:05:06 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <d4b39ca6a299eb609f27f99e24eb7e26@assyoma.it>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<aca4355a-d7f3-c116-fc7b-7379f269a21a@assyoma.it>
	<B6F45B41-86FC-4810-BC40-0EEE8DD9E372@redhat.com>
	<f2e24a01b1e548b6b15db6d30596208b@xenhideout.nl>
	<595ff1d4-3277-ca5e-a18e-d62eaaf0b1a0@redhat.com>
	<9aa2d67c38af3e4042bd3f37559b799d@xenhideout.nl>
	<eb24f4de-2b58-38a4-9c8d-950a36530ed7@redhat.com>
	<2d1025d7784ab44cbc03cfe7f6778599@xenhideout.nl>
	<58f99204-d978-3f6a-9db8-b7122b30575e@redhat.com>
	<458d105938796d90f4e426bc458e8cc4@xenhideout.nl>
	<f7665fc3546d23200e9b08c6cdb67d2e@xenhideout.nl>
	<67e57de26f65447bde9e55bcf9a99ccc@xenhideout.nl>
	<d4b39ca6a299eb609f27f99e24eb7e26@assyoma.it>
Message-ID: <e313e53f07abafead1713f03cf179542@xenhideout.nl>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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

Gionatan Danti schreef op 18-09-2017 21:20:

> Xen, I really think that the combination of hard-threshold obtained by
> setting thin_pool_autoextend_threshold and thin_command hook for
> user-defined script should be sufficient to prevent and/or react to
> full thin pools.

I will hopefully respond to Zdenek's message later (and the one before 
that that I haven't responded to),

> I'm all for the "keep it simple" on the kernel side.

But I don't mind if you focus on this,

> That said, I would like to see some pre-defined scripts to easily
> manage pool fullness. (...) but I would really
> like the standardisation such predefined scripts imply.

And only provide scripts instead of kernel features.

Again, the reason I am also focussing on the kernel is because:

a) I am not convinced it cannot be done in the kernel
b) A kernel feature would make space reservation very 'standardized'.

Now I'm not convinced I really do want a kernel feature but saying it 
isn't possible I think is false.

The point is that kernel features make it much easier to standardize and 
to put some space reservation metric in userland code (it becomes a 
default feature) and scripts remain a little bit off to the side.

However if we *can* standardize on some tag or way of _reserving_ this 
space, I'm all for it.

I think a 'critical' tag in combination with the standard 
autoextend_threshold (or something similar) is too loose and ill-defined 
and not very meaningful.

In other words you would be abusing one feature for another purpose.

So I do propose a way to tag volumes with a space reservation (turning 
them cricical) or alternatively to configure a percentage of reserved 
space and then merely tag some volumes as critical volumes.

I just want these scripts to be such that you don't really need to 
modify them.

In other words: values configured elsewhere.

If you think that should be the thin_pool_autoextend_threshold, fine, 
but I really think it should be configured elsewhere (because you are 
not using it for autoextending in this case).

thin_command is run every 5%:

https://www.mankier.com/8/dmeventd

You will need to configure a value to check against.

This is either going to be a single, manually configured, fixed value 
(in % or extents)

Or it can be calculated based on reserved space of individual volumes.

So if you are going to have a kind of "fsfreeze" script based on 
critical volumes vs. non-critical volumes I'm just saying it would be 
preferable to set the threshold at which to take action in another way 
than by using the autoextend_threshold for that.

And I would prefer to set individual space reservation for each volume 
even if it can only be compared to 5% threshold values.

So again: if you want to focus on scripts, fine.
