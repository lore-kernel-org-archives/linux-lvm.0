Date: Thu, 7 Sep 2000 22:42:23 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] LVM and I2O
Message-ID: <20000907224223.B23085@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <20000907161926.B21633@srv.t-online.de> <200009071728.LAA08377@lynx.turbolabs.com>
Mime-Version: 1.0
In-Reply-To: <200009071728.LAA08377@lynx.turbolabs.com>; from adilger@turbolinux.com on Thu, Sep 07, 2000 at 11:27:59AM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: mge@sistina.com, linux-lvm@msede.com

On Thu, Sep 07, 2000 at 11:27:59AM -0600, Andreas Dilger wrote:
> Heinz, you write:
> > _But_ in case a partiton is used to set up a Physical Volume it additionally
> > checks the partition type identifier to avoid accidents like overwriting
> > a native Linux partition.
> 
> This is "overly safe" and adds complexity to LVM.  There is no such safety
> check for mkfs or mkswap or fdisk or any number of other ways to destroy
> your disk...

That's obviously right ;-{(

If we drop the safety code in the LVM we will still have our officially
registered 0x8E LVM partiton type identifier which could even be missleading,
because the partition might be used for different purposes than beeing used
by LVM.

Other opinions?

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
