From: Stefan.Kroner@arcor.net
Message-ID: <41256BCE.00527B79.00@ffm-hq-gtw01.Arcor.net>
Mime-Version: 1.0
Subject: [linux-lvm] Probs with LVM and CCISS
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
Date: Tue Jun  4 09:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,
i try to pvcreate a PV from an Partition on an Compaq Smart Array (Raid-Level
1). But i get the following error message:

What is going wrong?

pvcreate -vd /dev/cciss/c0d0p11
pvcreate
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
pvcreate -- locking logical volume manager
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
pvcreate -- checking physical volume name "/dev/cciss/c0d0p11"
<1> pv_check_name -- CALLED with "/dev/cciss/c0d0p11"
<22> lvm_check_chars -- CALLED with name: "/dev/cciss/c0d0p11"
<22> lvm_check_chars -- LEAVING with ret: 0
<22> lvm_check_dev -- CALLED
<22> lvm_check_dev -- LEAVING with ret: 0
<1> pv_check_name -- LEAVING with ret: -226
pvcreate -- invalid physical volume name "/dev/cciss/c0d0p11"
pvcreate [-d|--debug] [-f[f]|--force [--force]] [-h|--help] [-y|--yes]
        [-v|--verbose] [-V|--version] PhysicalVolume [PhysicalVolume...]

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0

Here is the fdisk from the cciss:

# fdisk -ul /dev/cciss/c0d0

Disk /dev/cciss/c0d0: 255 heads, 32 sectors, 4358 cylinders
Units = sectors of 1 * 512 bytes

           Device Boot    Start       End    Blocks   Id  System
/dev/cciss/c0d0p1   *        32    106079     53024   83  Linux
/dev/cciss/c0d0p2        106080   4300319   2097120   82  Linux swap
/dev/cciss/c0d0p3       4300320   8494559   2097120   83  Linux
/dev/cciss/c0d0p4       8494560  35561279  13533360    f  Win95 Ext'd (LBA)
/dev/cciss/c0d0p5       8494592   9514559    509984   83  Linux
/dev/cciss/c0d0p6       9514592  10534559    509984   83  Linux
/dev/cciss/c0d0p7      10534592  11252639    359024   83  Linux
/dev/cciss/c0d0p8      11252672  11774879    261104   83  Linux
/dev/cciss/c0d0p9      11774912  12297119    261104   83  Linux
/dev/cciss/c0d0p10     12297152  12819359    261104   83  Linux
/dev/cciss/c0d0p11     12819392  13847519    514064   8e  Linux LVM

Regards
Stefan
