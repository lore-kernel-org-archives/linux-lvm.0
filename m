Return-Path: <tack@orion.dok.org>
Date: Mon, 13 Aug 2001 20:05:13 -0400
From: Jason Tackaberry <tack@linux.com>
Message-ID: <20010813200513.A22939@linux.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] RFC: Visual Disk Administrator project
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

Below is an initial project plan for the GUI disk administration tool I
have been talking about that I'm calling Visual Disk Administrator
(VDA).  This is an RFC, so please let me know of any suggestions and
general comments you have about the proposal.  It is mostly a collection
of my thoughts over the last couple of days.  There's a URL below with
some small mock-up images, so read on ...

-----

Primary Goal: A comprehensive GUI disk administration tool for Linux
that makes managing software RAID devices and logical volumes as simple
and user-friendly as possible, as well as providing a convenient-to-use
interface for typical tasks such as partitioning disks, and creating,
resizing and tuning file systems.

Under the scenes, VDA will handle partitions, physical volumes, md
devices, and volume groups, and logical volumes (hopefully) seamlessly.
In particular, I want md and LVM to work transparently together.  You
should be able to create a volume-managed RAID5 configuration without
worrying about md or lvm differences.  

Consequently, this is going to sacrifice some flexibility.  But that's
fair game for a GUI tool.  Flexibility is gotten from the command line
and manual setup.  How much flexibility I'm talking about here is open
for debate. 

The interface will be organized into the following categories:

 - Controllers
 - Disks
 - Volume Groups
 - Logical Volumes
 - File Systems

Each of those categories can have 2 different types of views: a tree
view, and an object view.  The tree view is simply a hierarchical list
of the particular category.  For example:

   controllers
   |
   +-- ide0
   +-- ide1

or

   disks
   |
   +--- hda
   |    |
   |    +-- hda1
   |    +-- hda2
   +--- hdb

etc.

The object view is a graphical model (in a canvas) of the category.  The
main purpose of the object view is to quickly let you get an overall
picture of your disk setup.  Ideally, the object view should scale well.
In other words, complex disk configurations should not get so visually
cluttered that it defeats the purpose of the view.  (This is harder than
it sounds!)

I have made mock-ups of how I want to represent certain configurations
of volume groups.  These mock-ups are modelled after screenshots of
Veritas Volume Manager 3.0.  I welcome comments and suggestions about
these too.  They can be viewed at:

   http://sault.org/vda/mock.html
 
(For those reading this email in an archive, this URL is temporary and
will probably go away in a few weeks.)

When looking at these sketches, keep in mind that one of my goals is to
seamlessly merge LVM and md at the GUI level.

Here is a summary of the categories:

Controllers: A view of all disk controllers (SCSI and IDE initially),
and information about the devices.  Any tuning parameters available for
the controller can be interfaced here.

Disks: A view of all hard disks attached to the known controllers above.
This view will also list partitions, and allow the user to partition the
disks or modify existing partitions.  Tuning parameters (such as
enabling DMA on IDE disks) will be available here.  Resizing partitions
probably won't be allowed -- can LVM cope if one of its physical volumes
gets resized?

Volume Groups: A view of all LVM controlled volume groups.  This is
where all the real LVM/md functionality will happen.  The user should be
able to create a volume group that may contain plain partitions, RAID0,
RAID1, RAID0+1, and RAID5, any number of which may be linearly
concatenated together.  (e.g. a volume group that concatenates 3 disks
in a RAID5 setup and 2 other disks in a RAID1 setup.)  I see md
happening below the LVM in all cases for simplification.  In this
section you should be able to monitor the health of your volume groups,
and any md devices inside them.  If a disk encapsulated by an md device
is failing or recovering this information should be visually obvious.

Logical Volumes: A view of all logical volumes in all volume groups.
Here you will be able to remove, add, and resize logical volumes.
Resizing a logical volume will also resize a filesystem (if the user
requests it) if that filesystem supports resizing, and, of course, if a
filesystem actually exists on the logical volume.

Filesystems: A view of all known filesystems in all logical volumes and
all non-LVM-controlled partitions.  If the filesystem is mounted, it
will show the mount point.  Resizing operations will also be available
here if the filesystem supports it, with the option to modify the
size of the underlying logical volume if one exists.  Also,
filesystem-specific tuning options will be available.

-----

I haven't exactly worked out any implementation details yet.  I do know:

  - I'll be doing the GUI in Qt because I want to learn it, but will
    design the GUI so it is abstracted and the VDA can be ported to
    other toolkits.  
  - Statically compiled versions are a must since this tool is intended 
    to be used on servers where X libraries may not exist.
  - Interfacing with the LVM will be done through command-line tools.

Initial versions will only view existing configurations.  The ability to
actually modify or create volume groups will come once I get enough
feedback and am satisfied with the quality of the design.

Naturally a project like this must undergo intensive testing in lots of
different environments.  Fortunately I have some different hardware at
my disposal, but I hope after the initial design that releases will be
frequent, and there will be enough interest to generate sufficient
user-feedback.

So, let the comments begin!

TIA,
Jason.

--
Academic Computing Support Specialist         Assistant Section Editor
Algoma University College                     http://linux.com/develop
Sault Ste. Marie, Ontario                 
705-949-2301 x330                                   Personal Home Page
http://www.auc.ca                                     http://sault.org
