Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0FE117C25
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 12:47:59 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E5A317EA84
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 12:47:52 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id 72DE14062A54
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 14:47:51 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 12 Sep 2017 14:47:51 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <b51c8dfd-bdd0-2e38-cc47-bef358bbc8e6@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<872ad7be3b36e2eb0afc080fa781d84d@assyoma.it>
	<e580b78b-0aaa-d075-5009-278d26823a7c@redhat.com>
	<e3bc609f-a1fd-e2e8-e431-4820cd9f9487@assyoma.it>
	<b51c8dfd-bdd0-2e38-cc47-bef358bbc8e6@redhat.com>
Message-ID: <f82cf9e82a9ecb2e4465a469219c53af@xenhideout.nl>
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

Zdenek Kabelac schreef op 12-09-2017 14:03:

> Unfortunatelly lvm2 nor dm  can be responsible for whole kernel logic 
> and
> all user-land apps...

What Gionatan also means, or at least what I mean here is,

If functioning is chain and every link can be the weakest link.

Then sometimes you can build in a little redundancy so that other weak 
links do not break so easily. Or that your part can cover it.

Linux has had a mindset of reducing redundancy lately. So every bug 
anywhere can break the entire thing.

Example was something I advocated for myself.

I installed GRUB2 inside PV reserved space.

That means 2nd sector had PV, 1st sector had MBR-like boot sector.

libblkid stopped at MBR and did not recognise PV.

Now because udev required libblkid to recognise PVs it did not recognise 
and did not activate it.

Problem.

Weakest link in this case libblkid.

Earlier vgchange -ay worked flawlessly (and had some redundancy) but was 
no longer used.

So you can see how small things can break entire system. Not good 
design.

Firmware RAID signature at end of drive also breaks system.

Not good design.


> You can also minimize amount of 'dirty' pages to avoid loosing too much 
> data
> in case you hit full thin-pool unexpectedly.....

Torvalds advocated this.

> You can sync every second to minimize amount of dirty pages....
> 
> Lots of things....  all of them will in some other the other impact
> system performance....

He said no people would be hurt by such a measure except people who 
wanted to unpack and compile kernel pure in page buffers ;-).
