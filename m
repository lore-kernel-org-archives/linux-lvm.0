References: <8a3a46b57b9264039885e8e7401e9dbd@assyoma.it>
	<55D97810-92C9-4A4F-96BC-3016D458C588@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <2d496550-4609-0a26-489b-8721737c783b@redhat.com>
Date: Tue, 15 Sep 2020 22:08:13 +0200
MIME-Version: 1.0
In-Reply-To: <55D97810-92C9-4A4F-96BC-3016D458C588@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvm limitations
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
To: =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>, Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 15. 09. 20 v 21:16 Tomas Dalebj=C3=B6rk napsal(a):
> thanks for the feedback
>=20
> in previous older versions of LVM, I guess that each lv requires a minor,=
 major and these are might have limitations of how many can be addressed
>=20
> but how about LVM2?
>=20
> if I intend to have many hundred thousands of LV, would that be any issue?

Hi


If you are asking about these limits -

major number is 12bits  4096
minor number is 20bits  1048576

Since DM uses 1 single major - you are limited to ~1 million active LVs.
But I assume system would be already slowed down to unsable level
if you would ever reach 100 000 devices on a single system.
(but you will experience major system slow-down with even just 10000
active LVs...)

So as had been said - sensible/practical limit for lvm2 is around couple=20
thousands of LVs. You can use 'more' but it would be more and more painful =

experience ;)

If you would have enough time :) and massive CPU power behind -
you probably can even create VG with 1 million LVs - but the usability
of such VG would be really for long-suffering users ;)

So yes hundred thousands of LVs in a single VG would be a BIG problem,
but I don't see any useful use-case why anyone would need to manipulate
with so many device within a single VG.

And if you really need hundred thousands - you will need to write much more=
=20
efficient metadata management system...

And purely theoretically it's worth to note there is nontrivial amount of=20
kernel memory and other resources needed per single device - so to run with=
=20
million devices you would probably need some expensive hw (many TiB of RAM.=
..)
just to make the available - and then there should be some caching and=20
something to use them....

Regards

Zdenek
