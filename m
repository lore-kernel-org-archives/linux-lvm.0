Message-Id: <199905030943.AA05699@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] lvm 0.6 not work
Date: Mon, 03 May 1999 11:41:24 METDST
In-Reply-To: <Pine.OSF.3.96.990430065818.6664A-100000@www.uni-leipzig.de>; from "Sven Wirth" at Apr 30, 99 6:58 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wirth%decwww.rz.uni-leipzig.de@decwww.rz.uni-leipzig.de
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> I have install lvm 0.6 on my computer. I have patch the kernel, 
> and then, I have build the tools, and a new kernel, with the lvm-
> modules. after the reboot with the new kernel, I have call vgscan
> This command is not running on my system an it give a errormessage.
> 	lvm_iop_version -- CALLD
> 	lv_status_internal -- AFTER ioctl ret: -105
> 	lvm_IOP_version -- LEAVING with ret: -105
> I can't found a specialdevice lvm in the dev-dir. How can I create it.
> What is the minor and major-number of the device. I hope anywhere can
> help me.
> 

Please install patch lvm_0.6-patch-150399a.gz too to fix the problem.
You can find it at <ftp://linux.msede.com/lvm/v0.6>.

Regards,
Heinz
--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
