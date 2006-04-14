Date: Fri, 14 Apr 2006 22:43:57 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20060414214357.GE4521@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 release 2.02.03 / device-mapper 1.02.04
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com, dm-devel@redhat.com

Some bug fixes and minor enhancements. (See the WHATS_NEW files.)

  ftp://sources.redhat.com/pub/dm/device-mapper.1.02.04.tgz
  ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.03.tgz

The tools should cope better now if faced with multiple distinct
VGs with the same name.  'pvs -P /dev/whatever -o+vg_uuid' output
should be reliable, and vgrename accepts a VG uuid as first
argument.

And libdevmapper has support again for older 2.6 kernels that 
can't handle mapped device referencing by device number.

Alasdair
-- 
agk@redhat.com
