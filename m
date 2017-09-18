Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FE165D97B
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2017 19:20:38 +0000 (UTC)
Received: from mr003msb.fastweb.it (mr003msb.fastweb.it [85.18.95.87])
	by mx1.redhat.com (Postfix) with ESMTP id 87537C00DBB0
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2017 19:20:37 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 18 Sep 2017 21:20:36 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <67e57de26f65447bde9e55bcf9a99ccc@xenhideout.nl>
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
Message-ID: <d4b39ca6a299eb609f27f99e24eb7e26@assyoma.it>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Xen <list@xenhideout.nl>

Il 17-09-2017 09:10 Xen ha scritto:
> Xen schreef op 17-09-2017 8:31:
> 
> 
> But if it's not active I don't see why it should be critical or why
> you should reserve space for it to be honest...

Xen, I really think that the combination of hard-threshold obtained by 
setting thin_pool_autoextend_threshold and thin_command hook for 
user-defined script should be sufficient to prevent and/or react to full 
thin pools.

I'm all for the "keep it simple" on the kernel side. After all, thinp 
maintain very high performance in spite of its CoW behavior *even when 
approaching pool fullness*, a thing which can not be automatically said 
for advanced in-kernel filesystems as BTRFS (which very low 
random-rewrite performance) and ZFS (I just recently opened a ZoL issue 
for ZVOLs with *much* lower than expected write performance, albeit the 
workaround/correction was trivial in this case).

That said, I would like to see some pre-defined scripts to easily manage 
pool fullness. For example, a script to automatically delete all 
inactive snapshots with "deleteme" or "temporary" flag. Sure, writing 
such a script is trivial for any sysadmin - but I would really like the 
standardisation such predefined scripts imply.

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
