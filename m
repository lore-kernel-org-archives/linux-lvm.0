From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [Re: [linux-lvm] VG lost, no lvmconf => Help ! ] Corrupted PV
    UUID
Message-Id: <20020125110740.B13459@sistina.com>
References: <3C4EDF1A.3000409@cgg.com> <20020124154339.A8972@sistina.com>
    <3C50250F.40209@cgg.com> <20020124171255.A9239@sistina.com>
    <3C5049C2.1080401@cgg.com>
MIME-Version: 1.0
In-Reply-To: <3C5049C2.1080401@cgg.com>; from gduquesnay@cgg.com on Thu,
    Jan 24, 2002 at 06:52:02PM +0100
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
Date: Fri Jan 25 04:12:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 24, 2002 at 06:52:02PM +0100, Guillaume Duquesnay wrote:
> Heinz J . Mauelshagen wrote:
> 
>  > On Thu, Jan 24, 2002 at 04:15:27PM +0100, Guillaume Duquesnay wrote:
>  >
>  >
>  > So, let's hack one in to hopefully make LVM happier.
>  >
>  > First preserve the metadata on sda1 and sda3 for recovery with:
>  >
>  > dd if=/dev/sda1 of=sda1.VGDA count=512 bs=1k dd if=/dev/sda3
>  > of=sda3.VGDA count=512 bs=1k
> 
> done ;-)

:)

> 
>  >
>  > Backup sda[13].VGDA please.
> 
> on a snapshoted nfs.

Ok

> 
> 
>  >
>  >
>  > echo "sahdgdgasjg21hxjn45jxJJ45aasdc3d"|dd of=/dev/sda3 obs=1
>  > seek=44 count=32
> 
> I didn't remember enough C to calculate this offset ;-) !
> Question : is it a pure random UUID, that uuid_fixer will propagate
> wherever it is needed ?

Well, to tell you the truth: it was my fingers running over my keyboard
in a nervous coffein lack ;-)
And yes, uuid_fixer should.

> 
>  >
>  > Run
>  >
>  > ./uuid_fixer /dev/sda1 /dev/sda3
>  >
>  > again. Retry vgscan afterwards.
> 
> uuid_fixer found the 2 PVs with their respective UUID,
> when asked about writing in each file, i didn't find what it was about 
> in the README, but i answered affirmative, and then normal termination.
> But vgscan missed again my VG.

Hmmm. Strange.
If you answer yes or use the force option it should have written
the PV UUID lists to the devices correctly.

Like: "uuid_fixer -f /dev/sda[13]"

> 
> Some few uuid_fixer and failing scans later, i tried "no" to the mistery 
> question of uuid_fixer, after what vgscan find up my "main" VG.

You seem to have disks which need to be convinced to take writes ;-)

> 
> vgchange -ay, mounting, cfgbackup, lilo, etc., everything was working 
> like a charm ! Either did the reboot, so i'm currently running with my 
> lvm root partition.
> Many thanks, many thanks, everything is fixed.

You're welcome.

> 
> So I have only some informative question : what did uuid_fixer do, and 
> what does the question mean ?

As said above:
the question comes up unless you use uuid_fixer with the "-f" option.
If you answer 'y', it writes the PV UUID list back to all the devices
on the command line. PV UUID lists of *all* PVs are stored on all PVs
of a VG in order to identify the relationship between VG and PVs uniquely.

> 
> 
> Guillaume
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
