From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Questions about Physical Volumes...
Message-ID: <20030613095348.B24004@sistina.com>
References: <20030613002945.80024.qmail@web20419.mail.yahoo.com>
Mime-Version: 1.0
In-Reply-To: <20030613002945.80024.qmail@web20419.mail.yahoo.com>; from mgeusenet@yahoo.com on Thu, Jun 12, 2003 at 05:29:45PM -0700
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
Date: Fri Jun 13 03:07:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jun 12, 2003 at 05:29:45PM -0700, Matt E wrote:
> Hello!
> 
> I'm going to be adding a RAID 5 setup to my system,
> but I need to get all the data off my disks that are
> currently installed and put on to the new raid array. 
> Once this is done, I'll take one of the disks that is
> currently in my system and add it to the RAID array.
> 
> I'm going to run LVM ontop of this RAID array.  The
> raid tools package has a tool "raidreconf" that will
> allow me to add another disk to the array without
> destroying the data on it.
> 
> Once this is done, I'd want to use this extra space in
> LVM.  However, I can't pvcreate /dev/md0 again,
> beacuse I will already have an LVM setup on it.  Is
> there anyway to let LVM know that /dev/md0 has grown,
> so I could then use this extra space in VGs?

Use LVM2, pvcreate md0 after it has grown (which gives you a PV with
the new size) and vgcfgrestore the LVM metadata to it.

> 
> Anyone know anything about this?
> 
> Cheers!
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! Calendar - Free online calendar with sync to Outlook(TM).
> http://calendar.yahoo.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

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
