Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102060630.f166UYM32021@webber.adilger.net>
Subject: Re: [linux-lvm] 0.9.1 vgscan doesn't detect upgraded vg's
In-Reply-To: <3A7F6413.A80D1803@twisted.net> from Michael McLinn at "Feb 5, 2001
 09:40:19 pm"
Date: Mon, 5 Feb 2001 23:30:34 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Michael McLinn writes:
> I was running some large vg's with 0.8final, and upgraded
> to 0.9.1_beta3 w/ kernel 2.4.1-ac2.  
> 
> After the upgrade, vgscan does not find any volume groups.
> 
> Reverting to prior tools + kernel does not work as the on disk
> vg structures have been altered (presumably upgraded to the v2 
> format). 
> 
> I have no suitably recent vgcfg backups, so restoring is not an
> option.  
> 
> I look at the output of pvdata -U on a physical volume. 
> I see 3 UUID slots, which matches the number of pv's in the vg.
> However, on the first pv in the vg, only the first one is filled.
> On the second pv in the vg, the first two are filled.  On the 
> third pv of the vg, all three are filled. 
> 
> Within pv_read_all_pv_of_vg.c, there is a call to 
> pv_read_uuidlist(), this routine is scanning the first pv, 
> and thus only returns one uuid.
> 
> Later the result is only the first pv is returned from
> pv_read_all_pv_of_vg().  
> 
> My theory is each pv is supposed to have the the UUID's of 
> itself, and all other pv's in it's vg within it's UUID 
> datastructure.  Is this so?

Correct.  There was another user who reported the same bug, but after
they were playing with the system a bit, it started to work (i.e. the
UUIDs were filled in) so it was not looked at further.

> If this is the case, it seems it would be possible to write the 
> correct UUID's to the datastructure on disk, and potentially 
> improve (maybe even fix) my situation.

Yes, this is the case.  To confirm that the UUIDs are causing the problem,
you can put printf() in pv_read_all_pv_of_vg() where it is checking
disks against UUIDs, whenever a disk is being discarded.  If this is
really the problem, simply comment out this UUID check for now.  It is
only an extra safety check for duplicate VG names or old PVs at this point.
This should allow you to load the VG again.

> One more note that might be of interest, these volume groups were
> created with a much earlier version of lvm, 0.6 or 0.7 I believe.

I don't know what the situation was with the other person who had
this same bug, but it is good to know anyways.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
