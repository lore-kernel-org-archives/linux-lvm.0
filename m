Date: Sat, 15 May 2004 10:11:38 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Can't seem to make pvmove do the work
Message-ID: <20040515081138.GA25352@redhat.com>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA1z/y+RiMjUG0rnE3+S6yhMKAAAAQAAAA9PM3uSfHCESqMaQcwxAYfwEAAAAA@EchoHome.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA1z/y+RiMjUG0rnE3+S6yhMKAAAAQAAAA9PM3uSfHCESqMaQcwxAYfwEAAAAA@EchoHome.org>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erik@echohome.org, LVM general discussion and development <linux-lvm@redhat.com>
Cc: hjm@redhat.com

On Fri, May 14, 2004 at 02:39:46PM -0400, Erik Ch. Ohrnberger wrote:
> It's strange.  I need to reduce a disk, either hdg or hdh from the volume
> group.
> 
> I've already gone and reduced the allocated size using e2fsadm to change
> free file system space into free pv allocations.  Here is what vgdisplay -v
> says:
> 
> --- Physical volumes ---
> PV Name (#)           /dev/hdg1 (4)
> PV Status             available / allocatable
> Total PE / Free PE    9814 / 0
> 
> PV Name (#)           /dev/hdh1 (3)
> PV Status             available / allocatable
> Total PE / Free PE    9815 / 880
> 
> PV Name (#)           /dev/hde1 (2)
> PV Status             available / allocatable
> Total PE / Free PE    19078 / 8347
> 
> PV Name (#)           /dev/hdf1 (6)
> PV Status             available / allocatable
> Total PE / Free PE    19078 / 5365
> 
> Now, I perform the following pvmove command:
> 
> Pvmove /dev/hdg1
> 
> And it says that there are insufficient free/allocatable physical extents.
> 
> But if I look at the list, the 9814 pvs on hdg1 should be across hdh1, hde1
> and hdf1.
> 
> Have I got this correct?  Is there perhaps a step that I'm missing?  If I
> am, do please let me know.

LV(s) on hdg1 larger than 8347 PEs with contiguous allocation pollicy set ?
(see "man lvchange" how to reset)

> 
> 	Thanks,
> 		Erik.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
