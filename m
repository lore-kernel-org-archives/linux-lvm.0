Message-Id: <3C62423D.1000308@promofinarsa.es>
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
References: <3YZU4ZCA1Z2YG72C3276A7F0MLTRF0.3c619374@kadzuki>
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
Date: Thu Feb  7 03:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Hi, Anders:

Anders Widman wrote:

> Well, have you ever heard of diskcabbinettes? I use them alot wich means =
I don't have to have 10 disks in the same coputer at the same time. Then wh=
at, hot swap? Well this is very much possible, and secure=20
> (look at Promise.com).
>=20
> IDE disk drives are very cheap and fast enough (Maxtor 160GB has a write =
performance of about 35MB/s in average) for most purposes and does not requ=
ire special hardware or software.
>=20


Well... let's consider all aspects.  I'm a sysadmin the kind of BOFH, so=20
late in the evening I usually find myself a bit overloaded on beer.=20
Specially on friday, if I have to stay at work past 5PM I have the=20
irresistible temptation to go to the closet and piss*1 on the diskcabbinet.

Guess what?  when I do so *all* our backup media (your IDE disks) goes=20
nuts at a time.

For a backup policy you *must* take appart the media from the on-line=20
data to be protected.  Having all your backup media in a single place is=20
*BAAAAAAAD* idea (TM).

Now, start moving from the cabinet to the in-place closet your disks one=20
day and another, and to the off-site closet at least once a month, and=20
tell me you won't need to replace your disks on a shorter basis than=20
your DTLs or DDSs.

*1: Standard dramatization in place.  I *don't* do that (specilly true=20
if my boss is reading this article X^D  )
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
