Message-Id: <5.1.0.14.2.20020313224659.0353c8a0@.>
From: Ed Jackson <ej_external@bigfoot.com>
MIME-Version: 1.0
Subject: [linux-lvm] help with redhat install
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Mar 13 22:04:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm trying to install and use LVM on my redhat - but I'm having 
difficulties getting started.

I've tried to download and use the binaries at ftp.msede.com:

ftp://linux.msede.com/lvm/binaries/redhat/base/lvm-base-1.1-1.i386.rpm
ftp://linux.msede.com/lvm/binaries/redhat/base/lvm-base-1.1-1.src.rpm

and also all of the following files in:

ftp://linux.msede.com//lvm/0.9.1_beta/binaries/redhat/

lvm-iop10-0.9.1_beta7-1.i386.rpm
lvm-iop10-lib-0.9.1_beta7-1.i386.rpm
lvm-iop10-man-0.9.1_beta7-1.i386.rpm
lvm-iop10-patchgen-0.9.1_beta7-1.i386.rpm


When I install all of those RPMs with gnorpm, and try to run the wrapped 
shell scripts for anything to do with LVM (like pvcreate) I get an error 
message stating:

-------------- sample message --------------
vgcreate
lvmiopversion -- LVM driver/module not loaded?

vgcreate: /lib/lvm-iop not found.  Is lvm-iop installed?
-----------------------------------------------

And when I search the current filesystem for anything named *lvm-iop* I get 
nothing.

I have added the following to /etc/modules.conf

alias block-major-58 lvm-mod
alias char-major-109 lvm-mod




Since that didn't seem to work - I removed those RPMs and tried to download 
the latest from ftp://ftp.sistina.com/pub/LVM/1.0/ and unpacked all 
files.  When I follow the instructions in the lvm-howto doc.. I run 
LVM/1.0.1-rc4/configure script, which seems to complete fine.

I then cd into PATCHES and try to run 'make' and get the following error:

-------------
make
You haven't applied the rawio patch, please see the README
make: *** [check_rawio] Error 1
---------------

The README file only discusses the raw_io patch if I'm using a 2.2 
kernel.  But i'm currently using 2.4.9-31


Can anyone please help me out with this?  I'd like to just use the RPMs if 
possible - and the source code next if the RPMs don't work out.


Thanks, Ed
