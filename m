Message-ID: <3D19F9A0.9FBA6B7E@funsoft.com>
From: Gary Eheman <eheman@funsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM hang with some uses of raw i/o
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
Date: Wed Jun 26 12:30:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux-lvm <linux-lvm@sistina.com>

Greetings:
  I have been using and experimenting with LVM on linux with a product from my
employer.  I have had excellent results on a few different systems, but am
having difficulty with one now that is prompting me to post looking for help and
guidance.
  At the moment, I am using the LVM 1.1rc2 code, having upgraded from the 1.0.4
code when it was failing. The reason I went to the 1.1rc2 code was this is an
SMP system and I noticed SMP related fixes mentioned in the changelog.
  The hardware setup is an IBM x232 server with two 1.3Mhz cpus.  No raid
adapter. Four scsi drives on the scsi bus.  I took the last two drives, one 75G
and one 36G, put one large partition on each over all the space and set the
partition type to '8e'x. I then created two different volume groups, one each
containing each of those two drives. (Yes, I know about all of the many other
ways that I could define it multiple drives in one group. I did it this way for
a reason.)  I then created a set of logical volumes 2.8G in size on each of the
two volume groups. 
  The Linux setup is a Redhat 2.4.17 kernel.  I have used this same kernel tree
on a few other systems with LVM and our product with no difficulty.  We need to
use raw i/o with our product as can concurrently do tons of I/O to up to 255
slices (or logical volumes using LVM) and we use raw i/o on the other unix
platforms.
  Using the Suse whitepaper's suggestion, I automated one of our boot time
startup scripts to create a set of /dev/raw devices with my preferred names and
issue the raw command to associate the raw devices to the logical volumes. Since
Redhat already has a /dev/raw/raw1 thru /dev/raw/raw128, I decided to create
mine starting with minor 129.       

This all appears to work well as I end up with (one example)
crw-rw----    1 myowner   mygroup   162, 129 Jun 26 10:36 33903c0
and
raw -q /dev/raw/33903c0
/dev/raw/raw129:        bound to major 58, minor 16

and in /var/log/messages I see the timestamped messages like this:
/dev/raw/raw129:^Ibound to major 58, minor 16

I can use one of our utilities to prepare (format) the logical volume for use by
our
product by specifying "/dev/raw/33903c0"  with no difficulty and similarly for
all of the other logical volume names via their respective /dev/raw
specification.  Our product also seems to run ok with all of the /dev/raw/xxx
devices, too.

Here comes the problem description.

Two of our other utilties which will backup (read from) or restore (write to)
data to the /dev/raw devices cause Linux to hang (must reset or power off to
recover).  I have tried to do an strace of them, but it hangs the system before
any trace data has been written.  In an attempt to see if dd caused the same
problem, I used another system (laptop) with LVM and our product and strace'd
our utility to see what blocksize it was using for reads from the raw device.  I
then straced a dd bs=875520 if=/dev/raw/33903c0 of=/dev/null.  I ctrl-c killed
it after about 200 records.  I was just starting to look at that trace file
using vi when the system hung again!  This helps shine the light off of our
utilities (I think), though I also see that dd is not supposed to be used
against raw devices in the man pages.  The author of our utility is well aware
of the need to align the buffers, and the same code does work on other raw
devices on other LVM linux systems I have put together.

I need suggestions for debugging and/or other help to figure out what is going
on with this system. 
-- 
Gary Eheman
Fundamental Software, Inc.
http://www.funsoft.com
