From: Jason Smith <jhs@openenterprise.biz>
References: <20030206.kbn.38328100@si.homelinux.org> <200302071226.49241.jhs@openenterprise.biz> <200302062156.59889.jkeating@pogolinux.com>
In-Reply-To: <200302062156.59889.jkeating@pogolinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200302071358.25966.jhs@openenterprise.biz>
Subject: [linux-lvm] Re: RAID5 bug? [was: Re: raid and lvm]
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
Date: Fri Feb  7 01:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@lists.sistina.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 07 February 2003 12:56 pm, Jesse Keating wrote:
> I have a few clients that use LVM on large hardware (3-ware) raid5 arrays=
=2E=20
> I don't think they've seen (they might not have looked) these types of
> errors when the array is in degraded mode.
>
> Does this effect only software raid?

My guess is yes.  I don't know about HW implementations, but I'm seeing it=
=20
with lvm2 on top of software raid5.

=2D --=20
Jason Smith
Open Enterprise Systems
Bangkok, Thailand
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+Q1kQm5qEoSbpT3kRAtdLAJ43Wecy0zZMwAa3rUHw+x6/0SvmEQCeNwUx
gFYMypZhMuCWt9AX5AjJehw=3D
=3DQ3My
=2D----END PGP SIGNATURE-----
