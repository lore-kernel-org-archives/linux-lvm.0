From: "Michael Roever" <mroever@earthlink.net>
Subject: [linux-lvm] FW: LVM 256 logical volume limit
Date: Mon, 3 Apr 2000 23:12:19 -0500
Message-ID: <000801bf9deb$f7f3f920$2bcb1b3f@dell01>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux-LVM list <linux-lvm@msede.com>

I know others have stated this before, but I am impressed with what has
been accomplished and I thank all of the developers for all your hard work.


I have a question regarding the limit of 256 total logical volumes in
lvm.h.


At first glance supporting a total 256 logical volumes across up to 99
volume groups using file systems seems to be a reasonable design.  The
issue that I have is when you are running very large databases using raw
devices and need additional logical volumes.  Having only a total of 256
logical volumes available becomes a problem.

An Oracle RDBMS for example (for anyone who might not know) uses the
concept of "tablespaces" for storage management.  Relational Tables are
allocated in tablespaces.  A tablespace consists of one or more data
files, i.e. logical volumes.  I generally choose to define these logical
volumes in 1GB increments.  This size is chosen 1) to not waste space 2)
spread I/O around as mush as possible for parallel access.  In this
example I could support an RDBMS size of 256GB or if using 2GB slices it
could be a 512GB RDBMS.  For anyone who might wonder why, when you deal
in the terabyte size data warehouses, disk placement is important even
with RAID.

I am wondering what it would to take change the LVM code to support more
volume groups and logical volumes.  I would like to see the Logical
Volume Manager support something along the lines of the following:

     Volume Groups:  1024
   Logical Volumes:  2048 per volume group




There is a secondary reason for this question.  I am considering
starting an open source project to bring to Linux one of the enterprise
capabilities that exists on the IBM RS/6000 SP systems.  The RS/6000 SP
is a Massively Parallel Processor machine (MPP) that uses a shared
nothing architecture.  IBM created a technology called "Virtual Shared
Disk" to allow a non-shared disk environment too appear as if it was a
full-shared disk implementation.  With this ability, products like
Oracle Parallel Server that requires a shared disk architecture can run
on a loosely coupled cluster.

The VSD device appears as a raw I/O type device, such as a raw logical
volume.  From the application point of view, there is no distinct
difference between the VSD and the logical volume device.  This is
accomplished by first determining which node can satisfy the I/O
request.  If the logical volume is locally attached, then the request is
handed off to the local LVM.  If the I/O request is resolved to a remote
node, the I/O request is packaged up and sent across a high-speed link
to the VSD logic on the remote node to complete the I/O request and send
it back to the requestor.

In order to accomplish this, a LVM is a prerequisite.  In a large
cluster, you have the potential to have a large number of volume groups
and a very large number of logical volumes.



    +-------------+                      +-------------+
    | Application |                      | Application |
    +-------------+                      +-------------+
        |    /|\                             |    /|\
        |     |                              |     |
       \|/    |                             \|/    |
 +--------------------+              +--------------------+
 |         VSD        |              |  +---------------+ |
 | |    /|\     | /|\ |              |  |     VSD       | |
 | |     |      |  |  |              |  | +-------+     | |
 +-|-----|-+    |  |  |              |  | |     +-|-----|-|
 | | LVM | |    |  |  |              |  | |     | | LVM | |
 +-|-----|-+----|--|--+              +--|-|-----+-|-----|-+
   |     |      |  |                    | |       |     |
   |     |    +-|--|--------------------|-|--+    |     |
   |     |    | |  |                    | |  |    |     |
   |     |    | |  +--------------------+ |  |    |     |
 +-|-----|-+  | +-------------------------+  |  +-|-----|-+
 | |     | |  | high speed pipe/interconnect |  | |     | |
 |\|/    | |  +------------------------------+  |\|/    | |
 |         |                                    |         |
 |  DISK   |                                    |  DISK   |
 |         |                                    |         |
 +---------+                                    +---------+

The above figure depicts the concept of the Virtual Shared Disk showing
two distinct nodes each having a single local disk.  Yet, both disks are
available to both nodes in full R/W mode.




I am very interested in the thoughts and ideas of the developers and I
look forward to your comments and ideas.

Michael Roever
mroever@earthlink.net

"We are humans.  They are machines.  We are in control... OK, so most of the
time we are in control"
