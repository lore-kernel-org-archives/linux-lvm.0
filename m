Return-Path: <zoo1@corecomm.net>
Date: Thu, 22 Mar 2001 07:19:50 -0500
From: zoo1@corecomm.net
Subject: Re: [linux-lvm] Apparent performance degradation for each PV with striping
Message-ID: <20010322071950.A21329@bar.nowhere>
References: <01C0B04F.5EFB3400.smdenton@bellsouth.net> <3AB60D44.3036CD9C@wrkhors.com> <0103220954110L.00851@lyta>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
In-Reply-To: <0103220954110L.00851@lyta>; from bofh@coker.com.au on Thu, Mar 22, 2001 at 09:54:11AM +0100
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2001 at 09:54:11AM +0100, Russell Coker wrote:

>What is a K400?

possibly he means a HP PA-RISC 9000 K4xx class machine, but i can't
speak for him.

the K-class is now quite old; i don't think there was anything industry
standard or nonproprietary in them other than their SCSI busses, unless
you count the network interfaces or the serial ports - they used HP
proprietary bus architectures throughout. their CPUs are something to be
seen; imagine a 10cm-by-12cm circuitboard surrounded by about 10 kg of
sheet-metal copper plate acting as a heatsink. clock speed? up to about
200 MHz, IIRC. i've no idea what their bus throughput might be. if they
use a crossbar, possibly high, but i just don't know if they do.

>Every test that I run shows SPARC machines running slower than desktop=20
>machines with IA32 CPUs.  My Athlon-800 machine has more memory bandwidth=
=20
>than an E450 according to the industry standard "streams" benchmark and=20
>according to a little memory benchmark I wrote. =20

try benchmarking the E450's bus. load it with a full complement of disk
backplanes and two or three gigabit ethernets and stress test that; see
if you can find any IA32 machine to even come close. Sun has never had
fast CPU's, but they're I/O speed demons, always have been.

>Also a single IBM 46G ATA=20
>drive in my Athlon outperforms A1000 arrays in E450 class hardware.

couldn't speak about those, i've no experience with the A1000. for
serious storage, you'd naturally use 10K RPM drives in RAID
configurations, and i'd be extremely surprised if the bus you connect
the drives up with had more impact than the rotational speed and seek
time; unless you're bottlenecking the bus, in which case you've made a
design error there.

--=20
   PGP/GnuPG key (ID 1024D/BFE0D6D0) available from keyservers everywhere

       "Everything I am today, I owe to people whom it is now too late
                                   to punish."

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6ue3mNfZCE7/g1tARAkSlAJ9fXQq5WxyLq2HKPqkApyEjgbYeNgCfXYjC
szTEporLHMVjkNKlzO3zTLw=
=AB8P
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
