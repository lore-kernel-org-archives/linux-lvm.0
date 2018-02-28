References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
	<6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
	<3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
	<0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
	<51faeb921acf634609b61bff5fd269d4@xenhideout.nl>
	<4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
	<bd9a12f33412163e9c65b4a9b78eeb4f@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <6dd3a268-8a86-31dd-7a0b-dd08fdefdd55@redhat.com>
Date: Wed, 28 Feb 2018 10:26:44 +0100
MIME-Version: 1.0
In-Reply-To: <bd9a12f33412163e9c65b4a9b78eeb4f@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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

Dne 27.2.2018 v 19:39 Xen napsal(a):
> Zdenek Kabelac schreef op 24-04-2017 23:59:
>=20
>>>> I'm just currious -=EF=BF=BD what the you think will happen when you h=
ave
>>>> root_LV as thin LV and thin pool runs out of space - so 'root_LV'
>>>> is replaced with 'error' target.
>>>
>>> Why do you suppose Root LV is on thin?
>>>
>>> Why not just stick to the common scenario when thin is used for extra=20
>>> volumes or data?
>>>
>>> I mean to say that you are raising an exceptional situation as an argum=
ent=20
>>> against something that I would consider quite common, which doesn't qui=
te=20
>>> work that way: you can't prove that most people would not want somethin=
g by=20
>>> raising something most people wouldn't use.
>>>
>>> I mean to say let's just look at the most common denominator here.
>>>
>>> Root LV on thin is not that.
>>
>> Well then you might be surprised - there are user using exactly this.
>=20
> I am sorry, this is a long time ago.
>=20
> I was concerned with thin full behaviour and I guess I was concerned with=
=20
> being able to limit thin snapshot sizes.
>=20
> I said that application failure was acceptable, but system failure not.

Hi

I'll probably repeat my self again, but thin provision can't be responsible=
=20
for all kernel failures. There is no way DM team can fix all the related pa=
ths=20
on this road.

If you don't plan to help resolving those issue - there is not point in=20
complaining over and over again - we are already well aware of this issues.=
..

Admin needs to be aware of 'pros & cons'  and have to use thin technology a=
t=20
the right place for the right task.

If the admin can't stand failing system, he can't use thin-p.

Overprovisioning on DEVICE level simply IS NOT equivalent to full filesyste=
m=20
like you would like to see all the time here and you've been already many=20
times explained that filesystems are simply not there ready - fixes are on =

going but it will take its time and it's really pointless to exercise this =
on=20
2-3 year old kernels...

Thin provisioning has it's use case and it expects admin is well aware of=20
possible problems.

If you are aiming for a magic box working always right - stay away from thi=
n-p=20
- the best advice....

> Even if root is on thin and you are using it for snapshotting, it would b=
e=20
> extremely unwise to overprovision such a thing or to depend on "additiona=
l=20
> space" being added by the admin; root filesystems are not meant to be exp=
andable.

Do NOT take thin snapshot of your root filesystem so you will avoid thin-po=
ol=20
overprovisioning problem.

> True enough, but if you risk filling your pool because you don't have ful=
l=20
> room for a full snapshot, that would be extremely unwise. I'm also not su=
re=20
> write performance for a single snapshot is very much different between th=
in=20
> and non-thin?

Rule #1:

Thin-pool was never targeted for 'regular' usage of full thin-pool.
Full thin-pool is serious ERROR condition with bad/ill effects on systems.
Thin-pool was designed to 'delay/postpone' real space usage - aka you can u=
se=20
more 'virtual' space with the promise you deliver real storage later.

So if you have different goals - like having some kind of full equivalency =

logic to full filesystem - you need to write different target....


> I simply cannot reconcile an attitude that thin-full-risk is acceptable a=
nd=20
> the admin's job while at the same time advocating it for root filesystems.

Do NOT use thin-provinioning - as it's not meeting your requirements.

> Now most of this thread I was under the impression that "SYSTEM HANGS" wh=
ere=20
> the norm because that's the only thing I ever experienced (kernel 3.x and=
=20
> kernel 4.4 back then), however you said that this was fixed in later kern=
els.

Big news -  we are at ~4.16 kernel upstream - so noone is really taking muc=
h=20
care about 4.4 troubles here - sorry about that....

Speaking of 4.4 - I'd generally advice to jump to higher versions of kernel=
=20
ASAP - since  4.4 has some known bad behavior in the case thin-pool 'metada=
ta'=20
get overfilled.


>> lvm2 is cooking some better boot support atm....
>=20
> Grub-probe couldn't find the root volume so I had to maintain my own grub=
.cfg.

There is on going 'BOOM' project - check it out please....


>> There should not be any hanging..
>=20
> Right well Debian Jessie and Ubuntu Xenial just experienced that.

There is not much point in commenting support for some old distros other th=
en=20
you really should try harder with your distro maintainers....

>>> That's irrelevant; if the thin pool is full you need to mitigate it,=20
>>> rebooting won't help with that.
>>
>> well it's really admins task to solve the problem after panic call.
>> (adding new space).
>=20
> That's a lot easier if your root filesystem doesn't lock up.

- this is not really a fault of dm thin-provisioning kernel part.
- on going fixes to file systems are being pushed upstream (for years).
- fixes will not appear in years old kernels as such patches are usually=20
invasive so unless you use pay someone to do the backporting job the easies=
t=20
way forward is to user newer improved kernel..

> When my root snapshot fills up and gets dropped, I lose my undo history, =
but=20
> at least my root filesystem won't lock up.

lvm2 fully support these snapshots as well as thin-snapshots.
Admin has to choose 'the best fit'

ATM  thin-pool can't deliver equivalent logic - just like old-snaps can't=20
deliver thin-pool logic.

> However, I don't have the space for a full copy of every filesystem, so i=
f I=20
> snapshot, I will automatically overprovision.

Back to rule #1 - thin-p is about 'delaying' deliverance of real space.
If you already have plan to never deliver promised space - you need to live=
=20
with consequences....


> My snapshots are indeed meant for backups (of data volumes) ---- not for =

> rollback ----- and for rollback ----- but only for the root filesystem.

There is more fundamental problem here:

!SNAPSHOTS ARE NOT BACKUPS!

This is the key problem with your thinking here (unfortunately you are not =

'alone' with this thinking)


> With sufficient monitoring I guess that is not much of an issue.

We do provide quite good 'scripting' support for this case - but again if
the system can't crash - you can't use thin-pool for your root LV or you ca=
n't=20
use over-provisioning.


> My problem was system hangs, but my question was about limiting snapshot =
size=20
> on thin.

Well your problem primarily is usage of too old system....

Sorry to say this - but if you insist to stick with old system - ask your=20
distro maintainers to do all the backporting work for you - this is nothing=
=20
lvm2 can help with...


Regards

Zdenek
