Message-ID: <389F6445.218E6DD7@msede.com>
Date: Tue, 08 Feb 2000 01:33:09 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: lars@larsshack.org
MIME-Version: 1.0
Subject: [linux-lvm] Building lvm tools? (fwd)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message ...

-------- Original Message --------
Date: Sun, 6 Feb 2000 21:19:53 -0500 (EST)
From: Lars Kellogg-Stedman <lars@toad.bu.edu>
Reply-To: lars@larsshack.org
Subject: Building lvm tools?
Sender: Lars Kellogg-Stedman <lars@larsshack.org>

Howdy,

I'm trying to build the lvm under RedHat 6.1 (linux 2.2.14 + devfs),
and
while the kernel patch applies and builds just fine (even with devfs),
I've
run into some problems with the lvm tools.

I'm using the 0.8-pre02.10.1999 release of the tools.

After typing 'make', the build dies with errors along these lines:

  cc -c -pipe -Wall -I/usr/src/LVM/0.8-pre02.10.1999/tools
-I/usr/src/LVM/0.8-pre0
  2.10.1999/tools/lib -I/usr/src/LVM/0.8-pre02.10.1999/kernel
-D__KERNEL__ -O2 -DD
  EBUG -o debug.o debug.c
  In file included from /usr/include/linux/fs.h:20,
		   from /usr/include/linux/devfs_fs_kernel.h:4,
		   from /usr/include/linux/genhd.h:14,
		   from /usr/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
		   from basename.c:26:
  /usr/include/linux/stat.h:12: warning: `S_IFMT' redefined
  /usr/include/sys/stat.h:92: warning: this is the location of the
previous defini
  tion
  /usr/include/linux/stat.h:13: warning: `S_IFSOCK' redefined
  /usr/include/sys/stat.h:105: warning: this is the location of the
previous defin
  ition
  [...ad nauseum...]

These errors occur for virtually every file in the distribution.  Has
anyone else encountered this problem?

-- Lars

-- 
Lars Kellogg-Stedman <lars@larsshack.org> -->
http://www.larsshack.org/
