Date: Tue, 9 Oct 2001 11:21:18 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM seems to be causing SCSI errors.
Message-ID: <20011009112118.A25020@sistina.com>
References: <134902074.1002552720175.JavaMail.root@boots>
Mime-Version: 1.0
In-Reply-To: <134902074.1002552720175.JavaMail.root@boots>; from rmvzj001@sneakemail.com on Mon, Oct 08, 2001 at 10:51:42AM -0000
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

On Mon, Oct 08, 2001 at 10:51:42AM -0000, Karl wrote:
> > IIRC you said, that your test LVs spanned physical drives.
> > Another known problem is flaky SCSI subsystem behaviour when LVM causes
> > more load in configurations like this.
> >
> > Can you trigger the problem, if you've got just one LV being allocated
> > on one PV?
> 
> The problem is still there when the LVM is only on a single SCSI volume.
> In fact, changing the volume from one drive to the other shows SCSI
> errors on the new drive and the old drive used on a non LVM file system
> stops having errors.
> 
> > What did the file system consistency check I mentioned in my other mail say?
> 
> When I ran an fsck on the file system with the errors (I did not re-do
> this experiment recently) it found bad blocks on the files system, but
> no inconsistencies on the file system itself.

Strange, running out of ideas here.
We don't have similar reports, do we?

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
