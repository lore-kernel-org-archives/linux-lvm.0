From: benr@us.ibm.com
Message-ID: <85256900.005C0E79.00@d54mta02.raleigh.ibm.com>
Date: Fri, 16 Jun 2000 12:45:28 -0400
Subject: [linux-lvm] Re: IBM to release LVM Technology to the Linux Community
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com



Hello everyone.  Sorry for the delay in responding.  Here is something I
posted to Slashdot.  I think it answers some questions and gives a little
context for what IBM is doing.  I'll try to begin answering the specific
questions that have been submitted this afternoon.


          I see that IBM's announcement has generated some confusion as
well as many questions. I will try to answer all of
          the questions I can.

          First the easy ones:

          1.  "I wonder if this is some pie in the sky vision or if they
have any code to back this up?"

          Yes, we have code. IBM has a prototype of this LVMS on at least
one of its platforms that I know of.

          2.  "As long as it's released under a liscense like the GPL, we
don't need to trust them "

          We are currently releasing the technology to the Linux Community.
 The current white paper provides a high level
          view of the basic architecture. As the architecture is discussed
with the Linux Community, additional white papers
          will be produced to explain, in greater detail, various aspects
of the architecture. Should things progress to the point
          where we are actually releasing code for some or all of it, then
any code we release will be under the GPL.

          3.  "Heinz Maulshagen and team have already written an LVM for
Linux. This LVM is already in the 2.3.x series of
          kernels. What is IBM's reasoning for this duplication of effort?
Might it not be more effective to assist in the
          current LVM implementation instead of bringing additional
complexity? Or are there advantages in IBM's
          approach to logical volume management? "

          Heinz and his team have done an excellent job with their LVM.
However, we feel that our design has some
          advantages, and that we are looking at the problem from a
different perspective. Let me explain.

          IBM's initial concept of a logical volume management system was
not all that different from what we find in the
          Linux Community today. However, over the years, IBM's concept has
 evolved based upon input from our
          customers, as well as usability studies performed on our customer
 base. Our current concept of a logical volume
          management system integrates disk partitioning and management,
bad block relocation, software RAID, encryption,
          filesystems, logical volume creation, deletion, and management,
etc. into a single, coherent, open ended
          architecture. All of the components of this architecture
communicate with the Logical Volume Manager, who
          co-ordinates their activities and handles all interactions with
the user. The Logical Volume Manager is a single
          program with three interfaces: a command line interface, a text
mode interface, and a graphical user interface.
          Thus, there is a single place for the user to turn to for any
aspect of logical volume management. This makes logical
          volume management easier for the user to learn and use, and it
reduces the chances for user error and data loss.

          As an example of IBM's concept, lets examine the case where an
encrypted volume is to be shrunk. We will assume
          that the user has already been through any authentication process
 which may be required to access the encrypted
          volume and has been granted full access. The user would start the
 LVM. The LVM would allow the user to select a
          volume. Once selected, the user would indicate that the volume
should be shrunk. The LVM would examine the
          volume, find which features are in use on the volume (encryption,
 in this case), find what filesystem is in use on the
          volume, and then ask each feature that would be affected by the
shrink if that feature can handle having the volume
          shrunk without data loss. If a feature indicates that it can NOT
handle having the volume shrunk, then the LVM
          informs the user that the volume can NOT be shrunk without data
loss. If all of the features indicate that they can
          handle having the volume shrunk, then the LVM would ask the
filesystem on the volume how much the filesystem
          can be shrunk without data loss. If the filesystem indicates that
 it can't be shrunk without losing data, the LVM will
          inform the user appropriately. If the filesystem can be shrunk,
it will indicate how much it can be shrunk before
          data loss begins. The LVM will then present this value to the
user and allow the user to specify how much to shrink
          the volume by, limiting the user's choice to only those values
that prevent data loss. Once the user has specified how
          much the volume is to be shrunk by, the LVM will then notify the
filesystem to shrink itself. Once the filesystem is
          done shrinking itself, the LVM will notify the features on the
volume that the volume is about to be shrunk. After
          this, the LVM will actually shrink the volume. Once the volume
has been shrunk, the LVM will notify the features
          on the volume that the shrink has been completed. The filesystem
will also be notified that the shrink has been
          completed. Once all of this has been completed, then the user
will be notified that the volume has been successfully
          shrunk.

          The above example is quick and dirty, and it leaves out quite a
bit, but I hope it gives you an idea of what we are
          trying to accomplish. Basically, we are trying to bring together
all of the various aspects of logical volume
          management into a single, cohesive, seamless entity. Furthermore,
 we are trying to do this in a way which is as
          flexible and expandable as possible. Consider the following:

          The LVMS architecture uses logical disks. Logical disks are
created and controlled by plug-in modules called
          "Device Managers". Thus, anything that can be made to appear as a
 logical disk through the use of a plug-in
          "Device Manager" module can be used by the LVMS. As an example,
lets say we have a "Device Manager" plug-in
          which can access a Storage Area Network (SAN). By just adding
this plug-in to an existing system, the LVMS
          would be able to allocate storage on a SAN, make it appear as a
logical disk, and then use any of the LVM
          capabilities that could be used on a local disk. No code in the
LVMS, existing plug-in modules, or LVM utilities
          needs to be modified or changed.

          The LVMS Architecture uses logical partitions. Logical partitions
 are controlled by plug-in modules called
          "Partition Managers". If you wanted to access a drive that was
partitioned for use with a Mac, you would just need
          a "Partition Manager" plug-in module that understands the
partitioning scheme used by the Mac. No LVMS,
          existing plug-in module, or LVM utility needs to have its code
changed. All that needs to be done is have the Mac
          "Partition Manager" plug-in added to the system.

          The LVMS Architecture employs something we call "Feature
Plug-ins". Feature Plug-ins control how logical
          partitions are combined into logical volumes, such as through
drive linking, the various forms of mirroring, or
          software RAID. They can also be used to filter I/O to a volume,
as would be the case for encryption. They can also
          be used to redirect I/O, as in the case of bad block relocation.
Furthermore, Feature Plug-ins can be stacked to
          produce a volume, so that multiple Feature Plug-ins can be used
on a single volume (encryption combined with
          software RAID and bad block relocation, for example). Every
volume in the system can employ different Feature
          Plug-ins, and volumes which do use the same Feature Plug-ins can
have them stacked differently. Thus, the user has
          an enormous amount of flexibility. One final point to make here
is that, since all of the plug-in modules
          communicate with the LVM, the LVM can co-ordinate their
activities to ensure that the user doesn't do something
          which will result in the loss of data (at least without adequate
warning).

          Given all of the above, I hope everyone understands why we think
the LVMS Architecture we are releasing has
          some advantages over other approaches.

          Well, this post has gotten excessively long, and I apologize for
that. I will try to address additional
          questions/comments/concerns later, hopefully with smaller posts!

          Ben Rafanello

          IBM Linux Technology Center
