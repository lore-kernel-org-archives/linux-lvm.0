From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200002251629.RAA19805@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] valid_majors
In-Reply-To: <31A612FE6020D2119F6400A0C9B67EBB116F13@fthw901e.as.fth.sbs.de> from Franken Klaus at "Feb 25, 2000  4:19:32 pm"
Date: Fri, 25 Feb 2000 17:29:05 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Franken Klaus <Klaus.Franken@fth2.siemens.de>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> Hi,
> 
> is there a way to give the list of valid majors at runtime (in commandline or in a
> configuration file) ?

No.

The basic idea is that LVM should find all existing disk instances in
the system (including MD, LOOP ect. devices) without the user to care about it.

Problem is the overcrowded /dev directory of today.

devfs can help with that (and other issues) as well.

The actual 0.8final code uses /proc/partitions fastening the process
of scanning, if it exists and falls back to scan /dev if it doesn't.

> 
> Problem: 'vgscan' needs circa 1 hours on a 486 test machine.

Oops.

SAP-linuxkernel on 486 ;-{)

> Thousands of 'mordprobe' are 
> executed because the lvm.tools are of cause compiled under the running kernel.
> This kernel has activated nearly all disk-drivers (most of them as module), so vgscan
> scans all this devices and load all modules...
> I can't change the kernel-configuration, because it is the SAP-linuxkernel and I want
> have a non-system-specifiv lvm-package.
> BTW: I have an lvm.rpm, if needed....
> 
> Maybe the more flexible way is to create a configuration file, for example /etc/lvm/valid-majors,
> where the administrator can include and exclude devices.
> If this file don't exist, the old behaviour keeps.

If you can't use the actual LVM driver/lib/tools and/or devfs
a workaround might be to move away all /dev blockdevice entries you don't need
in your specific hardware configuration to a different directory.

Heinz
-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
