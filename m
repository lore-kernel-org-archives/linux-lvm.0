From: Frank Lenaerts <frank.lenaerts@advalvas.be>
Message-Id: <20020306203532.GA622@human.galaxy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline
Subject: [linux-lvm] LVM/RAID again
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
Date: Wed Mar  6 14:35:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I've been reading several LVM/RAID postings on this mailinglist to
find out if someone else is also having the same question as I have,
but this does not seem to be the case; I hope this is the right place
to ask this.

As LVM does not provide RAID1 (etc.) as VXVM does with its plexes, I
wanted to use LVM on top of the standard Linux metadevices
(RAID1). However, I wanted to do this for a cluster system using a
shared SCSI bus. I am aware of the fact that ownership of disks is
important, while something like LVM actually tries to abstract this
away, but I want to use LVM to be able to extend the filesystem, to
take snapshot backups etc.. The problem I currently face however, is
the fact that both nodes autodetect the metadevices and start syncing
the mirrors, independently of each other (I do not have the LVM and
cluster software installed on these machines yet). The synchronization
however, is initiated by the raidstart command, that is true (it is
not the detection itself which does this), but I wonder how I should
solve this problem. Below, some ideas that come to my mind:

- do not use LVM at all, just use the physical disks instead

- have two separate raidtab files where each of them is only "owned"
  by a single node (to prevent syncing problems) and only start the
  raid for a certain metadevice when a logical volume is imported on a
  node

What do you think about this?

--=20
frank.lenaerts@advalvas.be

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8hn2UuSr0q5/7NwcRArLeAJ96S2MDOPdvHy4d8dkInJjIv7p7UwCfWrJz
kvzM568PI+yIHNTpZCemrfQ=
=NMfZ
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
