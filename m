Message-ID: <002301bf0dc4$094485e0$030116ac@fd1>
From: "Fernando Dammous" <ferdam@internetcom.com.br>
References: <006201bf0bb7$6eae4a60$030116ac@fd1> <14324.58266.920834.895229@dukat.scot.redhat.com> <002e01bf0cf8$b4667720$030116ac@fd1> <19991003121415.A30243@redneck.sk.oracle.com>
Subject: Re: [linux-lvm] LVM, raw-io, devfs
Date: Sun, 3 Oct 1999 14:23:38 -0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: freddy@sk.oracle.com
Cc: "Stephen C. Tweedie" <sct@redhat.com>, Linux LVM msede <linux-lvm@msede.com>

Hi (again!),

From: Adrien Farkas <freddy@redneck.sk.oracle.com>
> Forget it, Linux port of Oracle DB doesn't support raw-io.

I admit that I'm not a deep expert of Oracle, mainly regarding interaction
with the I/O devices and with the operating system.

However, I have been finding in the documentation of Oracle for Linux,
several references of utilization of RAW-DEVICES (among others).
I'm not, here, wanting to create controversy, because it is dealt with a
matter extra-LVM and being you a member of Oracle (I saw for your e-mail
address freddy@sk.oracle.com), you must have knowledge of this subject. Then
I ask:
 What does mean the references about RAW-DEVICES in documentation?
To illustrate, I separated some from :

Oracle8 Administrator's Reference for LINUX
Release 8.0.5
A66585-01

<SNIP>
- Tuning of I/O Loads across all Drives
I/O loads are tuned across all drives, including drives storing Oracle data
in raw devices
<SNIP>
- Raw Device Sizes
Choose a small set of standard sizes for all raw devices that may be used to
store Oracle database files.

In general, standardizing on a single size is recommended. If a single size
is used, raw files can be moved from one partition to another safely. The
size should be small enough so that a fairly large number can be created,
but large enough to be convenient.

For example, a 2 GB drive could be divided into 10 partitions of 200 MB
each-a good balance between size and number. Any tablespace using raw
devices should stripe them across several drives. If possible, the striping
should be done with a Logical Volume Manager."
<SNIP>
- Tuning the LINUX Buffer Cache Size
To take full advantage of raw devices, adjust the size of the Oracle8 buffer
cache and, if memory is limited, the LINUX buffer cache.

The LINUX buffer cache is provided by the operating system. It holds blocks
of data in memory while they are being transferred from memory to disk, or
vice versa.

The Oracle8 buffer cache is the area in memory that stores the Oracle
database buffers. Since Oracle8 can use raw devices, it does not need to use
the LINUX buffer cache.

When moving to raw devices, increase the size of the Oracle8 buffer cache.
If the amount of memory on the system is limited, make a corresponding
decrease in the LINUX buffer cache size.

The LINUX command vmstat may help you determine which buffer caches should
be increased or decreased.
<SNIP>
------------------------

Cheers and sorry for the long mail!
Fernando
