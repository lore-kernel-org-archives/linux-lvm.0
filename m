From: Austin Gonyou <austin@coremetrics.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1035087242.1512.4.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: [linux-lvm] I broke my PVs!
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
Date: Sat Oct 19 23:14:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have 3 disks, one 9GB and two 18GB scsi disks. I just re-installed my
system with RH 8.0, and it didn't like that the two 18's weren't
initialized, I guess I screwed up, cause I didn't think I was
initializing them(since I told the installer not to), and instead ran
fdisk and then saved without making partitions. 

I can see my data still on the disks if I do strings /dev/sdb or
dev/sdc. I have another system that also has 3 scsi disks using two of
them with LVM. 

I was curious, if I could take say the first 512 bytes, or whatever
space is required to write the pv information on a disk, from those
disks, and then write them to the first 512 bytes, or whatever, to the
disks on my system, then do pv scan and see if they get activated, or
found to be in a vg that the other disks were in.

I've got about 30GB of data on this VG, and I am really hoping I don't
have to lose it. A lot of email there, etc. Please advise. 

Austin
