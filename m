From: Dan Merillat <dmerillat@sequiam.com>
Message-ID: <20031209014026.GA2906@chaos.ao.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
Subject: [linux-lvm] preventing snapshots from running out of room.
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
Date: Tue Dec  9 08:12:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In the project I'm working on, snapshots as backups are more critical
then the "live" data.  What I'd like is the original volume to get write
errors if I run out of snapshot room (with the corresponding printk
causing my log-watcher to lvextend the snapshot and re-activate the
original)  Obviously, this would be a panic situation.  But the reasons
for this are many:  If I'm doing something really dangerous on my
database, I'd shutdown or quiesce it, snapshot, and activate it again.
Do the dangerous merge, and drop the snapshot if everything worked out.

If I miscalculate how much disk space would be needed, what could happen
is I screwup the master, AND the snapshot breaks.  I'd much rather the
master was stuck in disk-wait waiting for a free COW block.

I have not yet looked into LVM2/device-mapper, so if it handles this
situation I'll just upgrade to that instead.

P.S.: I know you can always allocate as much snapshot space as the
original, but when you're talking about a 250gig filesystem it's not
always possible to have a spare quarter terr on the same machine.

--Dan

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----

iD8DBQE/1SgKkycScExRgsgRAn+zAJsEeWdqWMgftMSmj8EqF3F20y/CcgCfXI2k
BHRExxZMaD/pox1IOp2YtxQ=
=4J5i
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
