Return-Path: <root@srv.sistina.com>
Date: Tue, 17 Jul 2001 13:14:30 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] HUGE LVM log file...
Message-ID: <20010717131430.A17345@sistina.com>
References: <Pine.LNX.4.31.0107171209410.12608-100000@erdos.shef.ac.uk>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.31.0107171209410.12608-100000@erdos.shef.ac.uk>; from g.liakhovetski@ragingbull.com on Tue, Jul 17, 2001 at 12:13:36PM +0100
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

On Tue, Jul 17, 2001 at 12:13:36PM +0100, Guennadi Liakhovetski wrote:
> Hello
> 
> This is a (rather) urgent issue, so, I am posting it to the 2 lists,
> although, it might not be a bug.
> 
> My /var/log/lvm has grown up to 800MB+... and has filled up the disk...
> well, almost... Since it's ext2, there's still some space, only available
> for the root, and it is currently filling up that space too... What do I
> do with it?

Remove it.
lvmsadc is probably filling it run by cron.

> Is it ok to chop off its head / remove it, do I need it at
> all, how do I limit its size without a need to do it manually every time
> (except cron-job)?

Remove lvmsadc from the crontab in case you don't like/need the log anyway.

> 
> Please, help!
> 
> Thanks
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
