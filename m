From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM non-bug: md10 and higher broken
Message-Id: <20020204114337.A29233@sistina.com>
References: <003a01c1ad59$54e409d0$216410ac@tao.co.uk>
MIME-Version: 1.0
In-Reply-To: <003a01c1ad59$54e409d0$216410ac@tao.co.uk>; from
    bill+linuxlvm@tao-group.com on Mon, Feb 04, 2002 at 08:52:53AM -0000
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
Date: Mon Feb  4 04:49:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 04, 2002 at 08:52:53AM -0000, William Blunn wrote:
> Doesn't seem to be a bug in LVM, but it seems that the problem is
> tickled when migrating from a multiple-MD-devices system to an LVM
> system.
> 
> LVM 1.0.1 / kernel 2.2.20
> 
> I am using /dev/md0 through /dev/md10 for my existing (non-LVM) system.
> 
> I put in additional disks, set them up on /dev/md11, and created a PV on
> /dev/md11.
> 
> When trying to create the VG, it wouldn't find the PV.
> 
> Suspiciously, /proc/partitions shows MD devices listed as
> 
>    ...
>    /dev/md8
>    /dev/md9
>    /dev/md:
>    /dev/md;
> 
> instead of what you would expect
> 
>    ...
>    /dev/md8
>    /dev/md9
>    /dev/md10
>    /dev/md11
> 
> i.e. (sloppily) implemented as translating the MD number into a single
> character instead of generating a (potentially multiple character)
> string of the decimal representation.
> 
> Swapping /dev/md0 with /dev/md11 makes it all work.
> 
> So I guess that LVM is accessing /proc/partitions and not seeing any MD
> devices 10 or higher.

Yes, it does.
BTW: we don't support 2.2 any longer :-(

> 
> That would make it a bug in the kernel, but since people are likely to
> come across it through LVM I thought it would be a good idea to mention
> it here.

Could you send a request to fix (or even better a fix ;-) for MD
/proc/partitions/supprt to linux-kernel@vger.kernel.org, please?

> 
> Does anyone know if anyone has made/submitted a (2.2) kernel fix for
> this?

No, don't know.

> 
> Another little snag is that the code for handling this is right next to
> where the LVM patch gets applied, so making a patch would likely (I
> guess) make the LVM patch not apply properly.

That's likely.

> 
> Bill
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
