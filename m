Message-ID: <B51F0C636E578A4E832D3958690CD73E0130C024@es04snlnt>
From: "Diehl, Jeffrey" <jdiehl@sandia.gov>
Date: Thu, 13 Sep 2001 14:11:59 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 33% of my space is missing?
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi all.

I seem to be missing 100Gb out of a possible 300Gb!  Check it out:

[root@filmore jdiehl]# fdisk -l | grep LVM
/dev/sdb5           226      4402  33551721   8e  Linux LVM
/dev/sdb6          4403      8579  33551721   8e  Linux LVM
/dev/sdb7          8580     12756  33551721   8e  Linux LVM
/dev/sdb8         12757     15030  18265873+  8e  Linux LVM
/dev/sdc6          7015     14028  56339923+  8e  Linux LVM
/dev/sdc7         14029     21042  56339923+  8e  Linux LVM
/dev/sdc8         21043     28056  56339923+  8e  Linux LVM
/dev/sdc9         28057     30945  23205861   8e  Linux LVM
[root@filmore jdiehl]#

Adding this space up, I get 311Gb.

But:

[root@filmore jdiehl]# lvdisplay /dev/Database2/data
--- Logical volume ---
LV Name                /dev/Database2/data
VG Name                Database2
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                215.3 GB
Current LE             27558
Allocated LE           27558
Allocation             next free
Read ahead sectors     120
Block device           58:0

Here we see that I only have access to 215Gb. 

Where is the rest of my space?

Mike Diehl.
