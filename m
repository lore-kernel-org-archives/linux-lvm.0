Date: Fri, 30 Apr 1999 06:58:48 +0200 (MET DST)
From: Sven Wirth <wirth@decwww.rz.uni-leipzig.de@decwww.rz.uni-leipzig.de>
Subject: [linux-lvm] lvm 0.6 not work
Message-ID: <Pine.OSF.3.96.990430065818.6664A-100000@www.uni-leipzig.de>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi


I have install lvm 0.6 on my computer. I have patch the kernel, 
and then, I have build the tools, and a new kernel, with the lvm-
modules. after the reboot with the new kernel, I have call vgscan
This command is not running on my system an it give a errormessage.
	lvm_iop_version -- CALLD
	lv_status_internal -- AFTER ioctl ret: -105
	lvm_IOP_version -- LEAVING with ret: -105
I can't found a specialdevice lvm in the dev-dir. How can I create it.
What is the minor and major-number of the device. I hope anywhere can
help me.


bye s. wirth
