Return-Path: <riise@rsc.no>
Date: Thu, 19 Apr 2001 22:52:11 +0200
From: Johan Ur Riise <riise@rsc.no>
Message-ID: <20010419225211.C5892@egg.topp.dyndns.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] vgscan error
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I saw som messages about a problem like this, and I think it is not
resolved. Here is my description:

vgscan locates my vg, vg00, then exits, there is no lvmtab or lvmtab.d
in /etc.

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "vg00"
vgscan -- only found 342 of 1026 LEs for LV /dev/vg00/lv02 (1)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "vg00" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"

pvscan reports this:

[root@egg /root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hda2" of VG "vg00" [19.09 GB / 12.09 GB free]
pvscan -- ACTIVE   PV "/dev/hdc2" of VG "vg00" [6 GB / 6 GB free]
pvscan -- total: 2 [25.09 GB] / in use: 2 [25.09 GB] / in no VG: 0 [0]

this is the last 14 lines of vgscan --debug:

<1> vg_read_with_pv_and_lv -- LEAVING with ret: -365
<1> lvm_error -- CALLED with: -365
<1> lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): allocated LE of LV"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "vg00" from physical volume(s)
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
<1> lvm_error -- CALLED with: -365
<1> lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): allocated LE of LV"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104


I performed these operations:

created pv's on /dev/hdc6, /dev/hde6 and /dev/hdg6 total approx 42GB

created a vg named vg00 on these 

I got a few of messages like these:
-- WARNING: you may not have an actual VGDA backup of your volume group

created a lv of 20GB. This used all of first partition and half of the
second.

tried to create an lv stiped over 3 (but no space left on first pv)

moved 1 pe from hdc6 to hdg6 
moved next pe and up to the end by number(hope I got the number right)
from hdc6 to hdg6. Ran mkfs.ext2 on this lv while it was moving (fun).

created the striped lv

All seemed to go well up to this point

somewhere in between I tried to run lvmcreate_initrd and got a program
hang, so i had to kill it

After reboot, vgscan would not run.

My kernel is 2.4.2 stock.
My system is debian, and lvm (the tools) was from the
"unstable" distribution.

I dumped it, and downloaded lvm_0.9.1_beta7.tar.gz in stead. same
problem.

I also messed with the lvmconf directory (and its gone)

I have another machine which I have not booted since i created the
pv's vg and lv, with the debian lvm package, and have not got any 
error (probably will if I boot).

I could probably compile the tools with -g and run vgscan in gdb,
but I don't know what to look for.








-- 
Johan Ur Riise
90 15 77 78
