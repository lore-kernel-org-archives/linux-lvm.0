Return-Path: <hadmut@danisch.de>
From: Hadmut Danisch <hadmut@danisch.de>
Date: Thu, 31 May 2001 12:08:38 +0200
Message-ID: <20010531120838.A8517@xlink.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Severe bug in kernel-2.4.4 lvm
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


Hi,

sorry, if this was discussed before, but 
I'm new on this list.


I just crashed several data file systems
due to a bug in kernel-2.4.4 lvm. (seems
to contain lvm 0.9.1-beta2)

I'd suggest to incorporate latest lvm 
versions into 2.4 kernels. As far as
a collegue told me, lvm's kernel patches
do not work with kernels later than 2.4.3.
So there seems to be no way to fix the bug
with later kernels.


Bug description:

I have to disks, each with one lvm partition.
First disks has volume group A, second one
has volume group B. Volume groups were created
with one of the pre-2.4 kernels and worked
very well so far.

Since a (windows) programm ruined some of the
partitions of the first disk, I was trying to
completely reinstall the first disk. Since
current debian lvm tools don't work properly
with current kernel, I used older 0.9 tools, 
which also worked well so far.

First problem: After creating logical volumes
in VG A, these volumes appeared normaly in 
/dev/A, but accessing was impossible, kernel 
claimed that these are not block devices.
After repeating the procedure and rebooting
it worked.

I've created several logical volumes in 
/dev/A and made reiserfilesystems. I could also 
mount them, but df showed, that some of the
logical volumes were much larger than chosen
when creating the volumes.

I found that even when I created them in 
VG A and they appeared in /dev/A, some of them
were actually logical volumes in VG B.
With making filesystems in the A volumes, I
erased data of some logical volumes in VG B.

(Heavy loss of data).


Any idea how to fix the bug (or to rescue lost
data?)



regards
Hadmut
