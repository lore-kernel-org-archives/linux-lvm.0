From: Jason Smith <jhs@openenterprise.biz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200302181556.49358.jhs@openenterprise.biz>
Subject: [linux-lvm] dm chunk size is 512?
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
Date: Tue Feb 18 03:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I modified lvm2 to display the snapshot chunks used from device-mapper, but=
=20
it's reporting them in 512-byte units (just saw 204800 for a 100mb volume).

My question is, is this supposed to be static (it's from dm proper, not lvm=
2)=20
at that size?  Does lvcreate -s -c <size> change anything?  It would be gre=
at=20
to force the size for device-mapper snapshot volumes, since dm currently=20
thrashes a software raid 5 array during snapshots.

Thanks.

=2D --=20
Jason Smith
Open Enterprise Systems
Bangkok, Thailand
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+UfVQm5qEoSbpT3kRAt1GAKCCIyOHHHhBqzzxRLUG2NYtNFES3wCfSlCI
gXCGSPG6oavRpciyHp7GMAI=3D
=3DUOrR
=2D----END PGP SIGNATURE-----
