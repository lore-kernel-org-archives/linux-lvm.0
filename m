Message-ID: <20011029182152.47152.qmail@web14407.mail.yahoo.com>
From: Aman Shahi <shahi_aman@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Problem with kernel-2.4.13 and 2.4.11-VFS-lock.patch
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
Date: Mon Oct 29 12:20:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,
I built 2.4.13 with the 2.4.11-VFS-lock.patch in the
CVS. Compilation didn't give any problem as I was
getting with 2.4.12-ac6. 

I was able to create a snapshot of a mounted LV and
mount the snapshot. After this operation the I/O on
the mounted LV came out with Segmentation Fault. Few
months back I had reported the Segmentation fault with
the I/O. That time I was getting Kernel Panic. But
that time I think I had not applied the VFS Patch.
Today I didn't get that kernel panic, just a
Segmentation Fault.

After this segmentation fault, without rebooting my
system, I went ahead and started another I/O. While
this I/O was going on, I created a Snapshot. But when
I tried to mount it, it gave "Permission Denied".

Also when I tried to unmount the LV, it came off with
"File System or Volume in Use".....though It wasn't in
use.

Is it that I may have done something wrong, or the VFS
lock patch has to be updated for 2.4.13.

I am using Reiserfs File System. And everything works
fine with 2.4.12. I am having problems with the later
linux kernel only.

regards,
Aman.

__________________________________________________
Do You Yahoo!?
Make a great connection at Yahoo! Personals.
http://personals.yahoo.com
