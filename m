Message-ID: <OFE8C7233D.E443DB74-ON86256BC8.005050DC@lsu.edu>
From: "Michael K Lambert" <mlambe7@lsu.edu>
MIME-Version: 1.0
Subject: [linux-lvm] FYI - Red Hat 7.2 and LVM module
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
Date: Wed May 29 10:33:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello, all.

Although RH does not support LVM in 7.2, I've been making use of it by
compiling my own kernel. The LVM patches will not patch clean on my RH 390
systems, so we are stuck at version .9.1, but it does work. Just yesterday
I built a new kernel and compiled LVM as a module for the first time. After
building the kernel, I rebooted and was surpirsed to see that LVM did not
initialize. After boot, I could run vgscan manually and lvm would become
active, but not during boot up.

After looking into rc.sysinit, I found that for vgscan to run, three
conditions needed to be met.../sbin/vgscan had to exist, /etc/lvmtab must
exist, and /proc/lvm must exist. Unfortunately, when lvm is modularized,
the /proc entry is created whenever the module is loaded, not permanently.
This causes the rc.sysinit test to fail and LVM is not initialized. Of
course, it is simple to work around this. I changed rc.sysinit to test for
/proc/lvm OR the existence of the lvm-mod, and that seemed to work fine.
This is just an FYI so that others in similar circumstances can avoid any
confusion.

Michael Lambert
