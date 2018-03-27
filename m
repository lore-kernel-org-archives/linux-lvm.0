Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44AF4627DD
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 22:17:20 +0000 (UTC)
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B65E4E919
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 22:17:19 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id l49so393983wrl.4
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 15:17:19 -0700 (PDT)
References: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
	<229d22d1217a7fa96874df0fb6d53e0c@xenhideout.nl>
	<5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
	<CAD+pdNdPKmHb7BQfT4DUj2M+=yy1P3JYtXO4GjNRXn2QA_cwwA@mail.gmail.com>
	<5ABA4D6D020000F9000B1E44@prv-mh.provo.novell.com>
	<8d1d7152bf62372494a0aa5d2be0012c@xenhideout.nl>
	<b9f55f3f-1998-4ca8-b6ce-e0a2be6e2698@gmail.com>
	<e790670450869fed7cdbbea58708ca23@xenhideout.nl>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <0fd9ce65-75da-f685-b7d1-c5ee9eecda3a@gmail.com>
Date: Wed, 28 Mar 2018 00:17:15 +0200
MIME-Version: 1.0
In-Reply-To: <e790670450869fed7cdbbea58708ca23@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Can't work normally after attaching disk volumes
 originally in a VG on another machine
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 27.3.2018 v 12:27 Xen napsal(a):
> Zdenek Kabelac schreef op 27-03-2018 12:22:
>=20
>> IMO 'vgreduce --removemissing'=EF=BF=BD doesn't look to me like a real r=
ocket science.
>=20
> Yeah I don't wanna get into it.
>=20
> --force didn't work very well when the missing PV was a cache PV as it re=
moved=20
> the entire cached volume including the origin.


Hi

This is why users do open BZ if they would like to see some enhancement.

Normally cache is integral part of a volume - so it's partially missing -=20
whole volume is considered to be garbage.

But in 'writethrough' mode there could be likely possible better recovery.

Of course this case needs usability without --force.

So please open  RFE BZ for this case.


Regards

Zdenek
