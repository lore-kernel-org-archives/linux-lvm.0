Message-Id: <3C6286DC.9030204@promofinarsa.es>
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
References: <3YZU4ZCA1Z2YG72C3276A7F0MLTRF0.3c619374@kadzuki>
    <3C62423D.1000308@promofinarsa.es>
    <20020207091636.GD5188@auctionwatch.com>
    <3C625820.6040807@promofinarsa.es>
    <20020207131906.GA8259@auctionwatch.com>
Content-Transfer-Encoding: quoted-printable
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Feb  7 07:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Petro wrote:

> On Thu, Feb 07, 2002 at 11:34:08AM +0100, Jesus Manuel NAVARRO LOPEZ wrot=
e:
>=20
>>Hi, Petro:
>>Petro wrote:
>>
>>>On Thu, Feb 07, 2002 at 10:00:45AM +0100, Jesus Manuel NAVARRO LOPEZ wro=
te:
>>>
>>[...]
>>
>>>>Well... let's consider all aspects.  I'm a sysadmin the kind of BOFH, s=
o=20
>>>>late in the evening I usually find myself a bit overloaded on beer.=20
>>>>Specially on friday, if I have to stay at work past 5PM I have the=20
>>>>irresistible temptation to go to the closet and piss*1 on the=20
>>>>diskcabbinet.
>>>>
>>>   Good way to guarentee you won't have kids.=20
>>>
>>Fair enough.  I *don't* have childrens... but I tend to consider my PFY=20
>>like a bastard of my bastardness, does it counts?
>>
>    =20
>     That was intended to be humorous. Urinating on live electrical
>     components tends to be a shocking experience.
>=20


Yep.  Me too.  I neither have childs nor PFY, so it really doesn't matter.


>=20
>>>>For a backup policy you *must* take appart the media from the on-line=20
>>>>data to be protected.  Having all your backup media in a single place i=
s=20
>>>>*BAAAAAAAD* idea (TM).
>>>>
>>>   Depends on your needs.
>>>
>>Yes: depends on my needs: If I need to recover any data, having *all*
>>your backup media in a single place is *BAAAAAAAD* idea (TM).  If this=20
>>
>=20
>     No, when you need to recover stuff, it's a *great* idea to have it
>     in one place.
>=20


Well, but this is not what I said.  I purpousely bolded *all*, for=20
that's the key.  It's a great idea have *some* backups at hand and=20
grouped (if only for the chance of your boss asking you for recovering=20
that porn... err... that paper he accidentaly deleted).  But not *all*=20
your media.  Obviously is not too operative to have all my backup media=20
in Dallas (I'm in Spain so it's not cost-effective).


>     When you suffer an environmental calamity, it's a bad idea.=20
>=20
>=20
>>place is the same (or near to) the place where the production data is=20
>>stored is simply unadjectivable.
>>
>=20
>     Ever tried to push tens of gigabytes over a WAN?=20
>=20


Ever heared about "Never understimate the bandwith of a wagon full of=20
tapes"?


>=20
>>>   Depends on your needs.
>>>   I have one database that changes fast enough that if it's 36 hours
>>>   old, we're basically just recovering it for the table structures.=20
>>>
>>In case of disaster, if your backup media is in the proximities of your=20
>>production database (define "proximities" as needed) you won't be able=20
>>to recover table structures.  One thing is what I say, and a *completely =

>>different* issue is to decide *what* to backup, and how, not where.
>>
>=20
>     That wasn't my point.=20
>=20
>     My point was that for some stuff, 36 hour old data is useless, and


Then its *value* past 36 hours is... nihil.  You told (implictly) that=20
your database schema was of some value even if they were more than 36=20
hours old.


>     even a normal tape rotation schedule can put data out of reach for
>     10 or 12 hours minimum.=20
>=20


Yes, that's *potentially* true.


>=20
>>>   I've got another one that changes fast enough that it's not worth
>>>   backing up. If it's more than 2 hours old, starting from scratch is
>>>
>>So, the amount of change by unit time is your key to decide what you=20
>>*need* to backup and what you don't?
>>Sound *extremly* odd to me.  I would say it should be *the value* of the =

>>material (this include the cost to recreate it anew too, obviously), not =

>>its change rate.
>>
>=20
>     Not the necessity of backing up, but the cost. If the data is
>     changing that fast, it could easily be that by the time it's on
>     tape, it's out of date and effectively useless.=20
>=20


Again: it's not its change rate but its *value*.  The more it values,=20
the more you can expense to "insure" it (part of your insurance policy=20
talks about *within a time frame*).


>=20
>>>   It the first case, off site backups don't make sense, so we have 2
>>>   backup hosts (seperated by about 10 feet currently, less in a day or
>>>   two) that get backups on an alternating (daily) basis.=20
>>>
>>They won't make sense deppending on its *cost*, not its change rate.
>>
>=20
>     No, it would be a lot cheaper to dump the dbs to tape, and carry the
>     tapes offsite, but (1) recovery time is almost tripled, and (2)=20
> =20


...and its *value* once recovered will be lower than having no data at=20
all.  Again, *if* you manage to find a method so the value of the=20
recovered data is higher than the costs of having that method in place,=20
your job (if that's your job, of course) is point it out and implement it.


>=20
>     And yes, we know the problems with this. It's a calculated risk. We
>     can't afford geographically seperated facilities right now.=20
>=20


*Value* again.  And about it, I recently knew about a multinational=20
company (so it were not only a one-site company) which main office was=20
at the twin towers.  It would be able to restore from the people death=20
(though *many* of upper management died) but it didn't from the=20
data/facilities loss.


>=20
>>>   Again, your backup strategy depends on your needs, your budget, and
>>>   your risk tolerance.


It only deppends on your needs.  Your needs can include not surpassing=20
certain budget amount, but definetly it hasn't nothing to do with "risk=20
tolerance".  "Risk tolerance" is either a winner bet or a misinformation=20
issue.

=20
>>>   It doesn't make sense to spend $10k for a backup solution for $20k of
>>>   data. It does make sense to spend $10k to backup $100k. =20
>>>


Plainly true... except for the last value: it makes sense to spend $X at=20
most to backup $Y*p, where p is the probability of loosing that data=20
(ie. if the probability is 1, so you're certain to loss the data, you=20
can expend up to $100k to insure it -within the time frame that data=20
produces $100k revenues).


>>Of course.  Your backup strategy surely deppends... *on the data value*=20
>>and only on this.  From the very beginning I stated that for "home data" =

>>
>=20
>     No, it doesn't. It depend on several things:
>=20
>     (1) Value of data.


Plain data value

=20
>     (2) Cost of downtime.


Data value too (in terms of lost revenue for the time the data is not=20
accesible).

=20
>     (3) Rate of change. (If your data set is completely worthless after
>     24 hours, but worth several million for the first hour, offsite
>     backups don't necessarily make sense etc.)=20
>=20


Data value too (in terms on how the value of data evolutions with time).


>     And probably some more I haven't thought of.=20
>=20


Probably: and they all will be expresable in terms of data value or will=20
have no significance at all.
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
