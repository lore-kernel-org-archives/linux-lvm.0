Message-Id: <3C83ADC8.50405@eecs.umich.edu>
From: Chris Hamilton <cchamilt@eecs.umich.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] RAID1/LVM lost my volume group
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
Date: Mon Mar  4 11:22:05 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi, I have 4 drives set up as 2 RAID1s with a striped LVM across them.  

After rebooting a few times vgscan and vgchange have stopped finding my 
volume group.
The pv* tools confirm that the physical volumes are still intact. 
 Everytime I try to call
vgcfgrestore or really any vg tool, they segfault if I specify the group.

I have been using 2.4.19-pre1-ac1, 2.4.19-pre2-ac2 on a glibc 2.2.4 
system with lvm 1.03.
The filesystem is (was) ext3.  Is there any way to get this recovered? 
 Why could it have happened?

If I do have to start from zero, is there a recommended RAID 10-like 
configuration for LVM I can use?  My goal is to have 10 reliability and 
snapshots for backup.

Thanks,
Chris Hamilton
