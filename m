From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] pvmove root filesystem?
Message-ID: <20011101235041.B746@lynx.no>
References: <20011101233119.P21136@pc.ilinx> <20011101221529.W16554@lynx.no> <20011102003346.Q21136@pc.ilinx>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011102003346.Q21136@pc.ilinx>; from lvm@interlinx.bc.ca on Fri, Nov 02, 2001 at 12:33:46AM -0500
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
Date: Fri Nov  2 00:49:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Nov 02, 2001  00:33 -0500, Brian J. Murrell wrote:
> > Brian, the "pvmove" mechanism is not yet 100% safe for mounted filesystems.
> 
> Ugh.  I was hoping to not hear something like this.  Has it gotten any
> better recently?  What I mean is my LVM identifies itself as:
> 
> LVM version LVM 0.9.1_beta7(ish)  by Heinz Mauelshagen  (20 June 2001)
> lvm -- Module successfully initialized

Well, there have been a lot of changes to the pvmove locking code and
such since then.  Whether it actually makes a difference is hard to
tell.

> Am I going to run into even more problems with this verion of LVM vs.
> the latest or has the "live" pvmove stuff not changed much between the
> version I am running and current.

Nobody has really done any good testing on it.

> > There may be a problem with the ext3 journal, it is
> > hard to say (there was a report on the ext3 mailing list, but I never got
> > enough details to sort it out.
> 
> Hrm.  I am running ext3 on my filesystems as well.

That's why I mentioned it.  You could read the thread in the ext3-users
archive at RedHat.

> I just don't want this to turn into a "restore my system from tape"
> type of operation, especially if the system is operating (i.e.
> processing mail, etc.) while it all goes down the sh*tter.  Maybe I
> will contemplate it based on your thoughts of how much worse the
> operation could be based on my version of LVM installed.

Well, if you are worried about mail, turn it off, back up your mail
spool, and then do the move.

Alternately, if you have some time to kill, do a "safe" test first.
Create a PV/VG/LV on your new disk, get some process writing into it
while it is mounted, and try a pvmove to another disk.  Bonus marks if
you use something that can be verified afterwards (e.g. a tar file).

"Obviously", there is only a danger at the "crossover" point of the
tar extraction and the pvmove (i.e. only while writing to the PE that
is being moved).  In theory, the buffers being written by tar will be
locked when they are being written into the PE that is being moved.
Once the pvmove is done, if e2fsck and "diff -ru" tell you that all
is well, I think you are safe.

If you are paranoid, run something really heavy like bonnie++ during the
pvmove (only the file creation/read/deletion part) and it will complain
if any of the files suddenly go missing or unreadable, but it doesn't
(currently) check the file contents.  That would probably be a good
hack - write synthetic data into each file that can easily be verified
as correct later.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
