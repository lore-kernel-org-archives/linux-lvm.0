From: Jason Smith <jhs@openenterprise.biz>
References: <20030128.rVq.68055000@dl380.home.network> <1043789186.2100.4.camel@chtephan.cs.pocnet.net>
In-Reply-To: <1043789186.2100.4.camel@chtephan.cs.pocnet.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200302061637.56572.jhs@openenterprise.biz>
Subject: [linux-lvm] RAID5 bug? [was: Re: raid and lvm]
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
Date: Thu Feb  6 03:40:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@lists.sistina.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wednesday 29 January 2003 04:26 am, Christophe Saout wrote:
> At the moment neither LVM1 nor DM (LVM2) can provide redundancy. But you
> can use LVM on top of the software raid5 driver in linux. I don't think
> there is another way at the moment.

Hi.  What is the best current answer to the canonical LVM plus software RAI=
D5=20
issue?  FYI, I'm talking about how the kernel's cache needs to correspond t=
o=20
the width of i/o requests.  When LVM controls a RAID5 PV, it will cause man=
y=20
differently-sized i/o requests to hit the array in parallel, basically=20
forcing the kernel to flush the cache and rebuild continuously.  So,=20
basically my array performs horribly once I create a snapshot volume.

I'm using LVM2.1.95.10 + 2.4.20-dm-7.

Some older LKML traffic explains the problem, but I haven't found an answer=
=20
yet.

Thanks much.

=2D --=20
Jason Smith
Open Enterprise Systems
Bangkok, Thailand
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+Qizym5qEoSbpT3kRAhKwAKCubNE0VqXCqtdnlRDowuUlLWeWGQCcDjan
ZxpF2yaJud/9JM2fnTg23kQ=3D
=3DYCls
=2D----END PGP SIGNATURE-----
