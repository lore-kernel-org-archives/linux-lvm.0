Message-Id: <3C625388.2010502@promofinarsa.es>
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
References: <Pine.LNX.4.44.0202061338480.13203-100000@dragon.inside.ntisys.com>
    <3C6187A0.3DFEA8BE@lmco.com> <3C6242D0.3090005@promofinarsa.es>
    <20020207091719.GE5188@auctionwatch.com>
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
Date: Thu Feb  7 04:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Hi, Petro:

Petro wrote:

> On Thu, Feb 07, 2002 at 10:03:12AM +0100, Jesus Manuel NAVARRO LOPEZ wrot=
e:
>=20
>>That's plainly untrue: AMANDA for one is free and very good for small=20
>>systems.
>>
>=20
>     Define "small".=20

I'm succesfully using it for 4 servers with two DDS drivers, and I would sa=
y it could be easy expandible to the numbers of tens.

It have some "caveats" anyway.  Rigth now it can't manage multivolume=20
quite efficiently (a single dump must go to single storage device, for=20
instance, and the multichanger specifications is a bit... "raw".=20
Management for automatic tape cabinets is out of the system too.  It=20
uses an rsh-like client/server protocol to remote access systems so it's=20
not soo secure -while it can be ssh-tunneled -not out-of-the-box.  It=20
doesn't support multiserial backups on a single config -but you can have=20
multiple definitions so off-site monthly backups don't interfere with=20
your monday-to-friday daily series, for instance).  What it does pretty=20
well is automatically balance the backup levels for all your partitions=20
to optimize tape space and indexing your tapes (both semi-automatically=20
indexing tapes and maintain the index about what was where... it can=20
even help you the physical tape-labels, so you just print what amanda=20
tells you to, and have some -primitive, ability to create graphic logs=20
to help you planning capacity in advance).  It will e-mail you too if=20
you forget to put the tape in the drive too.
Appart from this, it uses underlying backup tools (dump by default, tar=20
or smbtar if you choose it) so you can restore even without amanda=20
software present (while it's more difficult: you just don't have a tape=20
labelled like "first-monday-of-the-month-so-level0-backups-here", but=20
only something like "Comm-dpt-tape-no12": if you loose your indexes you=20
will have to look at the labels for the dumps to guess what's in-there.=20
  Anyway, those indexes are simple text files so they're easy to copy to=20
another box in advance, and they're sent day-to-day by e-mail to the=20
backup operator, so you do have options to avoid that situation).
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
