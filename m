From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm2 size limits
Message-ID: <20031112145432.G28265@sistina.com>
References: <20031111214438.GA29494@cm.nu>
Mime-Version: 1.0
In-Reply-To: <20031111214438.GA29494@cm.nu>; from shane-dated-1071179078.77093b@cm.nu on Tue, Nov 11, 2003 at 01:44:38PM -0800
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
Date: Wed Nov 12 07:56:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Nov 11, 2003 at 01:44:38PM -0800, Shane Wegner wrote:
> Hello,
> 
> I am looking at using lvm2 for a new volume I am creating
> using 2.4.22+devmapper patch.  Under lvm1, I had to
> specify the pv extent size to get potential support for a
> vg greater than 2tb.  However, I can't seem to find a
> similar option to pvcreate in lvm2 to set the extent size. 
> What if anything is required during a new lvm setup to
> break the 2tb barrier.  The setup currently is not yet 2tb
> but I'd like to have that option in the future.

There never has been a 2TB limit on Volume Groups (was in the PT range even
with the 2TB block device size maximum in Linux 2.4).

In LVM1 LVs could have as much as ~2^16 Logical Extents maximum.
That's why you needed larger extent sizes there to be able to have larger LVs.
FYI: recent LVM1 creates VGs with a default PE size of 32MB which enable
     you to have LVs up to 2TB in size.

In LVM2, if you convert existing LVM1 format VGs to LVM2 format
(using vgconvert) or create new LVM2 formated VGs, there's no 2TB constraint
on LVs any longer but the OS limit for the block device size (which is 2TB).

Use 2.6 in case you want to have >2TB LVs.

> 
> Tia,
> Shane
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
