Return-Path: <mauelshagen@sistina.com>
Date: Wed, 25 Jul 2001 09:49:26 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] RE: [linux-lvm] *** ANNOUNCEMENT *** LVM 0.9.1 Beta 8 available at www.sistina.com
Message-ID: <20010725094926.A24413@sistina.com>
References: <8F120FA493CAD743B30EEB8F356985B5BB5822@AUSXMBT102VS1.amer.dell.com>
Mime-Version: 1.0
In-Reply-To: <8F120FA493CAD743B30EEB8F356985B5BB5822@AUSXMBT102VS1.amer.dell.com>; from Robert_Macaulay@Dell.com on Tue, Jul 24, 2001 at 10:26:03PM -0500
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

On Tue, Jul 24, 2001 at 10:26:03PM -0500, Robert_Macaulay@Dell.com wrote:
> If Im upgrading from beta 7 to beta 8 with lvm compiled as a module, do I
> have to re-patch the kernel source tree? I had the kernel tree from beta7,
> generated the patch from the beta8 tree, and when I went to apply it, it
> failed all over the place. Do I have to go back to a lvm-less copy of the
> kernel tree to get the upgrade accomplished? The README.1st didn't really
> say. Thanks

Robert,

that stays the same as it was before until vanilla is fully uptodate (sigh ;-)

You want to start with a fresh vanilla kernel and generate+apply the LVM patch
as discribed in PATCHES/README.

Regards,
Heinz    -- The LVM Guy --


> 
> -----Original Message----- 
> From: Heinz J . Mauelshagen 
> Sent: Tue 7/24/2001 4:57 PM 
> To: linux-lvm@sistina.com; lvm-devel@sistina.com;
> linux-kernel@vger.kernel.org; linux-fsdevel@vger.kernel.org 
> Cc: mge@sistina.com 
> Subject: [linux-lvm] *** ANNOUNCEMENT *** LVM 0.9.1 Beta 8 available at
> www.sistina.com
> 
> 
> 
> 
> Hi all, 
> 
> a tarball of the Linux Logical Volume Manager 0.9.1 Beta 8 is available now
> at 
> 
>    < http://www.sistina.com/ <http://www.sistina.com/> > 
> 
> for download (Follow the "LVM 0.9.1-Beta8" link). 
> 
> This release fixes several bugs including a PE alignment bug which 
> was introduced with LVM 0.9.1 Beta 6. 
> 
> In order to support all existing PEs, this release forces a minor 
> metadata format change. 
> 
> We strictly recommend that you read the metadata upgrade instructions 
> in README.1st contained in the tarball *before* you try to upgrade 
> your existing installations! 
> Support to downgrade the metadata format is included too. 
> 
> See the CHANGELOG file contained in the tarball for further information. 
> 
> Please help us to stabilize for LVM 1.0 ASAP and provide your test results, 
> bug fixes and advice. 
> 
> Feed back related information to <linux-lvm@sistina.com>. 
> 
> Thanks a lot for your support of LVM. 
> 
> -- 
> 
> Regards, 
> Heinz    -- The LVM Guy -- 
> 
> _______________________________________________ 
> linux-lvm mailing list 
> linux-lvm@sistina.com 
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> <http://lists.sistina.com/mailman/listinfo/linux-lvm>  
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> <http://www.sistina.com/lvm/Pages/howto.html>  
> 

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
