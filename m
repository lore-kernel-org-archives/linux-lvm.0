Date: Mon, 30 Oct 2000 22:52:11 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] LVM Partition Dependency
Message-ID: <20001030225211.A26323@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <OFF2FCF487.B6859C5B-ON86256988.00627B8E@imation.com>
Mime-Version: 1.0
In-Reply-To: <OFF2FCF487.B6859C5B-ON86256988.00627B8E@imation.com>; from pbmonday@imation.com on Mon, Oct 30, 2000 at 12:02:01PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pbmonday@imation.com
Cc: linux-lvm@msede.com

On Mon, Oct 30, 2000 at 12:02:01PM -0600, pbmonday@imation.com wrote:
> 
> 
> 
> >> I'm trying to construct an LVM solution with block devices that are not
> >> located in the partition table (becuase they are not a local fixed
> physical
> >> disk).
> >Sounds like NBD or friends.
> 
> Yes, I'm actually using ENBD, but, same difference.
> 
> >It is less a question of beeing local to the machine because there's NBD
> >support build in anyway.
> 
> This is interesting...when was this support added to the LVM?

It was already in before 0.8final.

> 
> I'm not having any luck with pvcreate tool shipped with SuSE 6.4 and
> 
> LVM 0.8final.

It should work in 6.4 with NBD and major 43.
Did you run a "pvcreate -d" to figure the reason out?

> I will upgrade my LVM tools, maybe that will do the trick.
> 
> >> Just curious on how far I would have to go to "trick" or "modify" the
> LVM
> >> to accept something other than a local hard drive partition.
> >As i mentioned above: NBD should work.
> I assume you mean NBD should work natively, without any of the changes
> I mentioned to pvcreate?

Exactly.

"pvcreate -d" will help us to analyze what's going on.

> 
> Thanks for your very quick response.
> 

You're welcome :-)

> 
> 
> Paul

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
