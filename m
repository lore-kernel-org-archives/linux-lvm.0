Date: Fri, 8 Sep 2000 09:13:29 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: Re: [linux-lvm] LVM and I2O
Message-ID: <20000908091329.A3232@gondor.com>
References: <20000907161926.B21633@srv.t-online.de> <200009071728.LAA08377@lynx.turbolabs.com> <20000907224223.B23085@srv.t-online.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000907224223.B23085@srv.t-online.de>; from Heinz.Mauelshagen@t-online.de on Thu, Sep 07, 2000 at 10:42:23PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Thu, Sep 07, 2000 at 10:42:23PM +0000, Heinz J. Mauelshagen wrote:
> On Thu, Sep 07, 2000 at 11:27:59AM -0600, Andreas Dilger wrote:
> > This is "overly safe" and adds complexity to LVM.  There is no such safety
> > check for mkfs or mkswap or fdisk or any number of other ways to destroy
> > your disk...

But mkfs and mkswap are tools that are normally only called manually by an
administrator who should know what he does.

Some lvm tools are called automatically from startup scripts, and if the
partition tables or other config have been changed they may try to access
the wrong partition, so some additional checks may be reasonable.

> If we drop the safety code in the LVM we will still have our officially
> registered 0x8E LVM partiton type identifier which could even be missleading,
> because the partition might be used for different purposes than beeing used
> by LVM.

What about making it a command line option? I can see three possible 
behaviours: 

- no checking of partition types at all
- use /proc/partitions, but do the partition type check wherever possible. 
  If we don't know where the partition table for a given partition is, try
  to use the partition
- require valid partition type, as we currently do. If we don't know how to
  find the partition type, don't use the partition.

I think the second mode could be the default. The first one is not too usefull,
but we may have some kind of --force option that skips the checks, some people
want to be able to shoot themselves in the foot.

Jan
