References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<5cb21c879cfff0b1916e823b85d35909@xenhideout.nl>
	<87a619a2-cefc-3b4e-a709-0906053503e9@redhat.com>
	<bd0c1d0e-172a-f6c1-039f-8724dc8d007e@assyoma.it>
	<1da2cfbb-4443-b8fa-8a61-55a8c6574db7@redhat.com>
	<1539b0efb711bf19c78a9fc509f37d42@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <38678f22-b471-8f6d-4820-a36b81a02b5b@redhat.com>
Date: Wed, 13 Sep 2017 21:17:48 +0200
MIME-Version: 1.0
In-Reply-To: <1539b0efb711bf19c78a9fc509f37d42@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 13.9.2017 v 19:41 Xen napsal(a):
> Zdenek Kabelac schreef op 12-09-2017 23:57:
>=20
>> Users interested in thin-provisioning are really mostly interested in
>> performance - especially on multicore machines with lots of fast
>> storage with high IOPS throughput=EF=BF=BD (some of them even expect it =
should
>> be at least as good as linear....)
>=20
> Why don't you hold a survey?
>=20
> And not phrase it in terms of "Would you like to sacrifice performance fo=
r=20
> more safety?"
>=20
> But please.
>=20
> Ask people:
>> Repeated again - whoever targets for 100% full thin-pool usage has
>> misunderstood purpose of thin-provisioning.....
>=20
> Again, no one "targets" for 100% full. It is just an eventuality we need =
to=20
> take care of.
>=20
> You design for failure.

Thin-pool IS designed for failure - who said it isn't ?

It has very matured protection against data corruption.

It's just not getting  overcomplicated in-kernel - solution is left for the=
=20
user-space - that's very clear design of 'dm' for decades...

> If I was a customer and I was paying your bills, you would never respond =
like=20
> this.

We are very nice to customers which pays our bills....

> We like to design in advance so we do not have to keep a constant eye out.
>=20

Please if you can show the case where the current upstream thinLV fails and=
=20
you lose your data - we can finally start to fix something.

I'm still unsure what problem you want to get resolved from pretty small gr=
oup=20
of people around dm/lvm2 - do you want from us to rework kernel page-cache ?

I'm simply still confused what kind action you expect...

Be specific with real world example.


Regards


Zdenek
