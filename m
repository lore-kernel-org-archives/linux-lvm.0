Return-Path: <mauelshagen@sistina.com>
Date: Thu, 28 Jun 2001 11:04:17 -0500
From: Heinz Mauelshagen <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM metadata corruption?
Message-ID: <20010628110417.B24904@sistina.com>
References: <20010628022307.A380@vestdata.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010628022307.A380@vestdata.no>; from lvm@ragnark.vestdata.no on Thu, Jun 28, 2001 at 02:23:07AM +0200
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

On Thu, Jun 28, 2001 at 02:23:07AM +0200, Ragnar Kj?rstad wrote:
> Hi
> 
> We had a LVM problem that we believe was caused by corrupted
> LVM-metadata. Can anyone confirm if this is a likely explanation?
> 
> 1. Installed LVM 
> 2. Created a single vg on a single device with a single lv
> 3. Used without problems for a while
> 4. Added a new device
> 5. Add the device to the vg, extend the lv and the filesystem
> 6. We experienced scsi-problems at this time.
> 7. Fixed scsi termination
> 
> After a reboot, mounting the filesystem(xfs) oopsed.
> 
> lvdisplay -v segfaulted, but there was no backtrace.
> 
> We recreated the lvm vg and lv, and the filesytem - everything worked
> fine.
> 
> 
> My theory is that the vgextend or lvextend corrupted the lvm-metadata
> because of the scsi-termination problem. LVM doesn't update the metadata
> using a transactional log, does it?

Ragnar,
no it doesn't so far.
That's a planned enhgancement for post 1.0.

> so if a write failed, the data will
> become corrupted? (yes, I know a copy is saved in the /etc/lvm files)

Yep, but this corruption could only take place, because the hardware
wasn't able to spot the data corruption.

With that kind of silent data corruption even transaction oriented models
will have problems while aiming to make nonatomic I/Os behave atomic.
They can't garantee either that no silent data corruption took place.

In order to avoid such trouble after changing the SCSI HW configurations you
could to write data to free areas on the disks and verify it multiple times
while imposing read load to the disks.
SCSI is pushable over the edge far too easy :-(

Regards,
Heinz    -- The LVM Guy --
 
> 
> Unfortenately we needed the system back online right away, so the
> metadata is no gone. No way of debugging it futher.
> 
> 
> Thank you.
> 
> 
> 
> -- 
> Ragnar Kjorstad
> Big Storage
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
