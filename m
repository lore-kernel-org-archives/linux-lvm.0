References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<f3a53c24-1f91-e5f5-e7e1-091b886da44a@redhat.com>
	<f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
	<e282b0b3-e373-c454-8243-3b09c23dd2a1@izyk.ru>
	<8a27504b-1b3a-7126-7ade-18f57b819ead@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <3e8184ac-4357-3b97-ac3c-d1133606f103@assyoma.it>
Date: Wed, 23 Oct 2019 16:40:01 +0200
MIME-Version: 1.0
In-Reply-To: <8a27504b-1b3a-7126-7ade-18f57b819ead@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, Ilia Zykov <mail@izyk.ru>

On 23/10/19 15:05, Zdenek Kabelac wrote:
> Yep - we are recommending to disable zeroing as soon as chunksize >512K.
>=20
> But for 'security' reason the option it's up to users to select what=20
> fits the needs in the best way - there is no=EF=BF=BD 'one solution fits =
them=20
> all' in this case.

Sure, but again: if writing a block larger than the underlying chunk,=20
zeroing can (and should) skipped. Yet I seem to remember that the new=20
block is zeroed in any case, even if it is going to be rewritten entirely.

Do I remember wrongly?

--=20
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
