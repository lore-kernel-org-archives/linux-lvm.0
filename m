Message-ID: <3C1F07D1.9020008@promofinarsa.es>
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Implementation questions
References: <25E4CA13D679FF48BC30769420220971467A2C@nd1-clusa.local.bunnings.com.au>
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
Date: Tue Dec 18 03:07:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Hi, Colin:

Colin Coe wrote:

> Hi all
>=20
> I need to set up a bunch of Linux machines of approximately the following
> specs:
> - PII 400
> - 2 x 20GB HDD
> - 256 MB  RAM
> - RedHat 7.2
>=20
> What I want is to use software raid (mirroring) and LVM.  How do I do this
> from scratch?  I have looked but can't find a howto on this.  I have
> attempted to do this but have run into several problems:
> - During RH7.2 install you can choose to install to /dev/md but not LVM
> - Once you have installed the OS there is no (easy/intuitive) way to get =
the
> LVM in place
>=20
> As I have about 130 of these to do, I am toying with the idea of installi=
ng
> a cut-down Linux system with XFS, LAM, md and ramdisk support and making a
> bootable CD-ROM which I can then use to configure the system how I want i=
t.
>=20


As you're talking about a farly respectable number of boxes, the=20
automated idea seems reasonable.  I would have a look at the LUI project=20
from IBM and/or even a physical disk replicator: the first option will=20
be better with maintenance in mind, while the second one will be much=20
faster.  Anyway, the problem about how to proficiently install 130 boxes=20
is orthogonal with the LVM one.

As you say, you can set and install RH7.2 on top an md device, and no,=20
RH7.2 installer has no support for LVM so, again due to the high number=20
of boxes, I would try to go with something like this:
1/ Try to copy the install CDs to a hard disk (that is to a non=20
read-only device).  Look for the RH7.2 install config list to reduce the=20
number of packages for the "minimal" installation to a real bare=20
minimum.  With this you should be able to reduce the amount of space=20
requiered to something below 80/120MB over an md device.
2/ Install the system to a single root partition.  Most probably you=20
don't want swap space neither under RAID nor LVM, so that partition will=20
be created too.  It migth suppouse something like a 150MB root partition=20
(for the whole install) and a 2*RAM swap partition, both as primaries.
3/ Have a newer kernel and patch as needed with LVM, and proper tools
4/ Make the LVM devices on top md mirroring as needed.  Then you should=20
decide if you want root on LVM too or not (probably is easier not to=20
have / on top of LVM, but that's your decision)
5/ Complete your installation, delete/actualize/add packages as needed,=20
and move data to LVM controlled partitions (/usr, /var...)
6/ Mirror this "base" disk, running at the end of the process a=20
"cleaning" script (even if you can manage your installation's net=20
options through DHCP at least FQDN for that boxes should be fixed)
7/ Test and retest your procedures until you're glad with them
8/ Add to your process the way to remote maintain/actualize those boxes
9/ Polish the documentation you have been putting together till now and=20
publish it somewhere as GPL so others can take advantage of your effort.

--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
