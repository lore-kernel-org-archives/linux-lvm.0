From: Stephan Austermuehle <au@hcsd.de>
Subject: Re: [linux-lvm] Max storage size per system
Message-ID: <20030307142049.GB21686@hcsd.de>
References: <20030305195052.GC11043@hcsd.de> <20030307013431.GB6942@auctionwatch.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline
In-Reply-To: <20030307013431.GB6942@auctionwatch.com>
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
Date: Sun Mar  9 16:59:03 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2003 at 05:34:31PM -0800, Petro wrote:

> Hey man, don't pull any punches, tell us how you *Really* feel.=20

Well, iSCSI was developed and pushed by some networking guys with
Ethernet in mind to get into the storage market without developing know
how for a really efficient data link. So iSCSI has to handle lots of
overhead: SCSI commands are encapsulated in IP, IP is encapuslated in
Ethernet. This leads to bad performance (latency, throughput) compared
to a Fibre Channel connection with the same link speed. Maybe the
performance impact will become negligible with 10G or 100G Ethernet but
at the moment we don't have these technologies available.

Stephan

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+aKrB+QMu5be4tHkRAhdSAKDVGvz/UmBTFUAuwwzpIdCRUNyqPwCgukXC
FzGjb2w1J9HVI84z+siCZow=
=BJbZ
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
