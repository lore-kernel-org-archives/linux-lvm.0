Subject: Re: [linux-lvm] read hangs when snapshot gets full
Message-ID: <OF7400C79A.B656D5C3-ONC1256B21.003B305E@de.ibm.com>
From: "Martin Petermann" <martin.petermann@de.ibm.com>
MIME-Version: 1.0
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
Date: Thu Dec 13 05:05:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Jens-Peter Akelbein <AKELBEIN@de.ibm.com>

> On Mon, Dec 10, 2001 at 06:18:15PM +0100, Martin Petermann wrote:
> > Hi all,
> >
> > I'm using a SuSE Linux (V7.2) with a 2.4.4 kernel. If I start a program
> > which reads from a snapshot (e.g. cat /dev/vg/snapshot > /tmp/file)
with a
> > low priority (nice -20), sometimes the program hangs within the
> > read() call if the snapshot gets full. If this is the case I'm not able
to
> > kill the process of the application (even SIGKILL). In my application I
> > reduced the number of blocks in each read() call reads and I stop
> > reading after the snapshot is full of more then 90%. But this solution
is
> > not completely avoiding the problem.
> >
> > Is there any fix in a newer kernel version?
>
> I think this is fixed in 1.0.1 - it certainly works for me on Linux
2.4.16
>
> patrick

Hi,

on my machine I installed kernel 2.4.16 and lvm 1.0.1. I've created a 400M
filesystem and a 20M snapshot:

   >lvcreate -L 20M -n snapshot -s /dev/develop/400M
   lvcreate -- WARNING: the snapshot will be automatically disabled once it
   gets full
   lvcreate -- INFO: using default snapshot chunk size of 64.00 KB for
   "/dev/develop/snapshot"
   lvcreate -- doing automatic backup of "develop"
   lvcreate -- logical volume "/dev/develop/snapshot" successfully created

Now I open the snapdevice for reading and copy a 10M file into the orig fs:

   seska:root /home/peterman
   >nice -20 cat /dev/develop/snapshot > /BIGFS/file
   cat: /dev/develop/snapshot: Eingabe-/Ausgabefehler
   seska:root /home/peterman
   >cp tf0 /400M
   seska:root /BIGFS2

Now the snapshot always gets inactivated:

   >lvdisplay /dev/develop/snapshot
   --- Logical volume ---
   LV Name                /dev/develop/snapshot
   VG Name                develop
   LV Write Access        read only
   LV snapshot status     INACTIVE destination for /dev/develop/400M
   LV Status              NOT available
   LV #                   6
   # open                 0
   LV Size                400.00 MB
   Current LE             100
   Allocated LE           100
   snapshot chunk size    64.00 KB
   Allocated to snapshot  0.00% [0/19.69 MB]
   Allocated to COW-table 320.00 KB
   Allocation             next free
   Read ahead sectors     120
   Block device           58:12


Thanks for any help!

Martin
