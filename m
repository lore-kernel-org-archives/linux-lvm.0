From: Daniel Barklon <dan@veddma.com>
Message-Id: <1051864754.15671.56.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] recovering from VGDA loss
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
Date: Fri May  2 03:13:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,
    I was running lvm with one PV [/dev/hdb3], making up one GV
[/dev/data], which was completely allocated to one LV
[/dev/data/homes].  My root was a separate harddisk [/dev/hda1].  Hda is
now gone, and so is my /etc, where my VGDA was.

Is there a way for me to get at the data that is still stored on
/dev/hdb3 (I am running slackware linux 9; linux-2.4.20, lvm-1.0.6)?

When I run pvscan I get the following:

root@ved:~# pvscan -v    
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- walking through all physical volumes found
pvscan -- inactive PV "/dev/hdb3"  is associated to unknown VG "data"
(run vgscan)
pvscan -- total: 1 [13.64 GB] / in use: 1 [13.64 GB] / in no VG: 0 [0]

This suggests I run vgscan...

root@ved:~# vgscan -v    
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- reading data of volume group "data" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "data" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

...

vgimport segfaults on me when I try to import the VG as shown:

root@ved:~# vgimport -fv data /dev/hdb3
vgimport -- locking logical volume manager
vgimport -- checking volume group name
vgimport -- checking volume group "data" existence
vgimport -- trying to read physical volume
vgimport -- checking for duplicate physical volumes
vgimport -- checking physical volume name "/dev/hdb3"
vgimport -- reading data of physical volume "/dev/hdb3" from disk
vgimport -- checking for exported physical volume "/dev/hdb3"
vgimport -- checking consistency of physical volume "/dev/hdb3"
vgimport -- reallocating memory
Segmentation fault

"pvdata -P /dev/hdb3" yields

--- Physical volume ---
PV Name               /dev/hdb3
VG Name               data
PV Size               13.64 GB [28611765 secs] / NOT usable 4.19 MB
[LVM: 141 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              3491
Free PE               0
Allocated PE          3491
PV UUID               gdtjvf-8UHQ-SbSF-zmaG-7E0z-5olx-cCQRrI



Any help will be greatly appreciated.  I am still sifting through the
linux-lvm archive, but I can't seem to find a case that resmbles mine
closely enough...

Thanks,

-- 
Daniel Barklon <dan@veddma.com>
