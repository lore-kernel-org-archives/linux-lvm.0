From: "Carey Jung" <carey@itfreedom.com>
Message-ID: <GNEAKGKKMNLLGBACDNBJCEDLCKAA.carey@itfreedom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM corruption
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
Date: Thu Oct 16 13:07:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

It appears that  I have some kind of LVM corruption, and I can't figure out
how to locate it.  I started getting lots of EXT3 errors in
/var/log/messages, relating to lvm devices.  On one device in particular,
when I tried to copy a large quantity of data to it, I got the following
errors:

Oct 16 12:19:17 big kernel: EXT3-fs: mounted filesystem with ordered data
mode.
Oct 16 12:21:01 big kernel: EXT3-fs error (device lvm(58,17)):
ext3_new_block: Allocating block in system zone - block = 21856256
Oct 16 12:21:21 big kernel: EXT3-fs error (device lvm(58,17)):
ext3_new_block: Allocating block in system zone - block = 21856280

I first tried reformatting (mkfs) the partition, but afterwards got the same
errors.

I then tried deleting and recreating the logical volume, reformatting, and
copying again, and got the same errors on the brand new volume/filesystem.

I suspect that the problem is in the LVM layer, but I'm not aware of any
tools that will perform a consistency check on the entire lvm subsystem.
Anybody got any ideas?

This is lvm-1.0.3-4, stock redhat 7.3 rpm.  The raw devices on which the
physical extents reside are very large, nearly 2TB each (there are two).

Any help would be appreciated.


thanks,
Carey Jung
