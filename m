Return-Path: <jmoser@erc.wisc.edu>
From: "John Moser" <jmoser@erc.wisc.edu>
Date: Fri, 11 May 2001 06:45:36 -0500
Message-ID: <MPEBLKGAGHMJAPMMNPGGAEAJCAAA.jmoser@erc.wisc.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM vgscan problems
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

After having a bit of success with LVM under Linux (kernel 2.4, LVM version
0.9) over the past couple of months, I've encountered this problem on a
reboot of my LVM-enabled machine:

root@computer:/etc# vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- found inactive volume group "test "
vgscan -- reading data of volume group "test" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "test" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
"/etc/lvmtab" and "/etc/lvmtab.d"

Does anyone know how to fix this?  Or what might cause it?
There's critical data on the filesystem, and I'd like to get it back up and
running asap.

Thanks,
John Moser
