Message-ID: <001201c29528$9b174860$0464a8c0@vbsnt>
From: "Van Boxtel Software BV" <info@van-boxtel-software.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgchange with lvm_snapshot_fill_COW_page failed
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
Date: Tue Nov 26 02:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

When we changed the physical position of the harddrives we were able to
mount the existing volumegroup.

When we rechanged these drives to the original position and tried to
activate the volume group with vhchange -a y we got the following error:


vgchange -ay
vgchange -- ERROR "Bad address" activating volume group "lvmgroup1"
.
vm -- _pv_get_number failed for rdev = 65535
lvm -- lvm_snapshot_fill_COW_page failed

(I tried:
lvscan -D
vgscan
vgchange -a y)

Do you have any suggestions?

Regards,
Jeffrey (jvhout@van-boxtel-sftware.nl)
