From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Message-Id: <20020219205054.A3751@sistina.com>
MIME-Version: 1.0
Subject: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.0.3 available at www.sistina.com
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
Date: Tue Feb 19 13:54:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

*** ANNOUNCEMENT *** LVM 1.0.3 available at www.sistina.com

Hi all,

LVM 1.0.3 supports both version 1 and 2 of the metadata.

There's *no* need to run any metadata update tools.

A tarball is available now at

   <http://www.sistina.com/>

for download (Follow the "LVM 1.0" link).


Changes to LVM 1.0.2 include:

o vgcfgrestore supports restores to different sized physical volumes;
  useful in cases where a replacement disk is a little bit to large or
  for test purposes; option enhancements; physical volume UUID restore fix

o vgchange removes failed snapshots and activates the volume group rather
  than failing on it. Optionally forces device number changes in cases
  where it finds clashes so that the volume group can be activated

o vgexport exports volume groups not showing up in /etc/lvmtab*

o vgscan can drop all snapshots or those in a particular volume group now

o "pvmove -i" ignores read errors while moving and supports moves in
  inactive volume groups

o > 1 TB fixes for physical and logical volumes (2 TB limitation
  on 2.4 persists)

o more...


See the CHANGELOG file contained in the tarball for further information.

Feed back LVM related information to <linux-lvm@sistina.com>.

Thanks a lot for your support of LVM.
