From: Jason Smith <jhs@openenterprise.biz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200302251751.19856.jhs@openenterprise.biz>
Subject: [linux-lvm] RAID5 + LVM stillborn
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
Date: Tue Feb 25 05:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi.  I have a quick RAID 5 question.  Sort of a repost, but I can't get an=
=20
answer.

May I assume that LVM does not support RAID 5 due to the serialization=20
problems?  Theoretically, 2.6 will have a fix but this has already been a=20
problem for over two years.  And if 2.6 develops like 2.4 did, then we shou=
ld=20
not use it for production for many months after its release.

Thus it looks like people will not be able to deploy these types of Linux f=
ile=20
servers for some time hence -- a terrible thought.

=46or example, testing with LVM2 and DM from CVS, I made one snapshot under=
=20
light network load and it brought my machine to a complete stop, then oopse=
d=20
it.  I'm glad to help if any developers are interested.

Thanks.

=2D --=20
Jason Smith
Open Enterprise Systems
Bangkok, Thailand
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+W0qnm5qEoSbpT3kRAt7NAJ0W+h0Mjy1hblBj6c9XcLKxv97QUQCcDkEP
vvSxFIrFLctlnj9gZ7tnYWQ=3D
=3DEaAI
=2D----END PGP SIGNATURE-----
