Message-ID: <OF9DCE2190.BDA97513-ON86256B20.0072EBC9@TEXASMUTUAL.COM>
From: "Jonathan S. Polacheck" <JPolache@texasmutual.com>
MIME-Version: 1.0
Subject: [linux-lvm] CONFIG_EXT2_RESIZE
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
Date: Wed Dec 12 14:55:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In  order  to  use ext2online, I need to have the Online ext2 resize
support (CONFIG_EXT2_RESIZE) compiled into the kernel  (this  is  an
optional patch for the 2.x series of kernels).  I downloaded
lvm_1.0.1-rc4.tar.gz and created the patch file.  I then applied it using
"patch" and answering "y" to "assume -R".  Then I went looking for
CONFIG_EXT2_RESIZE in "make menuconfig".  No luck.  Any suggestions?
