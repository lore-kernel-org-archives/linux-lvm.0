From: Jeroen Baten <jeroen@i2rs.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200208221116.26702.jeroen@i2rs.nl>
Subject: [linux-lvm] writing book, having LVM question
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
Date: Thu Aug 22 04:18:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-LVM@sistina.com

Hello,

I got this name from the kernel maintainers file. I hope someone can help me.
If so, please email me directly.

While writing an LPI level 2 book I stumbled acros 2 issues. 
Can you respond on the following info?
I use a redhaf 7.2 system for these test with 6 old scsi disks attached.
-------------------------------------------------------------------------
issue 1:

[root@redhat lvmconf]# vgcfgrestore -n lpi_vg_1  /dev/sdb1
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/lpi_vg_1.conf"
vgcfgrestore -- can't restore part of active volume group "lpi_vg_1"

[root@redhat lvmconf]# lvchange -a n /dev/lpi_vg_1/lpi_lv_1
lvchange -- logical volume "/dev/lpi_vg_1/lpi_lv_1" changed
lvchange -- doing automatic backup of volume group "lpi_vg_1"

[root@redhat lvmconf]# vgcfgrestore -n lpi_vg_1  /dev/sdb1
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/lpi_vg_1.conf"
vgcfgrestore -- can't restore part of active volume group "lpi_vg_1"

[root@redhat lvmconf]# vgchange -a n
vgchange -- volume group "lpi_vg_1" successfully deactivated

[root@redhat lvmconf]# vgcfgrestore -n lpi_vg_1  /dev/sdb1
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/lpi_vg_1.conf"
vgcfgrestore -- VGDA for "lpi_vg_1" successfully restored to physical volume 
"/dev/sdb1"

[root@redhat lvmconf]# vgchange -a y
vgchange -- volume group "lpi_vg_1" successfully activated

[root@redhat lvmconf]# lvchange -a y /dev/lpi_vg_1/lpi_lv_1
lvchange -- volume group "lpi_vg_1" is not active

[root@redhat lvmconf]# lvchange -a y /dev/lpi_vg_1/lpi_lv_1
lvchange -- volume group "lpi_vg_1" is not active

[root@redhat lvmconf]#
-----------------------------------------------------------------------------
issue 2: Other problem:

Wanting to do an vgexport and import on same system:

[root@redhat root]#  vgimport   lpi_vg_1 /dev/sdb1 /dev/sdc1
vgimport -- ERROR "pv_read(): open" reading physical volume "/dev/sdb1"

your respons will be highly appreciated.

kind regards,


  Jeroen Baten            | EMAIL :  JEROEN@I2RS.NL
 ____  _  __              | web   :  www.i2rs.nl
  |  )|_)(_               | tel   :  +31 (0)30 221 00 11
 _|_/_| \__)              | fax   :  +31 (0)30 220 31 91
           Kometenlaan 26, 3721 JT, Bilthoven
