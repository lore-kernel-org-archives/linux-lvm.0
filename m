Date: Tue, 28 Dec 1999 11:09:14 -0800 (PST)
From: Adam Crews <acrews@cisco.com>
Subject: [linux-lvm] lvextend
Message-ID: <Pine.LNX.4.10.9912281058520.1394-100000@scooby.cisco.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hello,

I am having problems trying to extend a lv.

[root@scooby /root]# lvextend -v -l+6514 /dev/mirror_vg/mirror_lv 
lvextend -- checking for valid logical volume path 
lvextend -- locking logical volume manager 
lvextend -- checking existence of logical volume "/dev/mirror_vg/mirror_lv" 
lvextend -- checking for active logical volume "/dev/mirror_vg/mirror_lv" 
lvextend -- reading volume group data of volume group "mirror_vg" from disk(s) 
lvextend -- getting index of logical volume "/dev/mirror_vg/mirror_lv" in volume group "mirror_vg" 
lvextend -- extending logical volume "/dev/mirror_vg/mirror_lv" to 76.16 GB 
lvextend -- setting up logical volume "/dev/mirror_vg/mirror_lv" for extend
lvextend -- not enough free/allocatable physical extents to extend logical volume "/dev/mirror_vg/mirror_lv"
[root@scooby /root]# 


Looing at the vg I see that there is enough free space


[root@scooby /root]# vgdisplay 
--- Volume group --- 
VG Name 		mirror_vg 
VG Access 		read/write 
VG Status 		available/resizable 
VG # 			0 
MAX LV 			256 
Cur LV 			1
Open LV 		0 
MAX LV Size 		255.99 GB 
Max PV 			256 
Cur PV 			3 
Act PV 			3 
VG Size 		76.16 GB 
PE Size 		4 MB 
Total PE 		19496 
Alloc PE / Size 	12982 / 50.71 GB 
Free  PE / Size 	6514 / 25.45 GB 


[root@scooby /root]#

What am I doing wrong?

-Adam
