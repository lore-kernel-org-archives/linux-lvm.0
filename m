Return-Path: <raheesom@navpoint.com>
Message-Id: <200104241645.f3OGjE001662@west.navpoint.com>
From: Rupert Heesom <raheesom@navpoint.com>
Date: 24 Apr 2001 11:39:02 -0400
Mime-Version: 1.0
Subject: [linux-lvm] I need to convert my root file system to LVM (adding a 2nd disk as
 well).
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
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@sistina.com>

My current partition config is -

Device Boot    Start       End    Blocks   Id  System
/dev/sda1   *         1         3     24066   83  Linux
/dev/sda2             4      1116   8940172+   5  Extended
/dev/sda5             4      1099   8803588+  83  Linux
/dev/sda6          1100      1116    136521   82  Linux swap

/dev/sda1 has /boot in it
/dev/sda5 has / in it.

I will be adding a 2nd disk onto the PC (/dev/sdb).

From what I read in the LVM-HOWTO, converting the root file system
needs < 1/2 the disk to be full.  Mine is > 1/2 full (~70%).
Apparantly one can convert the file system to LVM by 

1) creating an LVM partition on the 2nd disk, then 
2) copying the root files to the LVM partition, then 
3) adding the original file system to LVM.

I'm not sure I want to do all that copying, etc.   Is it possible to -
1)  Convert 2nd disk to LVM  
2) extend the LV to the 1st disk.

-- 
regs
rupert
