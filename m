Date: Wed, 29 Dec 1999 13:55:48 -0500 (EST)
From: Terry Hardie <terryh@orcas.net>
Subject: [linux-lvm] Bug in 0.8i - lvm_tab_vg_check_exist_all_vg.c
Message-ID: <Pine.LNX.4.21.9912291354170.492-100000@orcas.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM <linux-lvm@msede.com>

After line 95 of the aforementioned file, there is a missing "data =
NULL;", which causes a crash when /etc/lvmtab is small (< 2 bytes)

---
Terry Hardie					terry@gxc.com
Founder and Chief Technology officer		ICQ#: 977679
Convergence Equipment Co, Manassas, VA, USA	V: +1-703-361-5566
"Home of the BOB Class 4 convergence switch"
