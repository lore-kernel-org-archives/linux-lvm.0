From: =?iso-8859-1?q?Fr=E9d=E9ric=20Tronel?= <tronel@nerim.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020404210525.6FE4D40FCF@kraid.nerim.net>
Subject: [linux-lvm] Problem with vgscan at boot time
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
Date: Thu Apr  4 15:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

I'm facing the following problem.
I'm using a Debian system with a stock kernel 2.4.18 
(lvm 1.0.1-rc4 LVM module, no patch applied) +
lvm-tools 1.0.3 recompiled from source (not a debian
package).
I have my root filesystem on a first hard drive (hda) managed
by the LVM. My  disks are organised as follows:

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdc1" of VG "extractible" 
[55.89 GB / 45.89 GB free]
pvscan -- ACTIVE   PV "/dev/hda2" of VG "disk" 
[16.31 GB / 7.82 GB free]
pvscan -- ACTIVE   PV "/dev/hda4" of VG "disk"
[1.65 GB / 1.65 GB free]
pvscan -- total: 3 [73.87 GB] / in use: 3 [73.87 GB] / in no VG: 0 [0]

Everything was working perfectly, until I had a new disk (hdc).
I have created a single huge 60G partition, and I have created a
new voluume group ("extractible").

I'm using an initrd at boot time created by lvmcreate_initrd.
In the linuxrc script, there is a line calling vgscan.
If I do NOT comment it, it fails with the following message:

If I comment it, it still fails but with this new message:

Any idea ?
