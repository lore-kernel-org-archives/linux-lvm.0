From: "Mark H. Wood" <mwood@IUPUI.Edu>
Message-ID: <Pine.LNX.4.55.0309300932270.593@mhw.ULib.IUPUI.Edu>
MIME-Version: 1.0
Subject: [linux-lvm] How to transit from Linux 2.4 to 2.6 with LVM in play?
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
Date: Tue Sep 30 09:41:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Okay, I must be missing something obvious, but...how do I get from kernel
2.4.19 to 2.6.0-testX without breaking LVM along the way?  The LVM1 tools,
when run at 2.6 startup, fail after tripping a kernel message that module
lvm_mod couldn't be found (which is sensible, since 2.6 has no such module
that I can find).  The LVM2 tools don't want to run on 2.4 because the
LVM1 driver is present.  So I have no tools that will run in both
environments, meaning there's no way back if I don't like 2.6, and no way
to try out LVM2 beforehand.  What have I failed to see?

- -- 
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
MS Windows *is* user-friendly, but only for certain values of "user".
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: pgpenvelope 2.10.2 - http://pgpenvelope.sourceforge.net/

iD8DBQE/eZW0s/NR4JuTKG8RAgibAJ40SmQMs+pX8gYSioWexGFQfY7hhwCfXIxq
N9A6ujRZR1sgOjsvp04DXlY=
=MckD
-----END PGP SIGNATURE-----
