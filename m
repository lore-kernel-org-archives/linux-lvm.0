Date: Thu, 28 Sep 2000 18:25:30 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] Hi, all
Message-ID: <20000928182530.C24749@srv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <39D35753.33431713@hananet.net>
Mime-Version: 1.0
In-Reply-To: <39D35753.33431713@hananet.net>; from nalabi@hananet.net on Thu, Sep 28, 2000 at 11:36:03PM +0900
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nalabi <nalabi@hananet.net>
Cc: linux-lvm@msede.com


You need to activate ram disk _and_ initial ram disk in your kernel
configuration as well.

On Thu, Sep 28, 2000 at 11:36:03PM +0900, nalabi wrote:
> Hi, all
> 
> I can't make /boot/initrd.gz
> 
> I try to lvmcreate_initrd, But error...
> 
> -------------------->
> # lvmcreate_initrd
> 
> Logical Volume Manager 0.8 by Heinz Mauelshagen  06/08/1999
> 
> lvmcreate_initrd -- this script creates a LVM initial ram disk in
> /boot/initrd.gz
> 
> lvmcreate_initrd -- making ram filesystem
> 
> lvmcreate_initrd -- ERROR making ram disk filesystem
> ------------------------>
> 
> kernel  : 2.4.0-test7
> 
> I try compile and use a kernel with initrd support.
> 
> I hope make initrd.gz..
> 
> You  have "lvmcreate_initrd" script ,  and I send to my email.
> 
> 
> 
> 

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
