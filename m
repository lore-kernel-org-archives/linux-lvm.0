Message-ID: <34BE27FD7F4BD111B9C600805F15B7DC016E7DAB@info-akh.linz.at>
From: Michelic Adalbert <adalbert.michelic@akh.linz.at>
Subject: Solution: [linux-lvm] Cannot access VG due to "hd error"
Date: Sun, 6 Aug 2000 11:05:30 +0200 
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

Hello,

now i know, what has happened:

Michelic Adalbert wrote:
> Could it be, that the LVM on-disk structures are corrupted and
> vgscan therefore accesses the disk in a wrong way which then
> causes this kernel messages?

The VGDA of PV on my /dev/hdc-disk (whole disk) caused the problems,
because the data of the VGDA looked like a valid partition table -
and the kernel identified a partition /dev/hdc1 on this disk (which
in fact, didin't exist and was about twice the size of the disk
(according to /proc/partitions)). vgscan therefore tried to read
data from /dev/hdc1, but I think, the location of the partition
was invalid nand the read-operation then caused these errors.
I have now patched my kernel to ignore any partitions on /dev/hdc -
and now everything is okay again.

I think about 2 solutions to prevent further problems like this:
  1. Not using a whole disk as PV (easy).
  2. Make the kernel know about PV's as whole disk and then
     not try to scan for partitions.

( 3. Include some validity-checks into the kernel to prevent
     detecting partitons that are bigger than the disk or located
     outside of the disk.    )

Rgds, Adalbert
