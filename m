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
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <1da2cfbb-4443-b8fa-8a61-55a8c6574db7@redhat.com>
Date: Tue, 12 Sep 2017 23:57:01 +0200
MIME-Version: 1.0
In-Reply-To: <bd0c1d0e-172a-f6c1-039f-8724dc8d007e@assyoma.it>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>, Xen <list@xenhideout.nl>

Dne 12.9.2017 v 19:14 Gionatan Danti napsal(a):
> On 12/09/2017 16:37, Zdenek Kabelac wrote:
>> ZFS with zpolls with thin with thinpools running directly on top of devi=
ce.
>>
>> If zpools - are 'equally' fast as thins=EF=BF=BD - and gives you better =
protection,
>> and more sane logic the why is still anyone using thins???
>>
>> I'd really love to see some benchmarks....
>>
>> Of course if you slow down speed of thin-pool and add way more=20
>> synchronization points and consume 10x more memory :) you can get better=
=20
>> behavior in those exceptional cases which are only hit by unexperienced =

>> users who tends to intentionally use thin-pools in incorrect way.....
>=20
> Having benchmarked them, I can reply :)
>=20
> ZFS/ZVOLs surely are slower than thinp, full stop.
> However, they are not *massively* slower.

Users interested in thin-provisioning are really mostly interested in=20
performance - especially on multicore machines with lots of fast storage wi=
th=20
high IOPS throughput  (some of them even expect it should be at least as go=
od=20
as linear....)

So ATM it's preferred to have more complex 'corner-case' which really mostl=
y=20
never happens when thin-pool is operated properly and the remaining use cas=
e=20
you don't pay higher price for having all data always in sync and also you =
get=20
way lower memory foot-print
(I think especially ZFS is well known for nontrivial memory resource consum=
ption)

As has been pointed already few times in this thread - lots of those
'reserved space' ideas can be already easily handled by just more advanced =

scripting around notification from dmeventd - if you will keep thinking for=
 a=20
while you will at some point see the reasoning.

There is no difference if you start to solve problem around 70% fullness th=
en
100%  - the main difference is - with some 'free-space' in thin-pool you ca=
n=20
resolve problem way more easily and correctly.

Repeated again - whoever targets for 100% full thin-pool usage has=20
misunderstood purpose of thin-provisioning.....

Regards

Zdenek
