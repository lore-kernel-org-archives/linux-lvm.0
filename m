Date: Fri, 16 Apr 2004 16:35:35 -0500
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20040416163535.N863@homer.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 Release 2.00.14 / device-mapper Release 1.00.16
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com, dm-devel@redhat.com

Main LVM2 changes since the last announcement:

   Added filter for LVM2 to ignore devices that are constituents of 
   inactive md devices.  [Luca Berra]
   64-bit lseek now used.
   Improvements to the configurability of the build process.
   Installs /etc/lvm/lvm.conf if it's not there already.
   Some selinux support.
   A fix to the pre-deactivation device-in-use check.
   A fix to the mounted sysfs detection on 2.6.
   Optionally invoke lvm1 binaries if running on 2.4 without device-mapper.
 
   ftp://sources.redhat.com/pub/lvm2/LVM2.2.00.14.tgz
   http://sources.redhat.com/lvm2/

The device-mapper changes are all minor, mostly related to improving the
configurability of the build process.
There's one change to the kernel patch (driver now reports version 4.1.1):
a fix to an overflow check in the code that reports target status.

   ftp://sources.redhat.com/pub/dm/device-mapper.1.00.16.tgz
   http://sources.redhat.com/dm/

More details of changes in the WHATS_NEW files in the tarballs.

Rawhide and Fedora now join Debian in being maintained in line with 
the latest tarball releases.
 
Alasdair
-- 
agk@redhat.com
