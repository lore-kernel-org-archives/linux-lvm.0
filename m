Date: Mon, 15 Oct 2001 16:30:39 +0200
From: Stefan Onken <Stefan.Onken@difi.de>
Message-ID: <110278234233.20011015163039@difi.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] replace bad hard disc
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

 I already looked in the How-to and FAQ, but I do not find any
 step by step tutorial to change a bad hard disc in a LVM System.

 I have two hard discs, 100 Gig + 60 Gig with reiserfs. The 60gig
 hard drive has some bad blocks, so I would like to replace it
 with a new hard disc. May anyone please be so kind and give me a
 helping hand for this problem....
 
linux:~ # lvscan
lvscan -- ACTIVE            "/dev/Stonki2/LV_Stonki2" [150.59 GB]
lvscan -- 1 logical volumes with 150.59 GB total in 1 volume group
lvscan -- 1 active logical volumes



linux:~ # lvdisplay /dev/Stonki2/LV_Stonki2
--- Logical volume ---
LV Name                /dev/Stonki2/LV_Stonki2
VG Name                Stonki2
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                150.59 GB
Current LE             38550
Allocated LE           38550
Allocation             next free
Read ahead sectors     120
Block device           58:0


thanks anyway...

cu

stonki


-- 
The More I See, The More I Know. The More I Know, The Less I Understand
