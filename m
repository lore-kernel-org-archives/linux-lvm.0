Date: Mon, 8 Oct 2001 12:10:05 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM seems to be causing SCSI errors.
Message-ID: <20011008121005.D18314@sistina.com>
References: <135135307.1002326338570.JavaMail.root@boots>
Mime-Version: 1.0
In-Reply-To: <135135307.1002326338570.JavaMail.root@boots>; from rmvzj001@sneakemail.com on Fri, Oct 05, 2001 at 07:52:50PM -0000
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

IIRC you said, that your test LVs spanned physical drives.
Another known problem is flaky SCSI subsystem behaviour when LVM causes
more load in configurations like this.

Can you trigger the problem, if you've got just one LV being allocated
on one PV?

What did the filesystem consistency check I mentioned in my other mail say?


On Fri, Oct 05, 2001 at 07:52:50PM -0000, Karl wrote:
> > Well, if it is within the size of the drive, and you get a "bad noise"
> > when trying to access it, then it may be that you have a bad drive.  If
> > you are doing low-level formats of the drive, this may do bad block
> > relocation, and hide the fact that there are bad spots.
> 
> That's what I thought at first, but as I explained earlier, the errors
> ONLY occur when running under LVM and go away as soon as I use the raw
> disk. I went back and forth several times. I'm pretty sure it is an LVM
> thing, but no idea what it is.
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
