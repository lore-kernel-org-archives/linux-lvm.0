From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] pvmove root filesystem?
Message-ID: <20011101221529.W16554@lynx.no>
References: <20011101233119.P21136@pc.ilinx>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011101233119.P21136@pc.ilinx>; from lvm@interlinx.bc.ca on Thu, Nov 01, 2001 at 11:31:19PM -0500
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
Date: Thu Nov  1 23:14:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Nov 01, 2001  23:31 -0500, Brian J. Murrell wrote:
> Once I have copied the /boot from the ide disk to the scsi disk,
> and pvmoved the root filesystem (and possibly all of the rest of the
> filesystems in the rootvol) to the SCSI disk, I should be able to do
> the required "lilo" magic to get the MBR on the SCSI disk active and
> then make it the boot drive and reboot no?
> 
> Is there anything about pvmoving the root filesystem that I am missing
> in my description above that is going to cause disaster?

Brian, the "pvmove" mechanism is not yet 100% safe for mounted filesystems.
If there is little/no activity on the filesystem while it is being moved,
you are probably OK.  There may be a problem with the ext3 journal, it is
hard to say (there was a report on the ext3 mailing list, but I never got
enough details to sort it out.

What I would suggest (for the good of all people reading) is you do this:
1) Make a backup of everything (obviously).
2) Give it a try.
3) Tell us how it worked.  Ensure you run a full (forced) e2fsck on
   everything, preferrably after a reboot (I think if you create the
   file /forcedfsck or so, check your rc.sysinit or equivalent) it
   will do this at boot time.

It is critical that you have a full backup, as I say people have had
problems, and there are known "holes" in the pvmove locking.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
