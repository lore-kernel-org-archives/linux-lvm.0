From: "Justin Hamilton" <JHamilton@Earthling.Net>
Subject: [linux-lvm] Ut-Oh! - I need MAJOR help.
Date: Tue, 19 Sep 2000 01:17:18 -0400
Message-ID: <NDBBKIEANAMHBNPAILKPEEODCMAA.JHamilton@Earthling.Net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

Just had my machine lock up after CPU Fan failure.  Anyway, after repairs, a
reboot (and subsequent vgscan's) gives the following response:

[root@Voyager /root]# vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- found active volume group "vg02"
vgscan -- reading data of volume group "vg02" from physical volume(s)
vgscan -- inserting "vg02" into lvmtab
vgscan -- backing up volume group "vg02"
vgscan -- checking volume group name "vg02"
vgscan -- checking volume group consistency of "vg02"
vgscan -- checking existence of "/etc/lvmtab.d"
vgscan -- making directory "/etc/lvmtab.d"
vgscan -- storing volume group data of "vg02" in "/etc/lvmtab.d/vg02.tmp"
vgscan -- storing physical volume data of "vg02" in "/etc/lvmtab.d/vg02.tmp"
vgscan -- storing logical volume data of volume group "vg02" in
"/etc/lvmtab.d/vg02.tmp"
vgscan -- renaming "/etc/lvmtab.d/vg02.tmp" to "/etc/lvmtab.d/vg02"
vgscan -- removing special files and directory for volume group "vg02"
vgscan -- creating directory and group character special file for "vg02"
vgscan -- creating block device special files for vg02
vgscan -- found inactive volume group "vg01"
vgscan -- reading data of volume group "vg01" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "vg01" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
"/etc/lvmtab" and "/etc/lvmtab.d"


How screwed am I?

I've got reiserfs on the LV's, so recovering the data from the LV's should
not be too big an issue.  What I need to know is how to rebuild the VG.

TIA

Justin Hamilton.
