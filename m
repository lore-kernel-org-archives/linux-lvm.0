Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD20660468
	for <linux-lvm@redhat.com>; Sun, 17 Sep 2017 06:31:41 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94B3D356C0
	for <linux-lvm@redhat.com>; Sun, 17 Sep 2017 06:31:38 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp1.signet.nl (Postfix) with ESMTP id 1AEDD67AD1
	for <linux-lvm@redhat.com>; Sun, 17 Sep 2017 08:31:37 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sun, 17 Sep 2017 08:31:36 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <458d105938796d90f4e426bc458e8cc4@xenhideout.nl>
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
Message-ID: <f7665fc3546d23200e9b08c6cdb67d2e@xenhideout.nl>
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

Xen schreef op 17-09-2017 0:33:

> But if it's not active, can it still 'trace' another volume? Ie. it
> has to get updated if it is really a snapshot of something right.
> 
> If it doesn't get updated (and not written to) then it also does not
> allocate new extents.

Oh now I get what you mean.

If it's not active it can also in that sense not reserve any extents for 
itself.

So the calculations I proposed way below require at least 2 numbers for 
each 'critical' volume to be present in the kernel.

Which is the unallocated virtual size and the reserved space.

So even if they're not active they would need to provide this 
information somehow.

Of course the information also doesn't change if it's not active, so it 
would just be 2 static numbers.

But then what happens if you change the reserved space etc...

In any case that sorta thing would indeed be required...

(For an in-kernel thing...)

(Also any snapshot of a critical volume would not in itself become a 
critical volume...)

(But you're saying that "thin snapshot" is not a kernel concept...)
