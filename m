Return-Path: <root@srv.sistina.com>
Date: Fri, 18 May 2001 16:27:04 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Working together
Message-ID: <20010518162704.A26391@sistina.com>
References: <OF97CFF081.B6DCBCCA-ON85256A50.004CE72A@raleigh.ibm.com>
Mime-Version: 1.0
In-Reply-To: <OF97CFF081.B6DCBCCA-ON85256A50.004CE72A@raleigh.ibm.com>; from peloquin@us.ibm.com on Fri, May 18, 2001 at 09:01:49AM -0500
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
Cc: okeefe@sistina.com, carter@sistina.com, sass@sistina.com, jhartling@uswest.net

Mark,

thanks you very much for offering this.
We are discussing your points internally and will answer in detail ASAP.

Regards,
Heinz    -- The LVM Guy --


On Fri, May 18, 2001 at 09:01:49AM -0500, Mark Peloquin wrote:
> Hello everyone,
> 
> On behalf of the EVMS project (http://sourceforge.net/projects/evms or
> http://oss.software.ibm.com/developerworks/opensource/evms) team, we
> would like to invite the Linux LVM project to join/collaborate with our
> project.  The goal of this collaboration is to offer a complimentary set of
> functionality to the Linux community, rather than multiple sets of
> functionality
> that overlap and compete.
> 
> As many of you know, the EVMS project, in design and scope, is meant to
> be a total Logical Volume Management solution, including support for the
> emulation of other volume management systems.
> 
> The EVMS team would like the Linux LVM project team to consider assuming
> responsibility for the Linux LVM emulation component in EVMS, as well as
> participating, if you like, in other areas of the EVMS project. EVMS offers
> many
> areas for participation.
> 
> > Why should Linux LVM join the EVMS project ?
> 
> The EVMS project can offer some immediate solutions to current Linux LVM
> issues.
> 
> - EVMS supports in-kernel reading/writing of metadata
> 
> - EVMS supports in-kernel discovery of volume groups and volumes
> 
> - EVMS can solve migration and coexistence issues.  By supporting a plugin
>   design, both the original Linux LVM and the new Linux LVM (new on-disk
>   format) plugins could be loaded and running simultaneously, making
>   migration/coexistence a breeze.
> 
> - EVMS infrastructure virtually guarantees compatibility with future plugin
>   modules allowing additional features to be added on top of the Linux LVM
>   volumes and/or volume groups.
> 
> - EVMS currently supports generic snapshots (i.e. - snapshoting
>    anything-to-anything under EVMS control)
> 
> > Why now ?
> 
> - The timing is right since, from reading the Linux LVM mailing list, we
> can
>    see that the Linux LVM on-disk format is undergoing some enhancements
>    for better reliability and recoverability. The scope of these changes
> may
>    affect a good deal of the current Linux LVM code base. The timing of
> these
>    changes provides a convenient opportunity to also consider switching
> over
>    to the EVMS infrastructure.  Furthermore, we have code for an initial
> set of
>    LVM plugins that currently support in-kernel LV/VG activation, complete
>    read & write support for existing Linux LVM volumes, and support for
>    Linux LVM snapshots. This code could make a reasonable starting point
>    for a transition to the EVMS infrastructure.
> 
>    To encourage you a little more, the EVMS project will be supporting
>    emulation of the AIX Logical Volume Manager. We would be happy to
>    offer the AIX disk format if you think that would be useful to your
> effort
>    to improve the Linux LVM on-disk format.
> 
> We hope you will join us as we look forward to working with you.
> 
> Thanks.
> 
> The EVMS Team
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
