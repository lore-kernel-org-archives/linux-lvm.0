Date: Thu, 16 Dec 1999 22:53:07 -0500 (EST)
From: Terry Hardie <terryh@orcas.net>
Subject: [linux-lvm] 0.7 Conflict with MD in 2.3.31
Message-ID: <Pine.LNX.4.21.9912162250390.24493-100000@orcas.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM <linux-lvm@msede.com>

I applied the 0.7 LVM patch to a 2.3.31 kernel. I'm moving from a number 
raid0 md devices to LVM, but if I have LVM in the kernel, and try to
activate any of the MD devices, I get a kernel oops (Doesn't die, just
kills the md program attempting to change the md array)

Is this a known incompatibility, and if not, should I post the oops with
symbols?

---
Terry Hardie					terry@gxc.com
Founder and Chief Technology officer		ICQ#: 977679
Convergence Equipment Co, Manassas, VA, USA	V: +1-703-361-5566
"Home of the BOB Class 4 convergence switch"
