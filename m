Message-ID: <OF1EE49BDF.AE37C6D0-ON86256C71.005578CE@TEXASMUTUAL.COM>
From: "Jonathan S. Polacheck" <JPolache@texasmutual.com>
MIME-Version: 1.0
Subject: [linux-lvm] file system larger than lv
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
Date: Thu Nov 14 09:36:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I posted the following to the ext2 help forum and got the included
response;

By: jpolache ( Jon Polacheck )
 reasize2fs fails
2002-11-13 13:23
I have an lvm volume for my /usr filesystem on a Mandrake 8.1 server. I did
a
lvextend, and am now trying to resize the filesystem into the logical
volume.

I went to runlevel 1, unmounted all my filesystems (umount -a) and ran
e2fsck on /dev/sys/usr. I got output indicating that the superblock size
was 793600 blocks and the "physical" size was 665600 blocks.

e2fsck ended with the following;

Error scanning inodes (336000): can't read next inode

/dev/sys/usr: 13494/400000 files (1.2% non-contiguous), 578502/793600
blocks

When I then run resize2fs, I get the following output;

resize2fs: Can't read a block bitmap while trying to resize /dev/sys/usr.
The file system on /dev/sys/usr is now 665600 blocks long.

Any suggestions?

By: tytso ( Theodore Ts'o )
 RE: reasize2fs fails
2002-11-14 07:28
That's an LVM problem. e2fsck was very clear when it told you that device
was smaller than the size specified in the superblock.

...there was probably severe damage to the filesystem which was done,
because resize2fs attempted to shrink the filesystem down to 665600 from
the superblock size of 793600. But since LVM had apparently already gotten
the idea that the device was now smaller, any data that was stored in the
blocks between 665600 and 793600 has been lost.

......................................................................................

Any suggestions as to how I can proceed from here?
