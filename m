From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Ensuring a LV does not move to a new PV?
Message-ID: <20030520093130.B9086@sistina.com>
References: <20030516183147.OJLZ24149.imf23bis.bellsouth.net@tiger2>
Mime-Version: 1.0
In-Reply-To: <20030516183147.OJLZ24149.imf23bis.bellsouth.net@tiger2>; from freemyer@NorcrossGroup.com on Fri, May 16, 2003 at 02:36:15PM -0400
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
Date: Tue May 20 02:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, May 16, 2003 at 02:36:15PM -0400, Greg Freemyer wrote:
> 
> I had a single hardware mirrored PV I have been using with 3 LVs on it.
> 
> I just added a JBOD PV to the VG for use with snapshot LVs.
> 
> Is there anything I need to do to ensure that the main LVs never add any PEs from the new PV?

lvextend -L+SomeAmount /dev/VG/OneMainLV /dev/mirroredPV

IOW: limit allocation to the HW-mirrored PV.

> 
> i.e.
> Are the existing LVs sparse?

No.

> 
> And do new PEs get allocated as data is written to the LV?

No, they are all preallocated.

> 
> If so, I can easily see PEs coming from the wrong PV.
> 
> Thanks
> Greg
> -- 
> Greg Freemyer
>   
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
