Return-Path: <scott@devnull.dyndns.org>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Date: Sat, 30 Jun 2001 09:55:14 -0400
MIME-Version: 1.0
Message-Id: <01063009551400.00262@devnull>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Cannot mount: device in use
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
Cc: reiserfs-list@namesys.com

Hello, just had a power outage in my area and when my system came back up, 
all my  lvm'd reiserfs volumes reported that they were already mounted, even 
though they were not.  I have seen this several times after system crashes 
and each time, the only way to resolve the problem is to login in single-user 
mode, umount the device (which reports <device>: not mounted) and then 
reboot... after that, the devices go through the journal replay as expected.  
As I do not have any lvm'd ext2fs, I will shortly create a small one, crash 
the system, and see if the problem happens with the lvm'd ext2fs or not, but 
until that time, here're my specifics:

linux 2.2.19
reiserfs 3.5.32
lvm 0.9.1beta7

Also, someone previously asked if my mnttab file or /proc/mounts might have 
been the issue, so in rcS i had it copy them elsewhere before it removed the 
mnttab and started trying to mount filesystems... /proc/mounts only showed 
/dev/root on / and procfs on /proc... mnttab didn't have the external volumes 
in them either.

Thanks.

-- 
Scott Denton
smdenton@bellsouth.net
