From: Wiktor Wodecki <wodecki@gmx.de>
Subject: Re: [linux-lvm] Max storage size per system
Message-ID: <20030305143938.GI1513@gmx.de>
References: <20030304114851.GA22965@hcsd.de> <3E64B885.1AF49EDA@silicide.dk> <20030304144121.GB23975@hcsd.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VSVNCtZB1QZ8vhj+"
Content-Disposition: inline
In-Reply-To: <20030304144121.GB23975@hcsd.de>
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
Date: Wed Mar  5 11:40:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--VSVNCtZB1QZ8vhj+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Mar 04, 2003 at 03:41:21PM +0100, Stephan Austermuehle wrote:
> Okay, so the LVM can manage really large disk storage. Does anybody know
> whether the number of mounted filesystem per Linux system is limited?

yes, it is limited through the kernel. There are two ways out of it:

a) increase the number (fiddle through the source, recompile, reboot)
b) use the automounter

If you don't need all filesystems mounted at once I'd suggest the second
approach. (e.g. for samba or backup store, whatever)

--=20
Regards,

Wiktor Wodecki

--VSVNCtZB1QZ8vhj+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQE+Zgwq6SNaNRgsl4MRAnRnAKC3fcuMu6oeZ8Ghlw6lGHfEc0x5yQCgo8Mb
MpZW4btNecwD+uGMlbQrZKI=
=NhkE
-----END PGP SIGNATURE-----

--VSVNCtZB1QZ8vhj+--
