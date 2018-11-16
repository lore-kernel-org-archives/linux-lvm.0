References: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
	<20181115175718.GE5291@agk-dp.fab.redhat.com>
	<2a7f4f1fc1a54fd6eca7d7bc9a6249ae@cs.uni-dortmund.de>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <ede72436-8c3c-aca9-e865-5525f9d74f0a@gmail.com>
Date: Fri, 16 Nov 2018 16:32:17 +0100
MIME-Version: 1.0
In-Reply-To: <2a7f4f1fc1a54fd6eca7d7bc9a6249ae@cs.uni-dortmund.de>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvcreate from a setuid-root binary
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
Cc: Alasdair G Kergon <agk@redhat.com>

Dne 16. 11. 18 v 14:43 Christoph Pleger napsal(a):
> Hello,
>=20
>> Let's stop there.=EF=BF=BD The fact you're asking a question about setuid
>> suggests you don't understand enough to be able to use it safely.
>=20
> I get security by checking the real user id at the beginning of the progr=
am=20
> and aborting the program if that uid does not belong to the only user who=
 is=20
> allowed to run the program. That user is me and I guess that it is much m=
ore=20
> insecure to run the whole service that wants to authenticate users throug=
h PAM=20
> as root.

How do you plan to 'authorize' passed command line options ??

lvm2 is designed to be always executed with root privileges - so it's belie=
ved=20
admin knows how he can destroy his own system.

It is NOT designed/supposed to be used as suid binary - this would give use=
r a=20
way to big power to very easily destroy your filesystem and gain root=20
privileges (i.e.by overwriting  /etc/passwd file)

So I'd highly recommend to avoid this path - unless you have total control =

over the users.

>=20
>> Go back to the beginning and describe the original problem you are
>> trying to solve and the constraints you have and ask for advice about
>> ways to achieve it.
>=20
> The beginning is that I want to create a user-specific logical volume whe=
n a=20
> user logs in to a service that authenticates its users through pam and th=
at=20
> does not run as root.


You should probably consider some 'master & client' logic - where master ru=
ns=20
'allowed' rules translated to lvm2 commands internally on your server  - an=
d=20
client just issues  some 'high-level' commands.

Regards

Zdenek

PS: there are some plans to support this over dBus - but no so much active =

dBus development is going on ATM on lvm2 side....
