From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM 1.0.1 to LVM2 upgrade path
Message-ID: <20030210144647.B5997@sistina.com>
References: <20030207042425.GF22795@panoptic.com> <20030207152340.A27442@sistina.com> <20030207234501.GI22795@panoptic.com>
Mime-Version: 1.0
In-Reply-To: <20030207234501.GI22795@panoptic.com>; from dossy@panoptic.com on Fri, Feb 07, 2003 at 06:45:01PM -0500
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
Date: Mon Feb 10 07:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Feb 07, 2003 at 06:45:01PM -0500, Dossy wrote:
> On 2003.02.07, Heinz J . Mauelshagen <mauelshagen@sistina.com> wrote:
> > 
> > If this is production, you want to upgrade to LVM 1.0.6 because LVM2
> > is in beta still. [...]  The only major feature missing in LVM2 is
> > 'pvmove' which we are working on right now.
> 
> Thanks.  This is exactly the kind of detail I was looking for.  
> 
> > It supports the LVM1 metadata (IOW: you can install it and use your
> > volume groups created with LVM1). 
> 
> So, in order to upgrade to LVM2 there's no data conversion necessary, if
> I understand you correctly.  That's very good news.

No, you can stick with the LVM1 metadata w/o ayn conversion.
If you want to use the enhanced LVM2 metadata format you need to convert
thought (see vgconvert).  The LVM2 metadata format will give you
atomic metadata updates for better system resilience.

> 
> > You should give LVM2 a try on some test system please.
> 
> I might play around with it on my laptop (which runs Linux under VMware)
> -- this way, if anything goes wrong, I just lose a virtual disk and not
> real data.  :-)

Yep, that's a way.

> 
> (VMware is great for "experimenting" with filesystem code.  I haven't
> actually experimented with LVM under VMware yet, though.  It'll be
> interesting ...)
> 
> Thanks for your time, Heinz.  I appreciate it.
> 
> -- Dossy
> 
> -- 
> Dossy Shiobara                       mail: dossy@panoptic.com 
> Panoptic Computer Network             web: http://www.panoptic.com/ 
>   "He realized the fastest way to change is to laugh at your own
>     folly -- then you can let go and quickly move on." (p. 70)
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
