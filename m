Message-ID: <3BDE0947.7090203@gadreau.net>
From: Jean-Noel GADREAU <cathjn@gadreau.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Segmentation Fault with vgextend and LVM 1.0.1rc4
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
Date: Mon Oct 29 19:57:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi.

I have a problem to extend my current volume group "vg01". I did:

# pvcreate /dev/hde1 /dev/hde2
pvcreate -- physical volume "/dev/hde1" successfully created
pvcreate -- physical volume "/dev/hde2" successfully created

# vgextend -v vg01 /dev/hde1
vgextend -- locking logical volume manager
vgextend -- checking volume group name "vg01"
vgextend -- checking volume group "vg01" existence
vgextend -- checking for inactivity of volume group
vgextend -- reading data of volume group "vg01" from lvmtab
vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
vgextend -- reading data for all physical volumes from disk(s)
vgextend -- extending VGDA structures of volume group "vg01"
vgextend -- volume group "vg01" will be extended by 1 new physical volumes
vgextend -- extending volume group "vg01" by physical volume "/dev/hde1" 
in kernel
Segmentation fault (core dumped)

I am using RedHat 7.1 with a custom kernel to have LVM (2.4.9-6). I have 
2 drives on this IDE controller (a Promise UltraDMA100DX2) and both work 
fine with linux. My secondary drive (/dev/hdf is already part of vg01).

I don't know if this is a bug or if I am not using this correctly. I 
could not find anything on the internet about this particular problem.

For more information, I am including the results of several commands. 
Let me know if you need more information.

Thanks in advance for your help.
Regards,
Jean-Noel GADREAU

============================================

# vgdisplay -v vg01
--- Volume group ---
VG Name               vg01
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
VG Size               37.27 GB
PE Size               4.00 MB
Total PE              9541
Alloc PE / Size       9500 / 37.11 GB
Free  PE / Size       41 / 164.00 MB
VG UUID               SCcP8o-73vj-4rCl-GbTx-A0up-5GAu-BEEgVL

--- Logical volume ---
LV Name                /dev/vg01/data
VG Name                vg01
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                37.11 GB
Current LE             9500
Allocated LE           9500
Allocation             next free
Read ahead sectors     120
Block device           58:0


--- Physical volumes ---
PV Name (#)           /dev/hdf1 (1)
PV Status             available / allocatable
Total PE / Free PE    9541 / 41

=============================================
# vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- found active volume group "vg01"
vgscan -- reading data of volume group "vg01" from physical volume(s)
vgscan -- inserting "vg01" into lvmtab
vgscan -- backing up volume group "vg01"
vgscan -- checking volume group name "vg01"
vgscan -- checking volume group consistency of "vg01"
vgscan -- checking existence of "/etc/lvmtab.d"
vgscan -- storing volume group data of "vg01" in "/etc/lvmtab.d/vg01.tmp"
vgscan -- storing physical volume data of "vg01" in "/etc/lvmtab.d/vg01.tmp"
vgscan -- storing logical volume data of volume group "vg01" in 
"/etc/lvmtab.d/v
g01.tmp"
vgscan -- renaming "/etc/lvmtab.d/vg01.tmp" to "/etc/lvmtab.d/vg01"
vgscan -- removing special files and directory for volume group "vg01"
vgscan -- creating directory and group character special file for "vg01"
vgscan -- creating block device special files for vg01
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

=============================================
# pvscan -v
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- walking through all physical volumes found
pvscan -- inactive PV "/dev/hde1" is in no VG  [18.64 GB]
pvscan -- inactive PV "/dev/hde2" is in no VG  [18.64 GB]
pvscan -- ACTIVE   PV "/dev/hdf1" of VG "vg01" [37.27 GB / 164.00 MB free]
pvscan -- total: 3 [74.56 GB] / in use: 1 [37.27 GB] / in no VG: 2 
[37.29 GB]
