Return-Path: <tandem@dnmi.no>
Subject: Re: [linux-lvm] What happens when a disk dies?
References: <85256A49.0053DE83.00@janus.eci.esys.com>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 11 May 2001 17:30:36 +0200
In-Reply-To: Kyle_S_Hoyt@raytheon.com's message of "Fri, 11 May 2001 11:16:02 -0400"
Message-ID: <wv8zk3ewdf.fsf@freeze.oslo.dnmi.no>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Kyle" == Kyle S Hoyt <Kyle_S_Hoyt@raytheon.com> writes:

    Kyle> I am very interested in starting to use LVM.  We have large
    Kyle> amounts of data that is fairly dynamic.  Since it is
    Kyle> dynamic, we don't need to incur the cost expensive SCSI RAID
    Kyle> solutions for data integrity.  We currently use four 80 Gig
    Kyle> Maxtor Hard Drives to store our data at test events. Of
    Kyle> course this means with a /drive1 /drive2 /drive3 and a
    Kyle> /drive4 directory.  So the user has to search the drives to
    Kyle> find the file of interest.  We kind of hide this by creating
    Kyle> links but the links need to be periodically updated as files
    Kyle> are added or deleted.  LVM solves this problem.  But before
    Kyle> I move to LVM, I curious on what happens if a drive dies.

    Kyle>  If drive2 goes down and I replace it with another drive, do
    Kyle> I just lose the data on drive2 or do I lose all of the data
    Kyle> in the Logical Volume?

This is a filesystem thing not LVM (well LVM is involved if you use
it). If you lose a drive the filesystem is going to be unhappy to put
it mildly.

I don't understand your problem here , you can :-

- mount each disk under /this_is_the_data as its own filesystem (not
  using LVM necessarily), say /this_is_the_data/drive<n>

- search from /this_is_the_data

- if a disk goes then umount drive<n> and searches can still continue

If this does not work then more information is needed.

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
