From: Stephan Austermuehle <au@hcsd.de>
Subject: Re: [linux-lvm] Max storage size per system
Message-ID: <20030306171539.GA16219@hcsd.de>
References: <20030304114851.GA22965@hcsd.de> <3E64B885.1AF49EDA@silicide.dk> <20030304144121.GB23975@hcsd.de> <4857903125.20030305160532@tnonline.net> <20030305194551.GA11043@hcsd.de> <20030306162150.GA11451@gw.silicide.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <20030306162150.GA11451@gw.silicide.dk>
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
Date: Fri Mar  7 08:01:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 06, 2003 at 05:21:50PM +0100, jon+lvm@silicide.dk wrote:

> hmm, that would need 130T/0.146T = 890 disks. And running raid 5...

Please have a look at the following links. A single HDS Lightning
(aka HP XP 1024) can address up to 1,024 disks.

	http://www.hp.com/products1/storage/products/disk_arrays/highend/xp1024/index.html

	http://www.hds.com/products/systems/9900v/

> personaly i dont like raid5, because if you loose more than one disk
> your data are gone, and with this ammount of disks, i expect failure
> rather often. (it's proberly not one big raid5 array, but that just
> makes it need more disks).

I prefer RAID 1 (or RAID 10), too, but sometimes one has to use RAID 5.
A common strategy is to put a higher number of hot spare drives in one
system. Another (somewhat newer) strategy is to use two rotating parity
drives per RAID set.

Stephan

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+Z4I7+QMu5be4tHkRAhWMAKDZMbKXTU2Bjw8chNTw0W32Os+cwACgy1Fw
v3i1VZRDEO6c5Xqp9Z+QhpQ=
=drLu
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
