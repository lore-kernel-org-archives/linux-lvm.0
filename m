From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] error message - "lvm -- lvm_blk_ioctl: unknown cmd 0x540f"
Message-ID: <20030321123041.B15467@sistina.com>
References: <Pine.LNX.4.50.0303201333170.24359-100000@hal.rescomp.berkeley.edu>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.50.0303201333170.24359-100000@hal.rescomp.berkeley.edu>; from michael@rescomp.berkeley.edu on Thu, Mar 20, 2003 at 01:38:59PM -0800
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
Date: Fri Mar 21 05:33:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

This message just tells you that some program does an ioctl with
an unsoported command on LVM.
_Very_ unlikely the reason of your crashes.

You don't give details about your HW configuration so I guess that
the likely reason of your crash is heavy load on 9 disks exposing
an IDE/SCSI problem (i.e. SCSI termination).

On Thu, Mar 20, 2003 at 01:38:59PM -0800, michael tauras wrote:
> Hi,
> 
> Recently I've been having this message show up in my kernel logs. The
> system has 9 disks stripped to one volume. It has crashed several times,
> but upon reboot the volume fscks and mounts fine. Yesterday it crashed
> while trying to back up a few gigs from the logical volume to a different
> drive. I've done some web searches for the specific error message but to
> no avail. Tried upgrading to the latest 1.x release of lvm, which didn't
> help. The box is in a colo center waiting to be rebooted. Any ideas would
> be helpful, thanks!
> 
> Mike
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
