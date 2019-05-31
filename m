References: <CAJBJ56LoBQF_cqfXwKdHVqhJfRHioBN9BJCy_fiqDRW36pCPuA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <3ebc32f0-963e-9d18-baf7-03a762ec12f5@redhat.com>
Date: Fri, 31 May 2019 10:38:18 +0200
MIME-Version: 1.0
In-Reply-To: <CAJBJ56LoBQF_cqfXwKdHVqhJfRHioBN9BJCy_fiqDRW36pCPuA@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] A couple of questions on locking library
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Shawn Guo <shawn.gsc@gmail.com>, David Teigland <teigland@redhat.com>

Dne 31. 05. 19 v 9:13 Shawn Guo napsal(a):
> Hi David, Zdenek,
>=20
> Comparing to stable-2.02 branch, I noticed that there are significant
> changes around locking infrastructure on master branch.  I have a
> couple of questions regarding to these changes.
>=20
> 1. I see External Locking support was removed as part of clvmd
> removal. What's the reason for dropping External Locking support?  I'm
> asking because we are investigating the possibility to use hardware
> assisted locking for cluster, in form of External Locking extension.
>=20
> 2. It seems there have never been real support for LV (Logic Volume)
> locking.  On stable-2.02 branch, the LV locking interface is used as
> activation path instead of real locking on LV.  And on master branch,
> activation path gets separated off from locking infrastructure.  As
> the result, the LV interface is dropped completely from locking
> infrastructure.  My question is why there have never been LV locking
> support.  Is the LV locking support an invalid requirement at all?  Or
> it's just because no one cares about it enough to add the support?
>=20
> Thanks for your time, and appreciate any comment you would give here.

With stable-2.02 branch - there was always per-LV locking.
The 'state' of the LV was matching state of lock.

http://people.redhat.com/agk/talks/CLVM-UKUUG2007/

See the 'DLM =E2=80=93 Distributed Lock Manager'

The lock however was always took only for top-level LV - never for those=20
component LVs.

--

There is however believe, that users no longer use volumes with shared=20
activation (active at one time on multiple hosts) - so lvm2 is now being mo=
ved
transformed to theoretically less complex locking scheme...

Regards

Zdenek
