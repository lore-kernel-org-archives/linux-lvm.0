From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Logical Volume disappears
Message-Id: <20020207200419.B13859@sistina.com>
References: <BC9564600E40C541983FCD6BEAF814FE03C94E6B@xch-knt-15.nw.nos.boeing.com>
    <20020207115836.R15496@lynx.turbolabs.com>
MIME-Version: 1.0
In-Reply-To: <20020207115836.R15496@lynx.turbolabs.com>; from
    adilger@turbolabs.com on Thu, Feb 07, 2002 at 11:58:36AM -0700
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
Date: Thu Feb  7 13:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 07, 2002 at 11:58:36AM -0700, Andreas Dilger wrote:
> On Feb 07, 2002  10:20 -0800, Wolfe, Gordon W wrote:
> > I needed to make a public repository for the contents of five CD's, so I
> > set up a Linux server using SuSE 2.2.16 on S/390 under z/VM.  For five
> > CD's, I figured two volumes ought to hold the contents.  An rpm query
> > shows lvm-0.8-157, which is what came with the SuSe distribution.
> 
> OK, well lvm-0.8 is _very_ old and undoubtably has a _huge_ number of
> bugs.  You should be able to use the recent LVM version on 2.2 kernels
> still.

That's true, but this should at least work.

> 
> > > I manually umounted /dev/vgcd/lvcd, shut down and rebooted Linux.
> > After the reboot, the device /dev/vgcd/lvcd does not exist.
> > vgscan says "vgscan -- no volume groups found"
> > pvscan says "pvscan -- no valid physical volumes found"
> 
> You probably need to add the names of the DASD devices to the list
> that LVM searches.

SuSE's S/390 Linux supports them.

> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> 
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
