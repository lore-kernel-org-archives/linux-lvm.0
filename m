Date: Tue, 12 Oct 1999 11:36:33 -0500 (EST)
From: theodore russell wickell <twickell@indiana.edu>
Subject: [linux-lvm] VFS mounting root.
Message-ID: <Pine.HPP.3.96.991012113037.14665C-100000@falstaff.ucs.indiana.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi,

I just wanted to post the entire message I get when I boot my 2.2.12
Kernel with LVM patch patch-2.2.11-LVM with LVM compiled as a module.

request_module[block-major-8]: Root fs not mounted
VFS: Cannot open root device 08:01
Kernel panic: VFS: Unable to mount root fs on 08:01

My /dev/sda1 is major number 8 minor 1. I have not set the partition id or
done any lvm commands since I thought I had to be rebooted with the lvm
module loaded. Does anyone know why I am having this problem? I can try to
answer any questions if I'm being vague. 

Thanks,
Rusty


----------------------------------------------------------------------------
Rusty Wickell					200 S. Jordan Ave.
Digital Library Sytem Administrator		Simon 060
Indiana University				Bloomington IN 
812-856-5174					47405
----------------------------------------------------------------------------
