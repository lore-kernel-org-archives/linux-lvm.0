Date: Wed, 23 Feb 2000 16:30:51 +0000 (GMT)
From: A James Lewis <james@fsck.co.uk>
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 0.8final driver included
 in 2.3.47
In-Reply-To: <200002231218.NAA13040@u9etz.ez-darmstadt.telekom.de>
Message-ID: <Pine.LNX.4.20.0002231629010.14999-100000@vortex1.vrtx.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: linux-lvm@msede.com, linux-kernel@vger.rutgers.edu, linux-fsdevel@vger.rutgers.edu, mge@ez-darmstadt.telekom.de


Does anyone know if MD has also been included in 2.3 and if you can create
LVM's using MD devices?

On Wed, 23 Feb 2000, Heinz Mauelshagen wrote:

> 
> Logical Volume Driver 0.8final has been included in Linux 2.3.47.
> 
> Thanks to Linus and to hundreds on the Web who helped to achive this!
> 
> 
> Nevertheless some problems compiling 2.3.47 with LVM enabled arised
> because some parts of the patch got lost during inclusion 8.{(
> 
> You'll find the necessary patch to fix this at
> <ftp://linux.msede.com/lvm/v0.8final/patch-2.3.47-lvm-2>.
> 
> The version 0.8final of the user space library and tools can be found at
> <ftp://linux.msede.com/lvm/v0.8final/lvm_0.8final.tar.gz> as well.
> 
> New features are:
>    - support for multiple snapshot logical volumes per original
>      logical volume to for eg. enable consistent online backups
>      or recovery in filesystems and database systems.
> 
>    - sizes for eg. with lvcreate can be entered in fractions now
> 
>    - all errors now in plain text rather than numeric
> 
>    - variable VGDA backup history depth in /etc/lvmconf supported
>      by environment variable LVM_VG_MAX_BACKUPS (see vgcreate(8) and others)
> 
>    - automatic backup can be suppressed by environment variable
>      LVM_AUTOBACKUP (see vgcreate(8) and others) during bulk creates.
>      (the possibility to use option "-A n" with all
>       changing commands still exists)
> 
>    - enhanced debug tracing (Option -d of the tools) to show call depth
> 
> 
> Heinz
> -- 
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Systemmanagement CS-TS                           T-Nova
>                                                  Entwicklungszentrum Darmstadt
> Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
> Senior Systems Engineer                          Postfach 10 05 41
>                                                  64205 Darmstadt
> mge@EZ-Darmstadt.Telekom.de                      Germany
>                                                  +49 6151 886-425
>                                                           FAX-386
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
