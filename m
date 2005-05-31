Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4VMPIO28267
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 18:25:18 -0400
Received: from ahmler3.mail.eds.com (ahmler3.mail.eds.com [192.85.154.74])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4VMPBKV032381
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 18:25:12 -0400
Received: from ahmlir5.mail.eds.com (ahmlir5-2.mail.eds.com [192.85.154.135])
	by ahmler3.mail.eds.com (8.13.2/8.12.10) with ESMTP id j4VMP5IV011886
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 18:25:06 -0400
Received: from ahmlir5.mail.eds.com (localhost [127.0.0.1])
	by ahmlir5.mail.eds.com (8.13.2/8.12.10) with ESMTP id j4VMOKg8002244
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 18:24:20 -0400
Received: from usahm011.amer.corp.eds.com ([130.175.214.152])
	by ahmlir5.mail.eds.com (8.13.2/8.12.10) with ESMTP id j4VMOKkn002239
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 18:24:20 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 31 May 2005 18:24:19 -0400
Message-ID: <5A14AF34CFF8AD44A44891F7C9FF410503F8C839@usahm236.amer.corp.eds.com>
From: "Post, Mark K" <mark.post@eds.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM VG keeps disappearing
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Twice now, I've had a VG "disappear" on me when I reboot my system.
These two instances were widely separated in time, with several reboots
in between.

When the system comes up vgscan runs, but I get this error:
vgscan -- reading all physical volumes (this may take a while...)

vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume 
group "vg01" from physical volume(s)

vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created

vgscan -- WARNING: This program does not do a VGDA backup of your volume
group  

The first time this happened, I wound up just restoring all my logical
volumes from backup.  This time I would like to try to figure out:
1. How to recover from this without restoring everything from backup.
2. Why this happens so that a fix can be created.

This system is a slack/390 operating system, 64-bit, running a 2.4.26
kernel.

The LVM version I'm running is 1.0.8.

bash-2.05b# fdasd -p /dev/dasda

 

WARNING: Your DASD '/dev/dasda' is in use.

         If you proceed, you can heavily damage your system.

         If possible exit all applications using this disk

         and/or unmount it.

 

reading volume label: VOL1

reading vtoc        : ok

 

 

Disk /dev/dasda:

    3338 cylinders,

      15 tracks per cylinder,

      12 blocks per track

    4096 bytes  per block

volume label: VOL1, volume identifier: 0X0200

maximum partition number: 3

 

 ------------------------------- tracks -------------------------------

               Device      start      end   length   Id  System

          /dev/dasda1          2    50069    50068    1  Linux native

exiting...



bash-2.05b# fdasd -p /dev/dasdb

reading volume label: VOL1

reading vtoc        : ok

'56' is not supported!

 

 

Disk /dev/dasdb:

    3338 cylinders,

      15 tracks per cylinder,

      12 blocks per track

    4096 bytes  per block

volume label: VOL1, volume identifier: 0X0201

maximum partition number: 3

 

 ------------------------------- tracks -------------------------------

               Device      start      end   length   Id  System

          /dev/dasdb1          2    50069    50068    1  Linux native

exiting...



bash-2.05b# fdasd -p /dev/dasdc

reading volume label: VOL1

reading vtoc        : ok

'99' is not supported!

 

 

Disk /dev/dasdc:

    3338 cylinders,

      15 tracks per cylinder,

      12 blocks per track

    4096 bytes  per block

volume label: VOL1, volume identifier: 0X0202

maximum partition number: 3

 

 ------------------------------- tracks -------------------------------

               Device      start      end   length   Id  System

          /dev/dasdc1          2    50069    50068    1  Linux native

exiting...



bash-2.05b# fdasd -p /dev/dasdd

reading volume label: VOL1

reading vtoc        : ok

'65' is not supported!

 

 

Disk /dev/dasdd:

    3338 cylinders,

      15 tracks per cylinder,

      12 blocks per track

    4096 bytes  per block

volume label: VOL1, volume identifier: 0X0203

maximum partition number: 3

 

 ------------------------------- tracks -------------------------------

               Device      start      end   length   Id  System

          /dev/dasdd1          2    50069    50068    1  Linux native

exiting...



bash-2.05b# fdasd -p /dev/dasde

reading volume label: VOL1

reading vtoc        : ok

'101' is not supported!

 

 

Disk /dev/dasde:

    3338 cylinders,

      15 tracks per cylinder,

      12 blocks per track

    4096 bytes  per block

volume label: VOL1, volume identifier: 0X0204

maximum partition number: 3

 

 ------------------------------- tracks -------------------------------

               Device      start      end   length   Id  System

          /dev/dasde1          2    50069    50068    1  Linux native

exiting...



bash-2.05b# fdasd -p /dev/dasdg

reading volume label: VOL1

reading vtoc        : ok

'109' is not supported!

 

 

Disk /dev/dasdg:

    3338 cylinders,

      15 tracks per cylinder,

      12 blocks per track

    4096 bytes  per block

volume label: VOL1, volume identifier: 0X0206

maximum partition number: 3

 

 ------------------------------- tracks -------------------------------

               Device      start      end   length   Id  System

          /dev/dasdg1          2    50069    50068    1  Linux native

exiting...



bash-2.05b# fdasd -p /dev/dasdh

 

WARNING: Your DASD '/dev/dasdh' is in use.

         If you proceed, you can heavily damage your system.

         If possible exit all applications using this disk

         and/or unmount it.

 

reading volume label: VOL1

reading vtoc        : ok

 

 

Disk /dev/dasdh:

    3338 cylinders,

      15 tracks per cylinder,

      12 blocks per track

    4096 bytes  per block

volume label: VOL1, volume identifier: 0X0207

maximum partition number: 3

 

 ------------------------------- tracks -------------------------------

               Device      start      end   length   Id  System

          /dev/dasdh1          2    44607    44606    1  Linux native

          /dev/dasdh2      44608    50069     5462    2  Linux swap

exiting...



bash-2.05b# vgscan -vv

vgscan -- v option already given                              
                                                              
                                                              
vgscan                                                        
        [-f/--force_numbers]                                  
        [-h/--help]                                           
        [-r/--remove_snapshots [VgNameToRemoveSnapshotsFrom]] 
        [-v/--verbose]                                        
                                                              

bash-2.05b# vgscan -v

vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"

vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"

vgscan -- reading all physical volumes (this may take a while...)

vgscan -- scanning for all active volume group(s) first

vgscan -- reading data of volume group "vg01" from physical volume(s)

vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume 
group "vg01" from physical volume(s)

vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created

vgscan -- WARNING: This program does not do a VGDA backup of your volume
group  

 

bash-2.05b# pvscan -vv

pvscan -- reading all physical volumes (this may take a while...)

pvscan -- walking through all physical volumes found

pvscan -- getting data for physical volume "/dev/dasdb1" from kernel

pvscan -- physical volume "/dev/dasdb1" is not active

--- Physical volume ---

PV Name               /dev/dasdb1

VG Name               vg01

PV Size               2.29 GB [4806528 secs] / NOT usable 32.19 MB [LVM:
128 KB]
 

PV#                   1

PV Status             available

Allocatable           yes (but full)

Cur LV                1

PE Size (KByte)       32768

Total PE              72

Free PE               0

Allocated PE          72

PV UUID               8pHTt5-6GR5-eQy3-1vcA-x9zp-nj2E-SmxA4f

System Id             lslack641108617901

 

 

pvscan -- getting data for physical volume "/dev/dasdc1" from kernel

pvscan -- physical volume "/dev/dasdc1" is not active

--- Physical volume ---

PV Name               /dev/dasdc1

VG Name               vg01

PV Size               2.29 GB [4806528 secs] / NOT usable 32.19 MB [LVM:
128 KB]

PV#                   2

PV Status             available

Allocatable           yes (but full)

Cur LV                2

PE Size (KByte)       32768

Total PE              72

Free PE               0

Allocated PE          72

PV UUID               c8dgEm-S7Rf-RZch-whap-7xnY-eF2m-LXZI73

System Id             lslack641108617910

 

 

pvscan -- getting data for physical volume "/dev/dasdd1" from kernel

pvscan -- physical volume "/dev/dasdd1" is not active

--- Physical volume ---

PV Name               /dev/dasdd1

VG Name               vg01

PV Size               2.29 GB [4806528 secs] / NOT usable 32.19 MB [LVM:
128 KB]
 

PV#                   3

PV Status             available

Allocatable           yes (but full)

Cur LV                1

PE Size (KByte)       32768

Total PE              72

Free PE               0

Allocated PE          72

PV UUID               A4z1p1-mQ3I-NYsu-UybS-HPjI-RDig-8tmndr

System Id             lslack641108617917

 

 

pvscan -- getting data for physical volume "/dev/dasde1" from kernel

pvscan -- physical volume "/dev/dasde1" is not active

--- Physical volume ---

PV Name               /dev/dasde1

VG Name               vg01

PV Size               2.29 GB [4806528 secs] / NOT usable 32.19 MB [LVM:
128 KB]
 

PV#                   4

PV Status             available

Allocatable           yes (but full)

Cur LV                2

PE Size (KByte)       32768

Total PE              72

Free PE               0

Allocated PE          72

PV UUID               eq11if-ju5s-dpqz-3s6y-M4Im-CknQ-Da7beM

System Id             lslack641108617924

 

 

pvscan -- getting data for physical volume "/dev/dasdg1" from kernel

pvscan -- physical volume "/dev/dasdg1" is not active

--- Physical volume ---

PV Name               /dev/dasdg1

VG Name               vg01

PV Size               2.29 GB [4806528 secs] / NOT usable 32.19 MB [LVM:
128 KB]
 

PV#                   6

PV Status             available

Allocatable           yes

Cur LV                1

PE Size (KByte)       32768

Total PE              72

Free PE               64

Allocated PE          8

PV UUID               mcDIdd-drYH-DdUT-MoNP-n0ih-sZxq-xud3KS

System Id             lslack641108617952

 

 

pvscan -- total: 5 [11.46 GB] / in use: 5 [11.46 GB] / in no VG: 0 [0]

 

bash-2.05b# lvscan -vv                         
lvscan -- no volume groups found   
                                   
bash-2.05b#                        
                                   

df -k                                                               
df -k                                                               
Filesystem           1K-blocks      Used Available Use% Mounted on  
/dev/dasda1            2365444    437392   1807892  20% /           

bash-2.05b# mount

/dev/dasda1 on / type ext3 (rw)

proc on /proc type proc (rw)

devpts on /dev/pts type devpts (rw,gid=5,mode=620)



Mark Post
