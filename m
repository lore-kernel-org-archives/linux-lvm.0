Return-Path: <Kyle_S_Hoyt@raytheon.com>
From: Kyle_S_Hoyt@raytheon.com
Message-ID: <85256A49.0053DE83.00@janus.eci.esys.com>
Date: Fri, 11 May 2001 11:16:02 -0400
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] What happens when a disk dies?
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
To: Linux-LVM@sistina.com


I am very interested in starting to use LVM.  We have large amounts of data
that is fairly dynamic.  Since it is dynamic, we don't need to incur the
cost expensive SCSI RAID solutions for data integrity.  We currently use
four 80 Gig Maxtor Hard Drives to store our data at test events. Of course
this means with a /drive1 /drive2 /drive3 and a /drive4 directory.  So the
user has to search the drives to find the file of interest.  We kind of
hide this by creating links but the links need to be periodically updated
as files are added or deleted.  LVM solves this problem.  But before I move
to LVM, I curious on what happens if a drive dies.

 If drive2 goes down and I replace it with another drive, do I just lose
the data on drive2 or do I lose all of the data in the Logical Volume?

If I don't lose the data on the other drives, can LVM also be reconfigured
to remove the dead drive and then continue working with just the other
three drives (only losing the data on the dead drive)?

I read the FAQs and one of them shows how to recover from a dead drive.  It
is says you lose the data in the Logical Volume but I'm hoping just the
data on the physical disk that died and not the entire volume.

Thanks for your help,

Kyle Hoyt
(727) 302-7465
Kyle_S_Hoyt@raytheon.com
