Return-Path: <root@srv.sistina.com>
Date: Tue, 3 Jul 2001 12:01:38 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Request for misalignment tests
Message-ID: <20010703120138.C22955@sistina.com>
References: <20010626161947.A11918@sistina.com> <3B3A0F47.37860696@ida.xs4all.nl> <20010702130832.D18512@sistina.com> <15168.33453.645650.476763@rigel.oswf.de>
Mime-Version: 1.0
In-Reply-To: <15168.33453.645650.476763@rigel.oswf.de>; from john@oswf.de on Mon, Jul 02, 2001 at 04:18:21PM +0200
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

On Mon, Jul 02, 2001 at 04:18:21PM +0200, Werner John wrote:
> Dear Heinz
> 
> Heinz J. Mauelshagen writes:
> > 
> > Jorg,
> > 
> > please avoid recent CVS and if possible don't create PVs with
> > LVM versions > 0.9.1 Beta 5.
> 
> What if we have already done this some month ago?

It can only have hapend after 0.9.1 Beta 6 came out in March.
My provided one liner test shows you if it is the case then.

> pvmove until everything is fixed?

After it is fixed and your installation is update to the next LVM release
yuu should be able to pvmove PEs to other (temporary) PVs which are created
with new tools and correct alignment.

> Will there be a tool to fix bad PVs in
> use?

Unlikely :-(

> 
> > Sorry for the incenvenience.
> 
> Sorry for the questions ;-)

;-))

> 
> > Regards,
> > Heinz    -- The LVM Guy --
> > [...]
> 
> Best regards
> 
> Werner
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
