From: Rainer Krienke <krienke@uni-koblenz.de>
Subject: Re: [linux-lvm] Devices seen twice - how does LVM handle ?
References: <20030910114840.13991.qmail@web42002.mail.yahoo.com> <E19x4eC-0008Oa-VB@server2.hostpoint.ch> <20030910132010.GC10632@percy.comedia.it>
In-Reply-To: <20030910132010.GC10632@percy.comedia.it>
MIME-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_ulyX/28YTkaroiP";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200309101538.54429.krienke@uni-koblenz.de>
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
Date: Wed Sep 10 11:58:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Boundary-02=_ulyX/28YTkaroiP
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

On Mittwoch, 10. September 2003 15:20, Luca Berra wrote:
> On Wed, Sep 10, 2003 at 03:04:25PM +0200, Markus Baertschi wrote:
> >For reasons too complicate to explain here our SAN configuration is
> >broken. The effect is that linux sees the san disks twice. The originally
> >
> >However, does LVM handles this situation (disks visible twice) nicely ?
>
> does not seem broken to me if you have two hba.
> lvm does not support multipath
>
> >or should I continue to use my workaround (pull a fiber) to make sure
> >the disks are visible only once ?
>
> it is not a nice workaround.
>
> >- Are there risks of corruption ?
>
> i don't think so.
>
> >- What happens if the path the LVM happens to use breaks, but the other
> >is still up. Will LVM handle fail-over ?
>
> lvm does not support multipath

It did not follow this discussion right from the start, so I might have mis=
sed=20
something...

We are running 3 fileservers with raid devices attached by fibrechannel. Si=
nce=20
each divice can be reached by 2 seperate io paths we are using a multipath=
=20
setup based on the md interface (on top of the multipath md devices we=20
finally run a software mirror (raid1)). This works just fine for our server=
s=20
(running suse8.2) .  At the beginning we also had trouble with lvm1 since i=
t=20
was able to see the volume on different levels of abstraction: lvm scanned=
=20
the real disks, it also scanned the md multipath metadevice and this probab=
ly=20
led to the bad behaviour that whenever creating new logical volumes the=20
complete configuration was invalid and so all data lost.=20

We then changed to lvm2 since it has the ability to specify which devices t=
o=20
scan for lvm metadata and since then everything works fine. =20

Rainer
=2D-=20
=2D------------------------------------------------------------------------=
=2D-
Rainer Krienke, Universitaet Koblenz, Rechenzentrum
Universitaetsstrasse 1, 56070 Koblenz, Tel: +49 261287 -1312, Fax: -1001312
Mail: krienke@uni-koblenz.de, Web: http://www.uni-koblenz.de/~krienke
Get my public PGP key: http://www.uni-koblenz.de/~krienke/mypgp.html
=2D------------------------------------------------------------------------=
=2D-

--Boundary-02=_ulyX/28YTkaroiP
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/Xylualdtjc/KDEoRAtL8AKC08IIVCsYYZoWDnHbOQsVke9zJOACg2A3F
5EsQgJ8kZsfSC4XnRBDUkPM=
=wA2Q
-----END PGP SIGNATURE-----

--Boundary-02=_ulyX/28YTkaroiP--
