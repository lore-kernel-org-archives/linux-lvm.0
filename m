Message-ID: <20010908074256.72205.qmail@web13008.mail.yahoo.com>
Date: Sat, 8 Sep 2001 00:42:56 -0700 (PDT)
From: "Taher H. Haveliwala" <taherh24@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] installing lvm 1.0 on stock RedHat 7.1
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

I installed lvm on a stock RedHat 7.1 installation
without rebuilding the kernel (and without rebooting)
as follows:

(If this is common knowledge, I apologize in advance,
but I didn't see it in the docs, howto, or mailing
list archives.)

(as root)

1) install the kernel sources rpm
(kernel-source-2.4.2-2.rpm)
2) follow the instruction in the lvm tarball for
creating a patch for the kernel.  Apply the patch. 
Note that since only the lvm module files are modified
by the patch (at least for stock redhat 7.1), you
won't need to rebuild the whole kernel.
3) cd /usr/src/linux-2.4
   gmake mrproper
   gmake xconfig
4) "Load Configuration from File"
   Load up the file in /usr/src/linux-2.4/configs/
that matches the kernel you are currently running.  If
you don't pick the right one, step 9/10 will fail. 
'uname -a' might help you pick.
5) Go to "Multi-Device Support" and check off module
support for lvm.
6) Save and quit
7) gmake dep
   gmake modules
8) cp drivers/md/lvm-mod.o
/lib/modules/2.4.2-2/kernel/drivers/md/
9) /sbin/depmod -a
10) /sbin/modprobe lvm-mod

and to check:

11) ls /proc/lvm

Voila, it's there, an no reboot necessary.  Continue
following the rest of the steps in the lvm tarball.

Most of the above was probably obvious, except for the
part about loading the right file from configs/, so
that you don't get module versioning problems.

I imagine the above should work with minor changes
regardless of which redhat kernel rpm you're currently
using.

Taher




__________________________________________________
Do You Yahoo!?
Get email alerts & NEW webcam video instant messaging with Yahoo! Messenger
http://im.yahoo.com
