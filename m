Message-Id: <3C625820.6040807@promofinarsa.es>
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
References: <3YZU4ZCA1Z2YG72C3276A7F0MLTRF0.3c619374@kadzuki>
    <3C62423D.1000308@promofinarsa.es>
    <20020207091636.GD5188@auctionwatch.com>
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
Date: Thu Feb  7 04:34:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Hi, Petro:

Petro wrote:

> On Thu, Feb 07, 2002 at 10:00:45AM +0100, Jesus Manuel NAVARRO LOPEZ wrot=
e:


[...]

>>Well... let's consider all aspects.  I'm a sysadmin the kind of BOFH, so =

>>late in the evening I usually find myself a bit overloaded on beer.=20
>>Specially on friday, if I have to stay at work past 5PM I have the=20
>>irresistible temptation to go to the closet and piss*1 on the diskcabbine=
t.
>>
>=20
>     Good way to guarentee you won't have kids.=20
>


Fair enough.  I *don't* have childrens... but I tend to consider my PFY=20
like a bastard of my bastardness, does it counts?

    =20
>=20
>>For a backup policy you *must* take appart the media from the on-line=20
>>data to be protected.  Having all your backup media in a single place is =

>>*BAAAAAAAD* idea (TM).


>=20
>     Depends on your needs.


Yes: depends on my needs: If I need to recover any data, having *all*
your backup media in a single place is *BAAAAAAAD* idea (TM).  If this=20
place is the same (or near to) the place where the production data is=20
stored is simply unadjectivable.
If I don't need to recover data, I can go without any backup at all.


>     Depends on your needs.
>     Depends on your needs.
>     Depends on your needs.
>     Depends on your needs.
>     Depends on your needs.
>     Depends on your needs.
>     Depends on your needs.
>     Depends on your needs.
>     Depends on your needs.
>     Depends on your needs.
>     Depends on your needs.
>     Depends on your needs.
>     Depends on your needs.
>=20
>     I have one database that changes fast enough that if it's 36 hours
>     old, we're basically just recovering it for the table structures.=20
>=20


In case of disaster, if your backup media is in the proximities of your=20
production database (define "proximities" as needed) you won't be able=20
to recover table structures.  One thing is what I say, and a *completely=20
different* issue is to decide *what* to backup, and how, not where.


>     I've got another one that changes fast enough that it's not worth
>     backing up. If it's more than 2 hours old, starting from scratch is
>     fine.=20
>=20


So, the amount of change by unit time is your key to decide what you=20
*need* to backup and what you don't?
Sound *extremly* odd to me.  I would say it should be *the value* of the=20
material (this include the cost to recreate it anew too, obviously), not=20
its change rate.


>     It the first case, off site backups don't make sense, so we have 2
>     backup hosts (seperated by about 10 feet currently, less in a day or
>     two) that get backups on an alternating (daily) basis.=20
>=20


They won't make sense deppending on its *cost*, not its change rate.


>     Oh, this is in addition to these databases being replicated pairs.=20
>=20


This doesn't add nothing to value your backup strategy.  Again the value=20
is the key.  You have replicated in pairs, do you?  What then in case of=20
fire on you operations center?  I'd bet you'll loose both of your servers.


>     Again, your backup strategy depends on your needs, your budget, and
>     your risk tolerance.=20
>
>     It doesn't make sense to spend $10k for a backup solution for $20k of
>     data. It does make sense to spend $10k to backup $100k. =20
>=20


Of course.  Your backup strategy surely deppends... *on the data value*=20
and only on this.  From the very beginning I stated that for "home data"=20
just burning some CDs from time to time, or no backup at all can be good=20
enough (but again, even burning some CDs has no sense in case you=20
want/need your data even if your "PC-room" burns out, if you have your=20
CDs on the same table the PC is).


>=20
>>*1: Standard dramatization in place.  I *don't* do that (specilly true=20
>>if my boss is reading this article X^D  )
>>
>=20
>     No, but a handful of metal filings are (1) more effective, (2) less
>     traceble, and (3) less likely to get your pecker arced off.=20
=20

Yep.  But I don't find it quite as funny

--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
