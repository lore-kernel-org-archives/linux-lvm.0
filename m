From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] How big is a PV?
Message-Id: <20020215120610.A18145@sistina.com>
References: <87vgd1935x.fsf@papadoc.bayour.com>
    <20020213112404.B7457@sistina.com> <87eljp8wox.fsf@papadoc.bayour.com>
    <873d03829k.fsf@papadoc.bayour.com>
MIME-Version: 1.0
In-Reply-To: <873d03829k.fsf@papadoc.bayour.com>; from turbo@bayour.com on
    Fri, Feb 15, 2002 at 11:31:35AM +0100
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
Date: Fri Feb 15 05:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Feb 15, 2002 at 11:31:35AM +0100, Turbo Fredriksson wrote:
> >>>>> "Turbo" == Turbo Fredriksson <turbo@bayour.com> writes:
> 
>     Turbo> Quoting "Heinz J . Mauelshagen" <mauelshagen@sistina.com>:
>     >> Following patch should help. Will be in CVS soon.
> 
> I haven't upgraded my kernel yet, but by exporting the LD_LIBRARY_PATH=./lib,
> and running
> 
>         ./vgcfgrestore -ll -v -n vg1
> 
> I get 
> 
>         PV Size               15.55 GB [32611887 secs] / NOT usable 4.18 MB [LVM: 139 KB]
> 
> So what's '32611887 secs'? Number of blocks?

Number of 512 Byte sectots.

> 
> 
> 
> assassination Delta Force Cuba Treasury NORAD SDI CIA Clinton bomb
> cracking attack Cocaine strategic fissionable PLO
> [See http://www.aclu.org/echelonwatch/index.html for more about this]
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
