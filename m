Message-Id: <200209192114.RAA28859@www23.ureach.com>
From: Ali Zaidi <smaliz@ureach.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgscan not returning
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
Date: Thu Sep 19 16:15:22 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi:
I am a novice with LVM but after going through the man pages and howtos i was 
unable to find a solution to my problem. I am hoping one of you might find some 
time to point me in the right direction.

I am trying to setup LVM on a RH box. I run vgscan before i can create the 
volumes but it never returns. Same thing happens with lvmdiskscan and pvscan.
Here is a -v and -d output of vgscan
================================================================
[root@fixx /etc]# vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)


================================================================
The above never returns and i am even unable to kill the process with -9

================================================================
[root@fixx /root]# vgscan -d
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING

================================================================
The above never returns aswell and i am even unable to kill the process with -9


I only have one 20 Gig drive on the system with the following partition table

================================================================

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1      1020   8193118+  83  Linux
/dev/hda2          1021      2491  11815807+   5  Extended
/dev/hda5          1021      1148   1028128+  82  Linux swap
/dev/hda6          1149      1187    313236   8e  Linux LVM
/dev/hda7          1188      1200    104391   8e  Linux LVM
/dev/hda8          1201      1213    104391   8e  Linux LVM
/dev/hda9          1214      1226    104391   8e  Linux LVM
/dev/hda10         1227      1239    104391   8e  Linux LVM
/dev/hda11         1240      1241     16033+  8e  Linux LVM
/dev/hda12         1242      1254    104391   8e  Linux LVM
/dev/hda13         1255      1267    104391   8e  Linux LVM
/dev/hda14         1268      1280    104391   8e  Linux LVM
/dev/hda15         1281      1293    104391   8e  Linux LVM
/dev/hda16         1294      2491   9622903+  8e  Linux LVM
================================================================

The reason i have so many partitions is as i would be using raw devices for an 
oracle database on this system.
I am using LVM 1.0.4 on Kernel 2.4.2-2. I cannot use LVM 1.0.5 as it does not 
compile with the above mentioned kernel and the reason i am stuck with this 
kernel is because of Oracle support issues.

Any help would be appreciated at this point as i dont know how to move further 
on this.
Thanks
Ali
