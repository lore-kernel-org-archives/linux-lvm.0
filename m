Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Tue, 23 Jan 2001 14:18:47 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] Dumb question
Message-ID: <20010123141847.D28863@srv.sistina.com>
References: <3A6D73AB.FC7E1753@infologic.fr>
Mime-Version: 1.0
In-Reply-To: <3A6D73AB.FC7E1753@infologic.fr>; from bs@infologic.fr on Tue, Jan 23, 2001 at 01:06:03PM +0100
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

On Tue, Jan 23, 2001 at 01:06:03PM +0100, Benoit SERRA wrote:
> Is LVM faster when you don't compile it as a module ?

As Patrick pointed out: no.

You can't almost measure LVM's impact on performance at all.
A different thing is the overhead implied when you take snapshots of logical
volumes because there's additional writes for every write to the original
logical volume necessary which degrades performance almost linear.

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
