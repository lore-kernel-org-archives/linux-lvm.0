From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] (no subject)
Message-ID: <20020927123319.A8526@sistina.com>
References: <20020927075625.6255.qmail@webmail10.rediffmail.com>
Mime-Version: 1.0
In-Reply-To: <20020927075625.6255.qmail@webmail10.rediffmail.com>; from shuvodeep_ghosh@rediffmail.com on Fri, Sep 27, 2002 at 07:56:25AM -0000
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
Date: Fri Sep 27 07:20:52 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

"pvdisplay -v" and "lvdisplay -v" ist what you want either showing the
mapping of the physical extents to the logical volumes or vice versa.

On Fri, Sep 27, 2002 at 07:56:25AM -0000, Shuvodeep  Ghosh wrote:
> >Hello,
> >       How are you all doing.Its been quite sometime that i last 
> >mailed
> >you.I was  wondering if you could tell me the internals of how 
> >LVM
> >Snapshot works and the Logical to Physical Mapping in case of
> >logical volumes in LVM.To be precise, can you tell me how i 
> >could
> >find out the byte offset in a Physical Volume in case i would 
> >want
> >to find out the offset of the Bitmaps in a ext2fs on the 
> >Physical
> >volume.
> >
> >Thanx
> >Shuvodeep Ghosh
> >Snr. Programmer
> >eMend Technologies Pvt Ltd.
> >Kolkata
> >India.
> 
> 
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
