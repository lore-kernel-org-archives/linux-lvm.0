From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] [BUG] pvmove failed on last PE in PV
Message-Id: <20020212102657.B2360@sistina.com>
References: <yznvgd3dqbr.fsf@triumph.nr.no>
MIME-Version: 1.0
In-Reply-To: <yznvgd3dqbr.fsf@triumph.nr.no>; from
    Thor.Kristoffersen@nr.no on Tue, Feb 12, 2002 at 10:03:52AM +0100
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
Date: Tue Feb 12 03:28:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 12, 2002 at 10:03:52AM +0100, Thor Kristoffersen wrote:
> I have been running LVM for the past six months without any problems until
> last night when I migrated all PVs to a new disk.  On one particular PV
> (hda2) which had all its physical extents allocated, LVM managed to move
> all physical extents except the last one.  It complained about not being
> able to read past the end of the device, and that it was missing the last
> 65536 bytes.  I eventually managed to solve the problem by adding the hda3
> partition to hda2.  Only then was it able to move the last physical extent.

Thor,

that's a known misalignment issue we had in the 0.9.1 Beta series.
The partition magic you did is one solution to work around this.

Please upgrade to LVM 1.0.2 to avoid further misalignment.

> 
> Hardware setup:
>   Mainboard: MSI K7T266-Pro2
>   Primary master: IBM DTLA-307045
>   Secondary master: Seagate ST380021A
> 
> Software setup:
>   Redhat 7.1
>   Linux 2.4.6.
>   LVM 0.9.1-beta7
> 
> 
> Thor
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
