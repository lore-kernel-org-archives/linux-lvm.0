From: Jason Smith <jhs@openenterprise.biz>
References: <F117BHa3ney2KMH9Nev0003882b@hotmail.com>
In-Reply-To: <F117BHa3ney2KMH9Nev0003882b@hotmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200302180743.00560.jhs@openenterprise.biz>
Subject: [linux-lvm] Re: Sharing LVM's via NFS on Redhat 8.0 Part2 - SAMBA?
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
Date: Mon Feb 17 19:21:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tuesday 18 February 2003 07:31 am, DJ TweeQ wrote:
> If it is ok/proven that sharing LV's via NFS is possible (without data
> corruption)...can they also be shared via SAMBA without data corruption?
> And has anyone done this without any issues?, and if so are there any
> special tricks required? :)

I don't know what you mean exactly by "sharing LVs," but you may want to lo=
ok=20
into either network block devices (nbd or enbd) or iSCSI for that task. =20
Presumably, they work with LVM block devices.

=2D --=20
Jason Smith
Open Enterprise Systems
Bangkok, Thailand
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+UYGUm5qEoSbpT3kRAtgQAKCekVp1E5dZ0hh+lG7IQ6EfeIqXwQCeNmkp
Snz+xq0QYq82JYUh7ssS9R4=3D
=3DLjm6
=2D----END PGP SIGNATURE-----
