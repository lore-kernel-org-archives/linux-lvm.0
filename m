Message-ID: <44660.80.67.170.17.1028814831.squirrel@rezo.net>
From: "Antoine" <antoine@rezo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] can't mount ext3 snapshot (cont'd)
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
Date: Thu Aug  8 08:53:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

Having problems with mounting a snapshot, I applied the following advice :

"You need to apply the VFS lock patch included in the source distribution.

note: the VFS lock patch is 1.0.4 is rather broken so use the one from 1.0.5
- it'll be fine with a 1.0.4 kernel."

However, after applying the patch, recompiling the kernel, and then
rebooting, I still have the same problem :

# mount -v /dev/vgdata/backup /backup/
mount: you didn't specify a filesystem type for /dev/vgdata/backup
       I will try type ext3,ext2
mount: block device /dev/vgdata/backup is write-protected, mounting read-only
mount: wrong fs type, bad option, bad superblock on /dev/vgdata/backup,
       or too many mounted file systems

Furthermore, there is another error message on the console :

EXT2-fs: lvm(58,1): couldn't mount because of unsupported optional
features (4).
Please note : the original LV the snapshot is taken on has the option
"noatime" set. Could the problems come from this one ?

(NB : kernel 2.4.18 SMP from kernel.org, LVM 1.0.5)


Regards

Antoine.
