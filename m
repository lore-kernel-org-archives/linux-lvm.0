Return-Path: <cduffy@mvista.com>
Date: Sat, 13 Jan 2001 13:19:50 -0800
From: Charles Duffy <cduffy@mvista.com>
Subject: Re: [linux-lvm] LVM 0.9.1beta1 vgscan segfault when run with -d
Message-ID: <20010113131950.A974@mvista.com>
References: <20010112223600.A846@mvista.com> <20010113121143.I21587@srv.t-online.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Content-Disposition: inline
In-Reply-To: <20010113121143.I21587@srv.t-online.de>; from Heinz.Mauelshagen@t-online.de on Sat, Jan 13, 2001 at 12:11:43PM +0000
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

--bKyqfOwhbdpXa4YI
Content-Type: multipart/mixed; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

No, I am not using devfs.

Yes, I ran 'vgscan -d'. Indeed, I meant to attach the associated log
(unless it was stripped by the list software). I'll try again.

Also, I misreported the version number. It was 0.9.1beta1 under which
this occured.

On Sat, Jan 13, 2001 at 12:11:43PM +0000, Heinz J. Mauelshagen wrote:
>=20
> Charles, is this under devfs?
> Side remark: you probably run "vgscan -d", right?
>=20
> Didn't get the attachement, sorry. Send it again please.
>=20
> On Fri, Jan 12, 2001 at 10:36:00PM -0800, Charles Duffy wrote:
> > Howdy. I'm experiencing some difficulties while transitioning from LVM
> > 0.8i to 0.9.
> >=20
> > vgscan reports:
> >=20
> > vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV": can't
> > get data of volume group "vg01" from physical volume(s)
> >=20
> > When I try to recieve more info (by running vgscan with "-D"), I
> > recieve a segfault.
> >=20
> > This appears to be happening inside pv_read_uuidlist, at the memset on
> > line 91 (I added some extra debug() calls to determine this). The
> > attached log (from the original, unpatched version) should help by
> > giving some context.
> >=20
> > Frankly, I don't know why this is happening -- more than sufficient
> > space appears to be allocated beforehand -- but, as long as one rules
> > out a bug in debug(), I don't see any other way 'round it.
> >=20
> > Thanks for your help.

--DKU6Jbt7q3WqK7+M
Content-Type: application/x-bzip2
Content-Disposition: attachment; filename="lvmlog.bz2"
Content-Transfer-Encoding: base64

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

--DKU6Jbt7q3WqK7+M--

--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6YMZ2r/O29KUQmJURAhuKAJ44ooGGXFjmQqEnmPChERfbJItC4wCdFmI2
l41mEpFt60aotI+s5ttCs4o=
=Qap4
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--
