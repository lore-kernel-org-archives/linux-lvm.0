Message-Id: <200201051914.g05JER030894@mail1.bas-net.by>
From: "Andrei V. Darashenka" <home@ns2.bas-net.by>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] bug or feature request
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
Date: Sat Jan  5 13:12:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello!
I use LVM in many places and very common problem is 
rejecting to find volumes on several devices which is attached after booting.
(properly, rejecting to add to the dir_cache becouse scan_partitions finds 
some devices and scan_devs even not called!)

Please change this behaviour becouse I need to patch LVM every time I need to 
use such devices (loop, md).

- -- 

Andrei.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8N1DtNJ8kL/cM9QkRAnjdAJ48oy03yLddabI3LtiizL9aVOVAbgCgmmAU
dDgteJk0SA4V9+aQBKyHMWQ=
=GnbG
-----END PGP SIGNATURE-----
