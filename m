From: FEJF <fejf@gmx.de>
Date: Thu, 6 Sep 2001 17:28:04 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E15f13v-0003bs-00@hermes.sistina.com>
Subject: [linux-lvm] pv_move_pe() error again :/
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

hi,
i search through the mailing list and found this question few times... and i 
have also this problem atm and i didn't find a solution, i want to ask if 
there is one now ? or perhaps will installing of lvm1.0.1-rc2 help (currently 
using 0.9.1_beta7) ?

root@bolm:[/x] # pvmove /dev/hdh1
pvmove -- moving physical extents in active volume group "vg01"
pvmove -- WARNING: if you lose power during the move you may need to restore 
your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- ERROR reading input physical volume "/dev/hdh1" (still 65536 bytes 
to read)

pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe

pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents

mfg, Florian E.J. Fruth

- -- 
Backups are usefull. Most often when you don't have one ;)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7l5YE7Xtp66ctWuIRAvbXAJwPE9rdTBmtIz/stPOxlPIXS5PbwwCfQx41
oCGlQD5AHCV0S9v/UDfog9o=
=KYdJ
-----END PGP SIGNATURE-----
