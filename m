Return-Path: <root@vidar.deathbringer.com>
From: root <root@vidar.deathbringer.com>
Date: Sat, 28 Apr 2001 12:33:58 -0500
MIME-Version: 1.0
Message-Id: <01042812335801.12586@vidar>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vgcfgrestore fails.
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

I am running SuSe 7.1 
2.4.0 kernel 
512M Ram
AhA2940U2W
suse lvm

I had three volume groups and a week ago the volume group that contained user 
had a drive crash.  I was unable to save usr but now I can not mount any of 
my other volume groups and vgcfgrestore fails.  Is their any thing I can do 
to get my data?  
thor:~ # pvdisplay /dev/sdd2
--- Physical volume ---
PV Name               /dev/sdd2
VG Name               export
PV Size               8.3 GB / NOT usable 3.31 MB [LVM: 238 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              2123
Free PE               0
Allocated PE          2123
PV UUID               ruLId0-1JoY-34Ja-oLW0-FmzV-Q5ZN-NQaZw9
thor:~ # pvdisplay /dev/sdc2
--- Physical volume ---
PV Name               /dev/sdc2
VG Name               export
PV Size               8.3 GB / NOT usable 3.31 MB [LVM: 238 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              2123
Free PE               0
Allocated PE          2123
PV UUID               ynnKCX-mjlT-jeNe-9MHY-tnP2-XCIC-nbKrmq
 
thor:~ # vgcfgrestore -n export /dev/sdd2
vgcfgrestore -- ERROR: different structure size stored in "/etc/lvmconf/export.conf" than expected in file vg_cfgrestore.c [line 
122]
vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group "export"
                                                                              
          
