From: "kiran dalvi" <kiran_bd@hotmail.com>
Mime-Version: 1.0
Message-ID: <BAY1-F141ddbQYaBzkg00020a7c@hotmail.com>
Subject: [linux-lvm] Help : pvmove -- not enough free/allocatable physical extents
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
Date: Tue Jul 22 05:41:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hii All,
I am trying to use LVM on my Red-Hat Linux 8.0.
I haved created volume group using 3 partitions on my machine
(/dev/hda7,/dev/hda8,/dev/hda9).All the partions are of same size 200 
MB.Then
I have created stripped logical volume on 3 partitions using following 
command.

#lvcreate -i3 -I4 -l24 -nmy_stripped_lv1 my_volume_group

I have also tried extending logical volume and shrinking logical volume. All
this worked fine for me.

Now I tried pvmove command.

        #pvmove /dev/hda9

But it will be giving following error message

***********************
pvmove /dev/hda9
pvmove -- moving physical extents in active volume group "my_volume_group"
pvmove -- WARNING: if you lose power during the move you may need
        to restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- not enough free/allocatable physical extents

**************************

When I get above error message the output of vgdisplay is as follows

*************
        --- Volume group ---
VG Name               my_volume_group
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               564 MB
PE Size               4 MB
Total PE              141
Alloc PE / Size       24 / 96 MB
Free  PE / Size       117 / 468 MB
VG UUID               ywZQkl-Exfm-KQma-0s14-yi4V-kAz7-iw8Bhl


************

When I get above error message the output of lvdisplay is as follows

******************

        --- Logical volume ---
LV Name                /dev/my_volume_group/my_stripped_lv1
VG Name                my_volume_group
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                96 MB
Current LE             24
Allocated LE           24
Stripes                3
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     1024
Block device           58:0


****************

When I get above error message the output of pvdisplay for
/dev/hda7,/dev/hda8, /dev/hda9 is as follows (same for all)

************************

--- Physical volume ---
PV Name               /dev/hda9
VG Name               my_volume_group
PV Size               196.08 MB [401562 secs] / NOT usable 4.19 MB [LVM: 128
KB]
PV#                   3
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              47
Free PE               39
Allocated PE          8
PV UUID               cLI0Fw-Ezcz-dZ01-oEmE-LDat-K1Ep-q5k5Bl


**********************


So please guide me what should I need to do so that I will be able to get 
pvmove working

Thanks and Regards
Kiran

_________________________________________________________________
They are beautiful. They are in danger. 
http://server1.msn.co.in/Slideshow/BeautyoftheBeast/index.asp Our 
four-legged friends.
