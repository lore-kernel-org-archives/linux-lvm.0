Date: Wed, 31 Mar 2004 14:41:30 -0600
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20040331144130.S17377@homer.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 Release 2.00.09 / device-mapper Release 1.00.09
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

I have generated new tarballs from today's CVS.

Main LVM2 changes since the last release:

  Use sysfs to speed up device filtering with 2.6 kernels.
  Add basic infrastructure for internationalisation.
  Various build process tidy-ups and fixes.
  Option to compile tools into library form.
  Add LVM1-style colon output to vgdisplay.
  Fix vgmknodes to remove dud /dev/mapper entries. [needs libdevmapper 1.00.09]
  Add lvchange --refresh to reload active LVs.
  Fix LVM1-format lvreduce PV extent calculation.
  Add support for tagging PV/VG/LVs and hosts.
  Update docs to reflect move to sources.redhat.com.

  ftp://sources.redhat.com/pub/lvm2/LVM2.2.00.09.tgz
  http://sources.redhat.com/lvm2/

Main device-mapper changes:

  Support for DM_LIST_VERSIONS ('dmsetup targets') with 2.4 kernels.
  Move mknodes support from dmsetup to libdevmapper so LVM2 can use it.
  Generated patches against 2.4.26-rc1.

  ftp://sources.redhat.com/pub/dm/device-mapper.1.00.09.tgz
  http://sources.redhat.com/dm/


Alasdair
-- 
agk@redhat.com
