Message-ID: <3DF2B8D1.7070702@machturtle.com>
From: David Corbin <dcorbin@machturtle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] I'm confused
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
Date: Sat Dec  7 21:13:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM <linux-lvm@sistina.com>

Hopefully, the following "summary" will make sense.
---start---
piano:/data/family# 
vgscan                                                                                                               
vgscan -- reading all physical volumes (this may take a 
while...)                                                                        
vgscan -- found active volume group 
"vg0"                                                                                                
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

piano:/data/family# vgdisplay
--- Volume group ---
VG Name               vg0
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               109.77 GB
PE Size               4 MB
Total PE              28102
Alloc PE / Size       109 / 436 MB
Free  PE / Size       27993 / 109.35 GB
VG UUID               hC86w2-zjFf-x2gt-1GC4-LHET-6ieO-BiC5j5


piano:/data/family# lvscan
lvscan -- ACTIVE            "/dev/vg0/data" [436 MB]
lvscan -- 1 logical volumes with 436 MB total in 1 volume group
lvscan -- 1 active logical volumes

piano:/data/family# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hda2              1921188    672176   1151420  37% /
/dev/hda1                23302      4905     17194  23% /boot
/dev/vg0/data           446444    444448      1996 100% /data
piano:/data/family#
---end---

I'm having trouble reconciling the 436MB   of the "df" with the VG Size 
of vgdisplay.  Obviously something is wrong somewhere.  I KNOW I'm no 
where near using up my 120G drive yet.

For the record, this is a Debian Woody system running a 2.4.19 kernel.

Help.

Thanks
David Corbin
