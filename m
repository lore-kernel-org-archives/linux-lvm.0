From: Alasdair G Kergon <agk@uk.sistina.com>
Message-ID: <20030718173001.G31325@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM 2.0/Device-Mapper 1.0 available at ftp.sistina.com
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
Date: Fri Jul 18 11:31:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@lists.sistina.com, lvm-devel@lists.sistina.com, dm-devel@lists.sistina.com

                          *** ANNOUNCEMENT ***

         LVM 2.0/Device-Mapper 1.0 available at ftp.sistina.com
	            (for kernels 2.4.20 and 2.4.21)

Highlights
~~~~~~~~~~

o Support for online data relocation (pvmove)

o New metadata display tools with a configurable column-based output
  (pvs, vgs, lvs)

o New format for LVM metadata providing enhanced resilience

o LVM2 Tools can also use LVM1 metadata

o Conversion between LVM1 and LVM2 metadata formats to
  enable in-place migration of existing LVM1 volume groups

o New metadata backup format that is human-readable

o Configuration file for specifying which devices LVM may use, logging 
  levels and more

o Arbitrary extension of striped logical volumes (beyond LVM1 limits)

o Removal of the 256 Logical Volume limit per system (multiple dynamic
  major numbers)


The port of the snapshot and pvmove functionality to Linux 2.6 is underway
and will be available soon.


Please retrieve the tarballs for Device-Mapper and LVM using the
following URLS:

ftp://ftp.sistina.com/pub/LVM2/tools/LVM2.0-stable.tgz
ftp://ftp.sistina.com/pub/LVM2/device-mapper/device-mapper-stable.tgz


Thanks a lot for your support of LVM.

Regards,
The LVM development team
