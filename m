From: Andrew Popov <guliver@svnets.lv>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200310041600.47291.guliver@svnets.lv>
Subject: [linux-lvm] Problem compiling kernel 2.4.20 with epcam.diff
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
Date: Sat Oct  4 08:02:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

I want to compile kernel 2.4.20 with my webcam support (Creative)
I download epcam-0.6.diff(patch against 2.4.20) from 
http://members.brabant.chello.nl/~j.vreeken/se401/

After patching the kernel have following error:

Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/block/loop.o 	
blk_ioctl
...

Anybody can help me?

Andrew.

PS. linux kernel source distributive was clean (make clean; make mkproper)
