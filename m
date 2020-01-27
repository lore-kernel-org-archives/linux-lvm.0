Received: from [10.40.204.29] (ovpn-204-29.brq.redhat.com [10.40.204.29])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9996F86E0E
	for <linux-lvm@redhat.com>; Mon, 27 Jan 2020 18:29:30 +0000 (UTC)
References: <31a152c7-6497-aaee-2fe9-996f3a522ed5@meduniwien.ac.at>
	<alpine.LRH.2.21.2001271135130.25220@mail.gathman.org>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <e712c3a8-fec8-c70c-9ac9-e41e380e2463@redhat.com>
Date: Mon, 27 Jan 2020 19:29:30 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.2001271135130.25220@mail.gathman.org>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] pvmove --abort
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 27. 01. 20 v 17:38 Stuart D Gathman napsal(a):
> On Mon, 27 Jan 2020, Matthias Leopold wrote:
>=20
>> I consciously used "pvmove --abort" for the first time now and I'm=20
>> astonished it doesn't behave like described in the man page. No matter i=
f=20
>> I've used "--atomic" for the original command, when I interrupt the proc=
ess=20
>> with "pvmove --abort" lvm always completely rolls back my copy operation=
. I=20
>> would expect that if I don't use "--atomic" then "--abort" will result i=
n=20
>> "segments that have been moved will remain on the destination PV, while =

>> unmoved segments will remain on the source PV" (from man page). Am I mis=
sing=20
>> something?
>=20
> I'm not an LVM guru, but I think I got this one!=EF=BF=BD pvmove effectiv=
ely
> creates a mirror on the destination, and begins syncing the mirror.
> Any writes to the LV go to *both* the source and destination.
> When you abort, it simply discards the partially synced mirror.
> When the sync is complete, it discards the source leg of the mirror
> instead.
>


Yep - lvm2 does not look at mirrored percentage to estimate and recalculate
'probably' moved portion of some LVs to other 'devices'.

Either full mirror is 'completed' or the whole 'mirroring' is simply discar=
ded.

Option --atomic is then about having finished ALL mirrors - aka whole thing=
 is=20
either finished or canceled.

Unfortunately resolving some sort of 'partial' abort (aka keep 'mirrored'=20
data) is pretty complex task and such operation is so infrequently used tha=
t=20
I'm not expecting implantation any time soon if ever...


Zdenek
