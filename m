From: Jason Smith <jhs@openenterprise.biz>
References: <200302100952.31217.jhs@openenterprise.biz>
In-Reply-To: <200302100952.31217.jhs@openenterprise.biz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200302101331.31008.jhs@openenterprise.biz>
Subject: [linux-lvm] SOLVED: almost-full snapshots
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
Date: Mon Feb 10 00:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Monday 10 February 2003 09:52 am, Jason Smith wrote:
> Hi.  The LVM2 man page for lvcreate says that I should lvextend it in the
> case that it runs out of storage.  Is there a way to detect if that is
> about to happen?  lvdisplay just shows me it's total allocated PEs.

Sorry, that was my ignorance.  I just upgraded to LVM2.1.95.15 (beta 6.3) a=
nd=20
it's right there in lvdisplay.

=2D --=20
Jason Smith
Open Enterprise Systems
Bangkok, Thailand
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+R0dAm5qEoSbpT3kRAk9pAJ9EKpyDSmrUQGhmtJWPK9GE0ImMJwCgncbv
JRR1t7uwim/4+CZdHDY/lcY=3D
=3DnHGd
=2D----END PGP SIGNATURE-----
