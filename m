From: Abhas Abhinav <abhas@deeproot.co.in>
In-Reply-To: <20011221084531.A22947@lsc.hu>
Message-Id: <Pine.LNX.4.43.0202060830060.24753-100000@anubhav.lan.deeproot.co.in>
MIME-Version: 1.0
Subject: [linux-lvm] error in mounitng snapshot LVs
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
Date: Tue Feb  5 21:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Hi..

I've been using LVM for an year now... and have had almost no problems
with it...

Lately, i decided to start using snapshots to backup some data. I
created snapshot volumes as per the lvcreate man page and the
LVM-HOWTO on the sistina web site... however, i get stuck everytime i
try to moung the snapshot...

mount gives the following error:

-------
anubhav:~# mount /dev/data/snap_work /mnt
mount: block device /dev/data/snap_work is write-protected, mounting read-only
mount: wrong fs type, bad option, bad superblock on /dev/data/snap_work,
       or too many mounted file systems
-------

lvdisplay output is as follows:

-------
anubhav:~# lvdisplay /dev/data/snap_work
--- Logical volume ---
LV Name                /dev/data/snap_work
VG Name                data
LV Write Access        read only
LV snapshot status     active destination for /dev/data/work
LV Status              available
LV #                   5
# open                 0
LV Size                2.50 GB
Current LE             640
Allocated LE           640
snapshot chunk size    64.00 KB
Allocated to snapshot  0.00% [0/590.62 MB]
Allocated to COW-table 9.38 MB
Allocation             next free
Read ahead sectors     10000
Block device           58:8
-------

I'm attaching the output of vgdisplay -v /dev/data in a gzipped file...
so as not to clutter this email...

I am using kernel version 2.4.17 with LVM version 1.0.2. I've applied
all the kernel patches correctly. And i'm using ReiserFS as the
filesystem. The mount version that i am using is: mount-2.11n

can anyone guide me as to where i am going wrong...??

thanks,

abhas.

-- 
-------------------------------------------------------------------
Abhas Abhinav		   | Free Software at its product-ive best.
CEO, DeepRoot Linux
http://www.deeproot.co.in	   	   ---- Server Appliances ----
Ph: +91 (80) 856 5624	       ---- Linux Support and Services ----
-------------------------------------------------------------------
