Return-Path: <lembark@wrkhors.com>
From: lembark@wrkhors.com
Date: Fri, 20 Jul 2001 09:20:20 -0500
Subject: Re: [linux-lvm] 2 LVM questions
Message-ID: <56640000.995638820@duke.wrkhors.com>
In-Reply-To: <200107201334.QAA26563@easymail.hol.gr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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


-- moka@hol.gr on 07/20/01 16:34:15 +0300

> 1) I have a system with 3 hard disks, and only one of 
> them is presently used. This contains boot, root and 
> swap plus a logical  partition(not LVM) containing
> /var and /home.
> 
> I have big database tables, so I would like
>  to create one volume group consisting of the 2
>  unused disks plus the /var. Is this possible
>  without losing what is in /var?
> 2) The reason I need  a lot of space is that mysql
>   which I am using stores the database tables in /var.
>  Can I somehow "name" the volume group /var
>   so that mysql will not be confused?


Leave the partitions you need in single user off of
LVM.  They may be necessary for fixing LVM at some
point (unless you enjoy booting from floppies).  In
general the contents of / (excluding /usr), /var and
primary swap are a good bet to keep off of LVM.

Creating the volume groups to hold this data will 
require blowing it off.  Simplest fix is to:

    Back the stuff up completely.
    Create two PV's from the 2 "extra" drives.
    Add the two PV'S into a single VG.
    Build your file systems (striping might
     be a useful idea or mirroring if you
     need the availability).
    Mount the new LV's under wherever the old
     partitions were mounted.
    Restore the data.

You probably aren't using all of "/var" for the 
MySQL database.  Whatever the directory you now
are using (e.g., /var/MySQL) can easily become
a mount point without the database even knowing 
about it.

sl
