Date: Sun, 20 Jun 2004 15:49:40 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20040620144940.GS6302@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 Release 2.00.17 / dm Release 1.00.18
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

   ftp://sources.redhat.com/pub/lvm2/LVM2.2.00.17.tgz
   http://sources.redhat.com/lvm2/

      pvs -a to list filtered devices
      vgcfgbackup -f template
      Version of fsadm for testing (disabled by default - might have bugs)
      read-only GFS pool support
      lvm2create_initrd
      additional kernel driver checks before pvmove/snapshot creation
      Assorted minor fixes/enhancements.

   ftp://sources.redhat.com/pub/dm/device-mapper.1.00.18.tgz
   http://sources.redhat.com/dm/

      dmsetup -c for column-based output
      Support for test target message-passing ioctl
 
More details of changes in the WHATS_NEW files.
 
Alasdair
-- 
agk@redhat.com
