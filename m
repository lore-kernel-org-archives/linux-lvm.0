Date: Thu, 23 Aug 2001 22:42:27 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan && vgchange -ay at startup
Message-ID: <20010823224227.C17378@sistina.com>
References: <20010821130033.D402@sky.net> <20010821070403.A16248@sistina.com> <3B8267F5.D3174CAB@tls.msk.ru> <20010821160012.E25747@dragon.blacknet.de> <20010821112252.A21206@sistina.com> <20010822213148.C29990@mail.wave.co.nz>
Mime-Version: 1.0
In-Reply-To: <20010822213148.C29990@mail.wave.co.nz>; from markv@wave.co.nz on Wed, Aug 22, 2001 at 09:31:48PM +1200
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

On Wed, Aug 22, 2001 at 09:31:48PM +1200, Mark van Walraven wrote:
> On Tue, Aug 21, 2001 at 11:22:52AM -0500, AJ Lewis wrote:
> > Yeah, that's in the works for the development version of LVM, but the 1.0x
> > series will likely always have the files in /etc.  I agree that it is better
> > not to have it write files by default, or at least not rely on them being
> > written out.
> 
> May I request a feature for the 1.0x series?  A command-line option
> for vgscan and vgchange, to specify the directory containing lvmconf,
> lvmtab and lvmtab.d.

In future versions, there'll be config file support in LVM covering
what you request and more :-)

> 
> Regards,
> 
> Mark.
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
