Message-Id: <3C9A4638.2BB85101@wingenbach.org>
From: John Wingenbach <linux-lvm@wingenbach.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] serial console and initrd
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
Date: Thu Mar 21 14:44:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux lvm <linux-lvm@sistina.com>

Hello,

I could use a little help on this one.  I just built an initrd (via
lvmcreate_initrc) so that I could boot w/ my root fs in LVM.  It worked
great except I lost my serial console.  It is as if the serial console
is lost due to the initrd.  Prior to using an init ramdisk, I was having
no issues with my serial console support from the kernel.

TIA,

John
