Return-Path: <lembark@wrkhors.com>
Message-ID: <3A4D4AB6.545DF214@wrkhors.com>
Date: Fri, 29 Dec 2000 20:38:46 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] OK to backup physical volume to tape?
References: <3A4D0C25.A4BB534B@xenotrope.com> <3A4D2939.C089EC3B@wrkhors.com> <3A4D337B.5835DE56@xenotrope.com>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

> I think I may have to forget about LVM and divide the 130 GB space into
> slices that can fit on tape.

if you don't have an autoloader then one day's backup 
cannot exceed a single tape unless someone changes the
tape by hand.  slicing the total space up into multiple
mount points won't effect that.  you can do the same 
thing without separate mounts points by using several
directories under /dir1 that each hold one tape's
worth of data and then:

	find /dir1/a | blah
	find /dir2/b | blah


if you prefer to back up all of the data then you
will have to use multiple tapes no matter what
method you choose.  at that point cpio will work
as well as anything else, it'll patiently wait for
you to change the tapes by hand -- no autoloader
required.

none of this has anything to do with LVM or mount
points, per se.  

one trick i've used in the past to pack tapes was
finding all the files, sorting them by decreasing
size and assigning them using a least-slack rule
(i.e., whichever tape has the most unused space
gets the next file).  this won't solve your 
multi-tape issue but can help if you prefer not
to span tapes with a single backup.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
