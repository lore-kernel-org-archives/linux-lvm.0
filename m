Return-Path: <harvell@nortelnetworks.com>
Message-ID: <3B0EE5FA.1923148@americasm01.nt.com>
Date: Fri, 25 May 2001 18:08:42 -0500
From: "Joe Harvell" <harvell@nortelnetworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm on root filesystem with devfs
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
To: linux-lvm@sistina.com

I made a custom initrd to bring up lvm on my root filesystem.  When not
running a kernel with devfs, I simply cpio the /dev entries from the ram
filesystem into the lvm root filesystem before doing pivot_root.  This
is so the remaining lvm filesystems can be mounted.  Everything works
fine in this case.

When I run with devfs, though, the /dev entries don't ever show up in
/dev when I do a vgscan.  The result is that I am not able to mount the
lvm root filesystem.


   * Does the fact that I have lvm compiled as a module have anything to
     do with this?
   * Assuming the entries are created, then I shouldn't have to use cpio
     anymore (with devfs).  Right?

---
Joe Harvell
