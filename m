From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200002231551.QAA07344@u9etz.ez-darmstadt.telekom.de>
Subject: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 0.8final driver included in 2.3.47
In-Reply-To: <38B3E2C4.2CF3C68D@moose.net> from Brian Kress at "Feb 23, 2000  8:38:12 am"
Date: Wed, 23 Feb 2000 16:51:46 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Brian Kress <kressb@moose.net>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> Heinz Mauelshagen wrote:
> > 
> > Logical Volume Driver 0.8final has been included in Linux 2.3.47.
> > 
> > Thanks to Linus and to hundreds on the Web who helped to achive this!
> > 
> > Nevertheless some problems compiling 2.3.47 with LVM enabled arised
> > because some parts of the patch got lost during inclusion 8.{(
> > 
> > You'll find the necessary patch to fix this at
> > <ftp://linux.msede.com/lvm/v0.8final/patch-2.3.47-lvm-2>.
> > 
> > The version 0.8final of the user space library and tools can be found at
> > <ftp://linux.msede.com/lvm/v0.8final/lvm_0.8final.tar.gz> as well.
> > 
> 
> 	Great!  2.3.x is almost to the point where it
> has all the features I need to use it.  :)  One important
> question:
> 	Is the I/O protocol for 0.8final the same as 0.8i?  

No, it had to be changed caused by the snapshot implementation.

> If not, is there a 0.8final for 2.2.x?

Soon.

> Basically, I don't
> want to install the 0.8final userspace tools and find
> that I can't use 2.2.x anymore.
> 	And on a completely unrelated note, anyone know
> if RAID5 is working in 2.3.x yet?  It blows up everytime
> I try it.

No it doesn't work so far (the options in Configure.help
are disabled since 2.3.47)

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
