Message-ID: <2D92FEBFD3BE1346A6C397223A8DD3FC09235F@THOR.goeci.com>
From: Murthy Kambhampaty <murthy.kambhampaty@goeci.com>
MIME-Version: 1.0
Subject: [linux-lvm] [SOLVED] RE: VG incorrectly displayed/unusable
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
Date: Thu Jul  3 09:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

vexport-ing the volume in rescue mode and vgimporting-ing after system
restart did solve the problem


>-----Original Message-----
>From: Murthy Kambhampaty 
>Sent: Wednesday, July 02, 2003 02:44
>To: 'linux-lvm@sistina.com'
>Subject: VG incorrectly displayed/unusable
>
>
>After reinstalling Redhat 8.0 on a server system, I am having 
>an odd problem: vgscan recognizes the various VGs on the 
>system, VGsys, VGdata0 and VGdb01. However, LVM seems to 
>confuse VGdata0 and VGsys - "/sbin/vgdisplay VGdata0" produces 
>a VGdisplay for VGsys and "/sbin/lvscan" shows duplicate 
>information for VGsys. As shown below, "/sbin/vgdisplay -D 
>VGdata0" shows the correct information for VGdata0.
>
>I am thinking of booting to the Redhat 8.0 installer's rescue mode
>, vgexport-ing VGdata0, reboot to the system and 
>"vgimport"-ing VGdata0 (and its PVs). Is this likely to solve 
>the problem (I half-expect that all that vgexport does is 
>remove the VG config from the "old" system in preparation for 
>moving the volume, so I'm not sure this will do me any good.)
>
>The system runs RedHat Linux 8.0 with the latest updates, and 
>the 2.4.21 kernel with xfs patches (LVM userspace has been 
>updated to redhat/contribs/libc6/SRPMS/lvm-1.0.5-1.src.rpm 
>rebuilt on this system). Hardware is 
>Supermicro Super8050
>AIC79XX (onboard u160, connects VGsys)
>DAC960 (Acceleraid 352, connects VGdata0)
>aacraid (Adaptec 2200s, connects VGdb01)
>
>One thing to note is that one of the PVs in VGdata0 is a whole 
>(HW RAID-5 logical) disk.
>
>Listed below are output from:
>/sbin/vgdisplay -D VGdata0
>/sbin/vgdisplay VGdata0
>and
>/sbin/pvdisplay
>
>Thanks for the help,
>   Murthy
>
>
>
># /sbin/vgdisplay -D VGdata0
>--- Volume group ---
>VG Name               VGdata0
>VG Access             read/write
>VG Status             NOT available/resizable
>VG #                  0
>MAX LV                256
>Cur LV                3
>Open LV               0
>MAX LV Size           2 TB
>Max PV                256
>Cur PV                2
>Act PV                2
>VG Size               266.16 GB
>PE Size               32 MB
>Total PE              8517
>Alloc PE / Size       5185 / 162.03 GB
>Free  PE / Size       3332 / 104.12 GB
>VG UUID               QmFOyx-ILlI-uNTb-z4hG-ZDnD-kL3Q-UyJGEZ
>
>
># /sbin/vgdisplay VGdata0
>--- Volume group ---
>VG Name               VGsys
>VG Access             read/write
>VG Status             available/resizable
>VG #                  0
>MAX LV                256
>Cur LV                4
>Open LV               4
>MAX LV Size           255.99 GB
>Max PV                256
>Cur PV                1
>Act PV                1
>VG Size               31.65 GB
>PE Size               4 MB
>Total PE              8103
>Alloc PE / Size       8103 / 31.65 GB
>Free  PE / Size       0 / 0
>VG UUID               DWvjLY-tFNc-cxXU-epjF-vaEx-uEAA-IM3CtK
>
>
># /sbin/lvscan
>pvscan -- reading all physical volumes (this may take a while...)
>pvscan -- inactive PV "/dev/rd/c0d0p4" of VG "VGdata0" [129.38 GB /
>104.12 GB free]
>pvscan -- inactive PV "/dev/rd/c0d1"   of VG "VGdata0" [136.78 GB / 0
>free]
>pvscan -- ACTIVE   PV "/dev/md2"       of VG "VGsys"   [31.65 GB / 0
>free]
>pvscan -- ACTIVE   PV "/dev/sdc1"      of VG "VGdb01"  [67.75 GB / 0
>free]
>pvscan -- ACTIVE   PV "/dev/sdd1"      of VG "VGdb01"  [271.12 GB / 0
>free]
>pvscan -- total: 5 [636.88 GB] / in use: 5 [636.88 GB] / in no 
>VG: 0 [0]
>
