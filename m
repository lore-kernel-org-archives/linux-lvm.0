Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2795N827648
	for <linux-lvm@redhat.com>; Sun, 7 Mar 2004 04:05:23 -0500
Received: from mwinf0303.wanadoo.fr (smtp3.wanadoo.fr [193.252.22.28])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2795CST007938
	for <linux-lvm@redhat.com>; Sun, 7 Mar 2004 04:05:12 -0500
Received: from wwinf0303 (wwinf0303 [172.22.134.30])
	by mwinf0303.wanadoo.fr (SMTP Server) with ESMTP id 0B7565000908
	for <linux-lvm@redhat.com>; Sun,  7 Mar 2004 09:33:51 +0100 (CET)
Message-ID: <661652.1078648430988.JavaMail.www@wwinf0303>
From: "dld.pascal.garcia" <dld.pascal.garcia@wanadoo.fr>
Subject: Re: [linux-lvm] Help : vg not accessible
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sun Mar  7 04:03:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello, 
It seems that diskdrake uses a pvcreate to add the pv in the vg. 
After I made a lvextend on the lv mounted as / of 500Mb and a 
rizerfsresize. 
This was working fine. The problem occured after reboot. 
 
I did not run lilo to recreate the Master boot sector and may be it is 
one 
problem as / in a lv. 
 
I tried the recue disk, but Mandrake did not include the lvmtools, so I 
tried a 
new installation. The installation process told me that there was illegal 
division by 0 when acessing the information of the vg. So i did not 
change 
anything an stopped the installation, (switch off the pc because there is 
no 
sofware abort possible without change of the disk data at this stage of 
the 
installation). 
 
As I had no solution on the portable, I took the disk out of my portable, 
and 
put it as primary (so the disk is hda as in the portable) in a fixed 
machine  
(special cables available), I added a second disk as slave and installed 
the  
distribution on the second disk. Then the MSB has been replaced. 
That is really a problem because now I can not even start booting on the 
portable 
disk. 
 
 
All the tools are now available, diskdrake told me that the partition I 
finally  
added was not in the vg. So I added the partition. It was an error I 
completly  
realize it now. 
An error has been repported on pvcreate, but mainly it has been done, but 
the data  
in /etc has not been created. 
 
whith pvdata now I can see that I have 2 pvs with number one. The 
orgiginal 
first and the volume i finally added. 
 
pvremove reports an error, and does nothing. 
 
vgscan does nothing on rootvg as it is inconsistant. Anyway the system do 
not know 
the vg, /dev/rootvg/[12] do not exist. 
 
I think I should first, by patching the data by hand, either remove the 
last pv I  
added, or make it as beeing the 3rd pv of the vg. What ever I have to 
patch, I have 
to make the data on the 3 pv consistant. 
After I may have to mknod few things to have the/dev/rootvg/[12] device 
available. I hope a vgscan will be able recretate the data /etc/lvmconf 
and that the  
data will then be available. 
I will then backup the data, put the disk back in the portable and 
reinstall  
everything. 
 
Is there any hope such a process would work, and what to patch, where can 
I find a 
description of the data structure ? 
 
I am preparing a mail whith pvdata results ... 
 
Pascal Garcia 
 
