Date: Mon, 8 Oct 2001 12:07:05 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM seems to be causing SCSI errors.
Message-ID: <20011008120705.C18314@sistina.com>
References: <135641898.1002315768965.JavaMail.root@boots>
Mime-Version: 1.0
In-Reply-To: <135641898.1002315768965.JavaMail.root@boots>; from rmvzj001@sneakemail.com on Fri, Oct 05, 2001 at 04:58:15PM -0000
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

Karl,

did you check the filesystem.
Ages ago there was a couple of problems like this caused by filesystem
corruptions being fixable by the checker.

Please report, if this helped.

Regards,
Heinz    -- The LVM Guy --


On Fri, Oct 05, 2001 at 04:58:15PM -0000, Karl wrote:
> This is a real odd problem and my searching of the mailing lists and
> docs has not shed any light on it.
> 
> I created 3 logical volumes (with lvm 1.0.1r2, r3 and r4) across 4 disks
> on a dual 300 MHz PII running 2.4.6 (same behavior under 2.4.9) and
> readhat 7.1. After this I noticed IO errors while reading some files
> and SCSI errors when accessing lvol2. The errors were similar to the
> following
> 
> 
> Sep 28 17:11:21 gar kernel: scsi0: ERROR on channel 0, id 11, lun 0, CDB: Read (10) 00 00 ba e1 97 00 00 80 00 
> Sep 28 17:11:21 gar kernel: Info fld=0xbae1e6, Current sd08:21: sense key Medium Error
> Sep 28 17:11:21 gar kernel: Additional sense indicates Unrecovered read error
> Sep 28 17:11:21 gar kernel:  I/O error: dev 08:21, sector 12247456
> 
> 
> lvol2 spanned two disks and all the errors were on only one of them. I
> naturally thought that the problem was a hardware problem with the
> disk. The only odd thing was that lvol1 which spanned the same two disks
> did not have any errors.
> 
> The first thing I tried was an mke2fs with bad block checking on
> lvol2. It found several errors and when I copied the files back on new
> errors cropped up and more files were lost.
> 
> The next thing I did was to move all the data off of that disk (pvmove)
> and then did a low level format on that disk. No errors were detected
> during the low lever format nor the verify I did after that. I then did
> a mke2fs with bad block checking on the disk without LVM. No errors. I
> then did a pvcreate and re-created lvol2 and then did a mke2fs with bad
> block checking. Once again the SCSI errors. Removing that drive from LVM
> and formatting yet again without LVM showed no errors.
> 
> Moving lvol2 to a different physical volume results in the SCSI errors
> moving to that volume.
> 
> I am now convinced that the problem is with LVM and not with the
> hardware. I still have two other logical volumes (lvol1 and lvol3) that
> are not having ANY problems at all. Does anyone have any suggestion on
> how to solve this one?
> 
> Thanks.
> 
> 
> -----------------------------------------------------
> Protect yourself from spam, use http://sneakemail.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
