Subject: Re: [linux-lvm] "logical volume manager already locked"
Message-Id: <20020319045416.GA8231@pawan.dyndns.org>
References: <20020318001846.2dc378a7.orkim@kc.rr.com>
    <Pine.LNX.4.44.0203181959380.603-100000@deedee>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0203181959380.603-100000@deedee>
From: Allan Wind <allanwind@attbi.com>
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
Date: Mon Mar 18 22:53:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2002-03-18 20:11:15, Kenneth J Baker wrote:
> Hi I've been using lvm on redhat 6.2 with kernel 2.4.5 for a long time.  I
> just switched to debian with kernel 2.4.18.  Everything has been working
> fine for a week or so.  Debian runs a cron job that runs lvmsadc every so
> often.  Now lvmsadc now produces the following error:
> deedee:/var# lvmsadc -v
> 	lvmsadc -- finding all volume group(s)
> 	lvmsadc -- checking for found volume groups
> 	1016499384
> 	lvmsadc -- locking logical volume manager
> 	lvmsadc -- locking logical volume manager
> 	lvmsadc -- logical volume manager already locked

lvm10 was just upgraded to 1.1rc-1, try downgrade to version
1.0.1release-1 (you probably want to hold that package for now).


/Allan
--=20
Allan M. Wind
P.O. Box 2022
Woburn, MA 01888-0022
USA

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8lsR4erJrYp1ydncRApWiAJwIbkTKhTm5ScL271yp4ZSPv6Ce6wCaA1NK
47MHQ0MzbIzhYtLKouKf52o=
=dkyt
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
