From: Jason Smith <jhs@openenterprise.biz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200303112228.39201.jhs@openenterprise.biz>
Subject: [linux-lvm] Long-term snapshots possible?
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
Date: Tue Mar 11 09:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi.  Like many others, I'm interested in using LVM2 as a componet for a=20
Linux-based file server.

When needed, I had hoped to sacrifice disk space for long-term filesystem=20
snapshots, by creating multiple snapshots and rotating them out on=20
perhaps a weekly basis.  The intent is to emulate the convenience and=20
power of similar snapshot features in commercial file servers.

My problem is, this does not currently look possible without a severe=20
performance hit.  If a volume has, for example, five active snapshots,=20
then the deltas seem to get written five times, once per snapshot volume.

Alternatively, I could use meta-snapshots, but they are not currently=20
implemented, and that idea sounds klugy.

So then do the LVM developers and users recommend against multiple=20
concurrent snapshots of a volume?  Should I keep hope for this great=20
feature, only found in commercial file servers?

Thanks for any input.

=2D --=20
Jason Smith
Open Enterprise Systems
Bangkok, Thailand
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+bgCmm5qEoSbpT3kRAjxRAJ9TNBPYJdAkMjfrW+vZdbGcsKXXiwCgmzCD
=46wlwesFuyYHYE1dsFIbmAv0=3D
=3D1opb
=2D----END PGP SIGNATURE-----
