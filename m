From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM ext3 and lvreduce
Message-ID: <20021113145920.A2048@sistina.com>
References: <1037195718.3126.4.camel@corr11.doc.state.vt.us>
Mime-Version: 1.0
In-Reply-To: <1037195718.3126.4.camel@corr11.doc.state.vt.us>; from jkezar@doc.state.vt.us on Wed, Nov 13, 2002 at 08:55:18AM -0500
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
Date: Wed Nov 13 08:05:06 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Joseph,

you need to shrink the filesystem _before_ you lvreduce the logical volume.
Unmont it and use resize2fs to achieve this. e2fsadm which comes with LVM1
will run resize2fs and lvreduce correctly to achieve both size changes in
the correct sequence.

See e2fsadm(8) for details.

On Wed, Nov 13, 2002 at 08:55:18AM -0500, Joseph Kezar wrote:
> 
> 
> I have LVM working, and I have created all my logical volumes for my
> environment.  All of my logical volumes have been mkfs.ext3'd. 
> Everything works, except for when I try to change the size with lvreduce
> or lvextend.  These tools are happy to work, but when I remount my
> logvols and type: mount I see that in fact the size that is reported to
> the OS has not changed.
> 
> Is there any incompatabilities with LVM and Ext3?  
> Is there a comparable tool for ext3 like e2fsadm?
> Is it possible to resize an ext3 partition while it is online?
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
