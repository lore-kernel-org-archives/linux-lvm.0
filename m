Message-ID: <38B3E2C4.2CF3C68D@moose.net>
Date: Wed, 23 Feb 2000 08:38:12 -0500
From: Brian Kress <kressb@moose.net>
MIME-Version: 1.0
Subject: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 0.8final driver included in 2.3.47
References: <200002231218.NAA13040@u9etz.ez-darmstadt.telekom.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: linux-lvm@msede.com, linux-kernel@vger.rutgers.edu, linux-fsdevel@vger.rutgers.edu, mge@ez-darmstadt.telekom.de

Heinz Mauelshagen wrote:
> 
> Logical Volume Driver 0.8final has been included in Linux 2.3.47.
> 
> Thanks to Linus and to hundreds on the Web who helped to achive this!
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

	Great!  2.3.x is almost to the point where it
has all the features I need to use it.  :)  One important
question:
	Is the I/O protocol for 0.8final the same as 0.8i?  
If not, is there a 0.8final for 2.2.x?  Basically, I don't
want to install the 0.8final userspace tools and find
that I can't use 2.2.x anymore.
	And on a completely unrelated note, anyone know
if RAID5 is working in 2.3.x yet?  It blows up everytime
I try it.


Brian
