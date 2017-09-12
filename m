Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB3E16685C
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 16:49:58 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9CA3F6DDEE
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 16:49:57 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id 0872840B0C6B
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 18:49:56 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Sep 2017 18:49:56 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <c3423f37-6f6f-0623-527b-e1039659de3d@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<872ad7be3b36e2eb0afc080fa781d84d@assyoma.it>
	<e580b78b-0aaa-d075-5009-278d26823a7c@redhat.com>
	<e3bc609f-a1fd-e2e8-e431-4820cd9f9487@assyoma.it>
	<b51c8dfd-bdd0-2e38-cc47-bef358bbc8e6@redhat.com>
	<f82cf9e82a9ecb2e4465a469219c53af@xenhideout.nl>
	<c3423f37-6f6f-0623-527b-e1039659de3d@redhat.com>
Message-ID: <f8f7fadb946aa48e892bc3fd06d3b61b@xenhideout.nl>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Zdenek Kabelac schreef op 12-09-2017 16:57:

> This bug has been reported (by me even to libblkid maintainer) AND
> already fixed already in past....

I was the one who reported it.

This was Karel Zak's message from 30 august 2016:

"On Fri, Aug 19, 2016 at 01:14:29PM +0200, Karel Zak wrote:
On Thu, Aug 18, 2016 at 10:39:30PM +0200, Xen wrote:
Would someone be will to fix the issue that a Physical Volume from LVM2=20
(PV)
when placed directly on disk (no partitions or partition tables) will=20
not be

This is very unusual setup, but according to feedback from LVM guys
it's supported, so I will improve blkid to support it too.

Fixed in the git tree (for the next v2.29). Thanks.

     Karel"

So yes, I knew what I was talking about.

At least slightly ;-).

:p.


> But to defend a bit libblkid maintainer side :) - this feature was not
> really well documented from lvm2 side...

That's fine.

>>> You can sync every second to minimize amount of dirty pages....
>>>=20
>>> Lots of things....=C2=A0 all of them will in some other the other impact
>>> system performance....
>>=20
>> He said no people would be hurt by such a measure except people who=20
>> wanted to unpack and compile kernel pure in page buffers ;-).
>=20
>=20
> So clearly you need to spend resources effectively and support both=20
> groups...
> Sometimes is better to use large RAM (common laptops have 32G of RAM=20
> nowadays)

Yes and he said those people wanting to compile the kernel purely in=20
memory (without using RAM disk for it) have issues anyway...

;-).

So no it is not that clear that you need to support both groups.=20
Certainly not by default.

Or at least not in its default configuration for some dirty page file=20
flag ;-).
