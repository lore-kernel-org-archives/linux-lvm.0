Date: Mon, 1 Oct 2001 16:05:15 -0400
Message-ID: <20011001160514.A3450@ghettohack.net>
Mime-Version: 1.0
Content-Disposition: inline
From: Tim Ball <timball@ghettohack.net>
Subject: [linux-lvm] can't get initrd to work
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
To: linux-lvm@sistina.com

I'm trying to migrate a fresh debian install over to lvm+xfs. I
previously had built a 2.4.10 kernel w/ support for both xfs and lvm
that allows me to boot and read my lg stuff. The kernel is from the xfs
cvs tree..

Following the steps of the howto I've made an initrd using
lvmcreate_initrd. Then I added the proper lines to /etc/lilo.conf. When
I try to boot my "lvm" kernel I get two errors and then a kernel panic
complaining that it cannot open the root device, the following is what
I've retyped of the relievent info.

--snip--snip--snip--
VFS: Mounted root (ext2 filesystem).
Mounted devfs on /dev
lvmiopversion -- Exec of vgscan failed

lvmiopversion: No such file or directory
lvmiopversion -- Exec of vgchange failed

lvmiopversion: No such file or directory
VFS: Cannot open root device "3a00" or 3a:00
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 3a:00
--snip--snip--snip--

Now when I boot into my old root partition everything works and vgscan
and vgchange all do the proper thing... any hints or suggestions?

--timball
