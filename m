Return-Path: <root@srv.sistina.com>
Date: Tue, 17 Jul 2001 13:28:59 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] HUGE LVM log file...
Message-ID: <20010717132859.D17345@sistina.com>
References: <20010717131430.A17345@sistina.com> <Pine.LNX.4.31.0107171225320.12608-100000@erdos.shef.ac.uk>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.31.0107171225320.12608-100000@erdos.shef.ac.uk>; from g.liakhovetski@ragingbull.com on Tue, Jul 17, 2001 at 12:28:07PM +0100
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

On Tue, Jul 17, 2001 at 12:28:07PM +0100, Guennadi Liakhovetski wrote:
> > > My /var/log/lvm has grown up to 800MB+... and has filled up the disk...
> >
> > Remove it.
> > lvmsadc is probably filling it run by cron.
> 
> Thanks! But why / what for is it needed and why is it created by default
> without any size control?

It is not created/activated by default.
Someone must have put it into crontab.

But you are right: there's no size control so far.

> 
> Guennadi
> ___
> 
> Dr. Guennadi V. Liakhovetski
> Department of Applied Mathematics
> University of Sheffield, Sheffield, U.K.
> email: g.liakhovetski@sheffield.ac.uk
> 
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
