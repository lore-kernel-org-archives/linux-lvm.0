Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1C7f3i26347
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 02:41:03 -0500
Received: from mailhost.uni-koblenz.de (mailhost.uni-koblenz.de [141.26.64.1])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1C7f2b27203
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 02:41:03 -0500
From: Rainer Krienke <krienke@uni-koblenz.de>
Subject: Re: [linux-lvm] SuSE 9.0 and LVM2
References: <402AAB52.7010405@sympatico.ca>
In-Reply-To: <402AAB52.7010405@sympatico.ca>
MIME-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_K4yKAyc+JxfFLGi";
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200402120840.59051.krienke@uni-koblenz.de>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 09:10:04 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com, Avtar Gill <av_gill@sympatico.ca>, linux-lvm@sistina.com

--Boundary-02=_K4yKAyc+JxfFLGi
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

On Mittwoch, 11. Februar 2004 23:23, Avtar Gill wrote:
> This is a general question to anyone out there currently using
> LVM2 with SuSE Professional 9.0 on production servers (or
> workstations). Would you be kind enough to share your experiences
> with the rest of us? Did you experience any minor or major issues
> along the way? SuSE 9.0 ships with LVM 1.* by default but I thought
> it might be a good idea to implement new servers with LVM 2.*
> instead so upgrading to future versions of SuSE (with kernel 2.6)
> will be less of a hassle. Any thoughts or comments?
>

We are running LVM2 on a suse8.2 system using the suse9.0 kernel (2.4.21-16=
6). =20
The lvm2 utilities (version 2.2.00.05) are in this case not taken from suse=
=20
RPMs. I compiled them myself. The system (actualy 3 hosts with a total of ~=
3=20
Hardware  RAIDs, configured with raid level 5) is a NFS and SMB fileserver=
=20
with a total of 3 TBytes storage. Actually the RAIDs offer a total of  ~6 T=
B=20
but we do mirroring so we can only use have of the real size.=20

LVM sits on top of a md device hierachy: The hardware RAIDs are connected b=
y=20
fibrechannel using 2 seperate paths from each raid array to each host acros=
s=20
2 fc switches. So each host has first two multipath md devices and on top o=
f=20
this it has a raid1 md device (mirror) that performs mirroring across the=20
raids so that even if one complete RAID should fail nothing serious will=20
happen. This redundency already proved quite useful since we can take one=20
hardware RAID out of order eg for a firmware upgrade we had to do lately=20
without stopping the servers in doing their job.=20

The md mirror each hosts sees is used as physical volume for LVM. Here LVM2=
=20
proved very useful since it allowed me to configure the (md) devices LVM=20
should scan for volumes when starting. I first tried using LVM1 in this=20
system, but this failed since LVM1 was confused since during scanning the=20
disks it saw the volumegroup and the volumes several times (probably due to=
=20
the multipath and mirroring md devices pointing to the same data) and this=
=20
lead to a complete loss of the logical volumes with all the data inside.

The filesystem in use on the local volumes is xfs.=20

The system is running about 6 months now, and we did not have any trouble w=
ith=20
it.

Have a nice day
Rainer
=2D-=20
=2D------------------------------------------------------------------------=
=2D-
Rainer Krienke, Universitaet Koblenz, Rechenzentrum, Raum A022
Universitaetsstrasse 1, 56070 Koblenz, Tel: +49 261287 -1312, Fax: -1001312
Mail: krienke@uni-koblenz.de, Web: http://www.uni-koblenz.de/~krienke
Get my public PGP key: http://www.uni-koblenz.de/~krienke/mypgp.html
=2D------------------------------------------------------------------------=
=2D-

--Boundary-02=_K4yKAyc+JxfFLGi
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAKy4Kaldtjc/KDEoRAje0AJ9YSpCsNHFgpZELQS2Y6Jyig7Aj8wCgz905
TPTb5RYao/YYG24Tb31QPRY=
=6M1C
-----END PGP SIGNATURE-----

--Boundary-02=_K4yKAyc+JxfFLGi--
