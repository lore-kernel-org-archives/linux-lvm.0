Message-ID: <001801c2f2b7$e8e676f0$c70aa8c0@RD.proware.com.tw>
From: "Rocky Lee" <rocky_lee@proware.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] make kernel with XFS patch fail..
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
Date: Tue Mar 25 04:18:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

hi all

I patch the LVM 1.0.7 (1.0.6) patch file and XFS patch file for kernel
2.4.19
, but fail when I ddid "make bzImage"

Error Message------------------------------------------------------------

fs/fs.o: In function `fsync_dev_lockfs':
fs/fs.o(.text+0x32cd): undefined reference to `DQUOT_SYNC'
make[1]: *** [kallsyms] Error 1
make[1]: Leaving directory `/usr/src/linux-2.4.19'

----------------------------------------------------------------------------
--

if I only "make bzImage" with LVM patch, OK
if I only "make bzImage" with XFS patch, OK
if I make with LVM and XFS patch..... fail...

does anyone know this condition?

Rocky
