Return-Path: <hal@hal.mailgate.net>
Date: Fri, 15 Jun 2001 17:57:38 +0200
From: Hugo Lombard <hal@mailgate.net>
Subject: Re: [linux-lvm] expanding physical disks
Message-ID: <20010615175738.F21571@hal.mailgate.net>
References: <20010612212804.P1658@pc.ilinx> <200106130710.f5D7AhaX005430@webber.adilger.int> <20010613152032.A18554@colombina.comedia.it> <20010615161151.B9980@hal.mailgate.net> <20010615165135.A4266@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010615165135.A4266@sistina.com>; from Mauelshagen@sistina.com on Fri, Jun 15, 2001 at 04:51:35PM +0200
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

On Fri, Jun 15, 2001 at 04:51:35PM +0200, Heinz J. Mauelshagen wrote:
> On Fri, Jun 15, 2001 at 04:11:51PM +0200, Hugo Lombard wrote:
> > 
> > If you're using LVM primarily as a way to make it possible for you to
> > expand your storage space on-line (and on-mount-point) wouldn't it be
> > "easier" to _just_ use the RAID? i.e. expand the RAID volume on the
> > controller, so basically the "disk" is bigger now, and the just "grow"
> > your partition, extend your filesystem, and that's it?
> 
> I think you're right in case you can live with the restrictions involved.
> 

I'm right!?!?! Mother would be so proud!! ;)

> If the amount of resizable volumes a single smart controller can support is
> enough, you can surely go with that solution. When it comes to more storage
> you need a logical volume manager to group multiple disk subsystems together
> in order to support large storage configurations.
> 

*nod*  As usual, there's no universal answer, and it depends on you
needs/configuration/preference/phase of moon...

> > 
> > It's a thought I've been toying with since seeing the IBM ServeRAID's
> > capability to grow volumes.  I've not attempted any testing though, so
> > this is pure speculation...
> > 
> > (PS: All this means nothing if you're using LVM for it's other
> > features, like striping, but then the RAID can do that too...)
> 
> Plus LVM's features to move data around online in order to relocate it to
> faster/bigger/newer disk subsystems, to have more that just a couple of 
> resizable devices, support for hardware block device reconfiguration without
> any changes in the namespace of the logical volumes, snapshot support etc.
> 

Very important features to consider, for sure.

-- 
Dorothy:	But how can you talk without a brain?
Scarecrow:	Well, I don't know... but some people without brains
		do an awful lot of talking.
		-- The Wizard of Oz
---------------------------------------------------------------------------
 Hugo Lombard                    Infoline (Pty) Ltd
 System Administrator
---------------------------------------------------------------------------
