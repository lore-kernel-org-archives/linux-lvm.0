Message-ID: <31A612FE6020D2119F6400A0C9B67EBB116F13@fthw901e.as.fth.sbs.de>
From: Franken Klaus <Klaus.Franken@fth2.siemens.de>
Subject: [linux-lvm] valid_majors
Date: Fri, 25 Feb 2000 16:19:32 +0100
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Linux-Lvm (E-Mail)" <linux-lvm@msede.com>

Hi,

is there a way to give the list of valid majors at runtime (in commandline or in a
configuration file) ?

Problem: 'vgscan' needs circa 1 hours on a 486 test machine. Thousands of 'mordprobe' are 
executed because the lvm.tools are of cause compiled under the running kernel.
This kernel has activated nearly all disk-drivers (most of them as module), so vgscan
scans all this devices and load all modules...
I can't change the kernel-configuration, because it is the SAP-linuxkernel and I want
have a non-system-specifiv lvm-package.
BTW: I have an lvm.rpm, if needed....

Maybe the more flexible way is to create a configuration file, for example /etc/lvm/valid-majors,
where the administrator can include and exclude devices.
If this file don't exist, the old behaviour keeps.



Klaus.Franken@fth2.siemens.de    +49 911 978 3707
Siemens Business Services IP 21F
