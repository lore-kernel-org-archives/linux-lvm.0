From: Chad Walstrom <chewie@wookimus.net>
Subject: Re: [linux-lvm] Error compilng tools on RH7.3
Message-Id: <20020426215017.GB19569@wookimus.net>
References: <43D959D3-58FC-11D6-9EF4-000393452E7E@jvm.de>
    <20020426153434.A21305@sistina.com>
    <20020426162737.A26542@omnifarious.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <20020426162737.A26542@omnifarious.org>
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
Date: Fri Apr 26 16:52:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2002 at 03:34:34PM +0200, Heinz J . Mauelshagen wrote:
> you need to pick a vanialla kernel 2.4.18 source and patch the LVM
> driver in.  We don't support RH prepatched kernels.

On Fri, Apr 26, 2002 at 04:27:37PM -0500, Eric M. Hopper wrote:
> That answer is quite off-putting, and makes me seriously consider
> whether or not I want to use LVM on my RH systems.

That is not a bad consideration to make, honestly.  Wait until the RH
experts on the list have ported the the LVM changes to their heavily
patched kernels.  For good reason, Red Hat kernels go through some
extensive customization for the benefit of the paying customer.  LVM and
Sistina can't very well keep up with all of the incompatibilities that
this eclectic set of patches may introduce to the vanilla kernel.

IMHO, Heinz made a perfectly reasonable and logical statement about the
LVM Team's development policy.  RH developers are responsible for
"keeping up with the Jones'", not Sistina.

I run a vanilla kernel w/o any patches and LVM performs just fine for my
needs.

--=20
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8ycuYDMcLGCBsWv0RAu5dAJ93dox3atjomVmMYA8QHYkHV0SpAgCcD/ww
HEV+n/cCCHUjxGWK0L5VCZQ=
=jUeW
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
