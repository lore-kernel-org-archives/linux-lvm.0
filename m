From: Doug Miller <orkim@kc.rr.com>
Message-Id: <20020318001846.2dc378a7.orkim@kc.rr.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvmcreate_initrd problems?
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
Date: Mon Mar 18 00:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

First I'd like to take the time to say how much I like LVM. Keep up the
excellent work.

That said, I am having a bit of a problem. Let me set the stage for you.

I installed LVM when I installed my distro (Gentoo, www.gentoo.org). 
The boot CD does not use devfs but I do use it after I've insatlled the
distro.  I have my root inside the LVM along with all my other
partitions besides /boot.  I haven't experienced any problems until now.
I had been using kernel 2.4.18 and am downgrading to 2.4.17 because of
some patches that I would like to use.  When rebooting with the new
kernel the messages on the screen seem to indicate that root file system
(reiserfs, /dev/vgroup0/root) was mounted successfully read-only.  I get
a message about devfs do_symlink_root (I'm not 100% sure on that, I
didn't write it down) that fails and then i get a change root error.  If
these errors are needed verbatium, I can get them.  After this I get an
"Invalid Operand" from the kernel and a CPU register dump.  Followed by
an "kernel killed init".  This was all from memory, but I beleive it to
be correct.

I guess the first question I should ask is if this sounds like a kernel
problem or lvmcreate_initrd script problem.  I have tried running
lvmcreate_initrd from my devfs enabled system (using the 2.4.18 kernel)
and from the Gentoo Boot CD (using a non devfs, 2.4.17 kernel) with no
luck.  I have browsed the archives and found a few hints but nothing
that solved my problem.

I would appreciate *any* help that could resolve my issues.  And agagin,
great work, keep it up. :)

Thanks in advance.

Regards,

Doug Miller
