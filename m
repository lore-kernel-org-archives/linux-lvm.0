From: Mike Williams <mike@gaima.co.uk>
Subject: Re: [linux-lvm] inconsistent metadata
References: <200310092100.11002.mike@gaima.co.uk> <20031010194212.J6588@uk.sistina.com>
In-Reply-To: <20031010194212.J6588@uk.sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Message-Id: <200310111215.53927.mike@gaima.co.uk>
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
Date: Sat Oct 11 06:17:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 10 October 2003 19:42, Alasdair G Kergon wrote:

> You can look at the metadata history in /etc/lvm/archive to try to
> work out the sequence of events and at what point things started
> going wrong.  [If you'd like me to take a look, send me a tarball
> of /etc/lvm.]

OK, I've look through the archive files and can't really see anything odd, =
but=20
I'm no expert.
I will send /etc/lvm to you separately, any help you could offer will be=20
gratefully received.

> Filters in the config file can be used to hide the 2 devices that say
> they're exported while you rename the real VG.

Excuse my ignorance, but I don't understand :)
I assume this is a reference to the 2 PV's which pvscan is saying are expor=
ted=20
in a VG, while the other 2 don't?

=2D --=20
Mike Williams
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/h+ZpInuLMrk7bIwRAk4YAJwJV/hIEksCzvcScYtbCVmUVGiwdACggMbF
ope9x3trhJLux4XpQNdA7WA=3D
=3DNuZ8
=2D----END PGP SIGNATURE-----
