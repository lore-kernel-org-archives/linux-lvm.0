Message-Id: <3C6012B0.5000409@promofinarsa.es>
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: [lvm-devel] [ANNOUNCE] LVM reimplementationre
    ady for beta testing
References: <Pine.LNX.4.10.10202051326310.19683-100000@pzat.meep.org>
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
Date: Tue Feb  5 11:13:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Hi, James:

James Hawtin wrote:

>=20
> On Fri, 1 Feb 2002, Heinz J . Mauelshagen wrote:
>=20
>=20
>>It is quite intersting how many people don't take backups even though
>>almost everybody claims to know that backups are crucial and some of them
>>know that they are still, even though they might have RAID in place.
>>
>>
>=20
> I think the reason most people don't do backups is because, hard disk
> drives are really big and really cheap. Tape drives are really expensive,
> media is also expensive and frankly tapes are very small for the cost.
> Effective backup can double the cost of a system and requires time to
> manage it.
>=20


Yes.  That's true... as you say, for grandma's PC.  Backups (and all the=20
other disaster/recovery plans) are defensive, so they *must* be=20
cost-effective solutions.  *If* you really don't care loosing a week's=20
data or even all the data, and with low probability you just can go with=20
hard-drive backups or even without backups at all... if you *really*=20
know that there's not *if* you're going to loose data, but *when*, and=20
accept it.


> For the "home" market its just to much. The only system just about


It is too much *work*, not money: five to twelve zip "disks" (100/250MB=20
each) is usually more than enough for incremental backups.  Well planned=20
you don't need full backups... you don't need full backups for programs=20
you already have in another media (like your programs' original CD's)=20
you don't need backups for cold-storable data (six month old MP3 you=20
just listen from time to time) you just burn a CD from time to time...=20
at the end only personal data is *needed* to be backuped and this is=20
*usually* able to fit on one/two zips.  The problem is the time and the=20
savvyness to plan it (in advance).  The same goes with any other=20
insurance system: for most people you just insurance if you're legally=20
enforced, or it's the "common" way (like the health care insurance in USA).

...But the other guy was talking about a *professional* environment.


> affordable is DAT tape, DLT blanks are about double the cost for the
> storage ammount. I bought a DDS4 drive for "home" use, 1 week after I got
> it I had my laptop stolen, so it justified its cost pretty fast :-) A 60
> gig hard disk, costing 100 pounds requires 2-3 DSS4 tapes to backup At 15
> pounds each, one round of backups cost 1/3 of the cost of the disk
> multiply that by the number of disks, add in the hassle factor of changing
> tapes. Auto changers are nice, but alot more! For "PC" based systems the
> backup costs are oftain higher than the price of the machine, and thats
> hard for people to justify.
>=20


Hard drives are *not* cheaper.  Indeed they're more expensive by far!!!
You seem to consider that a single copy on the same system can be=20
considered a backup, but it is not:
*If you don't have incrementals for a variable amount of time you have=20
just crap
*If your backup media is around the system to be protected you just have=20
crap

So, for HDDs to be a *real* backup solution, you need as many HDDs as=20
you would have tapes (say 10 to 20) so you can have, let's say, daily=20
incrementals, placed in-house, weekly "bigs" somehow "near", and monthly=20
off-site.  Now, tapes are cheaper than disks, so if you need to have the=20
same amount (more or less) disks will be more expensive... and,=20
remember, that, while statically-placed disks are more confiable than=20
tapes, that's not true as soon as you start moving them here and there.=20
  Obviously you can go with PCMCIA disks, but they're *a lot* more=20
expensive.


> If anyone suggests they use "hard drives" to back up I will scream, cost
> that system just don't scale, and yup you have an old copy but do people
> ever update it? Yes... when they get another hard drive... however before
> that happens they have put the old on back into service because they
> needed a little more space ;-)
>=20


This is true too.


> All in all, backup is expensive/slow, my sister/mom/dad ain't going to pay
> that kind of money for home... For Work its slow, fine if your a sysadmin


They're expensive *by definition* (just in the same way any other=20
insurance is: it doesn't *produce* anything).  Anyway, probably your=20
mom's life doesn't deppend on data on her home PC, so it's fine going=20
with no backup at all, or burning a CD from time to time.


> and that your job... If you are a sysadmin you probably don't get to do
> bugets, your manager does, and they don't understand the cost and aways
> want to cut corners to keep costs down, XXX is a "developement" system so
> we don't need to back it up cos its not "production" etc etc. Store all
> your data on the network file server, (which is aways full with p0rn) and
> connected via a doggie network, taping 3 minutes to access the smallest
> file, so people store data on the local machine, and forget to copy it
> back to the network...
>=20


Truly enough: idiocy doesn't pay.


> This why people don't have backups in my book.
>=20


And I'm with you.

--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
