Message-ID: <20031129185055.74160.qmail@web40612.mail.yahoo.com>
From: =?iso-8859-1?q?Chris=20Rankin?= <rankincj@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM1 compat support in 2.6.0-test11 misses one of my 2.4.23 VGs
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
Date: Sat Nov 29 12:51:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I am trying to migrate from Linux 2.4.23 to Linus
2.6.0-test11. However, my /usr and /home filesystems
are both LVM1 Logical Volumes and so it's vitally
important that I be able to mount them under
2.6.0-test11.

My userspace environment contains both the LVM 1.0.6
tools and the LVM2.2.00.08 tools, and my init scripts
decide which set to use based on whether or not devfs
contains the /dev/mapper/control device.

Obviously, everything is fine on 2.4. However, 2.6
only finds and activates the volume group containing
/home. (This is actually an improvement over the
LVM2.2.00.08 tools, which failed to find either volume
groups!) The tools (vgscan, vgchange -ay) complain
about finding a "duplicate" PV on /dev/hda2, and say
that they will ignore it. Natually, I have *not*
mounted either filesystem under 2.6 yet!

Anyway, this is what 2.4.23 says about my Volume
Groups:

# cat /proc/lvm/global
LVM driver LVM version 1.0.7(28/03/2003)

Total:  2 VGs  2 PVs  2 LVs (2 LVs open 2 times)

Global: 63590 bytes malloced   IOP version: 10  
5:18:32 active

VG:  system  [1 PV, 1 LV/1 open]  PE Size: 4096 KB
  Usage [KB/PE]: 9637888 /2353 total  9637888 /2353
used  0 /0 free
  PV:  [AA] ide/host0/bus0/target0/lun0/part2  9637888
/2353     9637888 /2353           0 /0     
    LV:  [AWDL  ] lvol1                      9637888
/2353     1x open

VG:  user  [1 PV, 1 LV/1 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4800512 /1172 total  4800512 /1172
used  0 /0 free
  PV:  [AA] ide/host0/bus0/target0/lun0/part3  4800512
/1172     4800512 /1172           0 /0     
    LV:  [AWDL  ] lvol1                      4800512
/1172     1x open

# cat /proc/lvm/VGs/system/
LVs    PVs    group  
# cat /proc/lvm/VGs/system/global
cat: /proc/lvm/VGs/system/global: No such file or
directory
# cat /proc/lvm/VGs/system/      
LVs    PVs    group  
# cat /proc/lvm/VGs/system/group 
name:         system
size:         9637888
access:       3
status:       5
number:       0
LV max:       256
LV current:   1
LV open:      1
PV max:       256
PV current:   1
PV active:    1
PE size:      4096
PE total:     2353
PE allocated: 2353
uuid:         syst-em

# cat /proc/lvm/VGs/user/group 
name:         user
size:         4800512
access:       3
status:       5
number:       1
LV max:       256
LV current:   1
LV open:      1
PV max:       256
PV current:   1
PV active:    1
PE size:      4096
PE total:     1172
PE allocated: 1172
uuid:         user

# cat /proc/lvm/VGs/system/    
LVs    PVs    group  
# cat
/proc/lvm/VGs/system/PVs/ide_host0_bus0_target0_lun0_part2

name:         /dev/ide/host0/bus0/target0/lun0/part2
size:         19278000
status:       1
number:       1
allocatable:  2
LV current:   1
PE size:      4096
PE total:     2353
PE allocated: 2353
device:       03:02
uuid:         /dev-/ide-/hos-t0/b-us0/-targ-et0/-lun0

# cat /proc/lvm/VGs/user/ 
LVs    PVs    group  
# cat
/proc/lvm/VGs/user/PVs/ide_host0_bus0_target0_lun0_part3

name:         /dev/ide/host0/bus0/target0/lun0/part3
size:         9606870
status:       1
number:       1
allocatable:  2
LV current:   1
PE size:      4096
PE total:     1172
PE allocated: 1172
device:       03:03
uuid:         /dev-/ide-/hos-t0/b-us0/-targ-et0/-lun0

# cat /proc/lvm/VGs/system/LVs/lvol1                  
          
name:         /dev/system/lvol1
size:         19275776
access:       3
status:       1
number:       0
open:         1
allocation:   0
device:       58:00

# cat /proc/lvm/VGs/user/LVs/lvol1 
name:         /dev/user/lvol1
size:         9601024
access:       3
status:       1
number:       0
open:         1
allocation:   0
device:       58:01

My original intention here was to be able to "grow"
both these filesystems by adding another disc later.
As it turned out, the disk was plenty big enough...
;-).

Anyway, am I doing something obviously wrong here? Or
is there a bug in the LVM2 tools?

Thanks for any assistance,
Cheers,
Chris


________________________________________________________________________
Download Yahoo! Messenger now for a chance to win Live At Knebworth DVDs
http://www.yahoo.co.uk/robbiewilliams
