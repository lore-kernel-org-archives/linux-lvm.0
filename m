Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Thu, 8 Feb 2001 09:14:18 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm buglet in 0.9.1_beta
Message-ID: <20010208091418.A529@tykepenguin.com>
References: <20010207134549.E525@tykepenguin.com> <200102071815.f17IFtN14302@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200102071815.f17IFtN14302@webber.adilger.net>; from adilger@turbolinux.com on Wed, Feb 07, 2001 at 11:15:55AM -0700
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

On Wed, Feb 07, 2001 at 11:15:55AM -0700, Andreas Dilger wrote:
> Patrick, you write:
> > On Wed, Feb 07, 2001 at 01:45:32AM -0700, Andreas Dilger wrote:
> > > It may not be exactly this.  AFAIK, when we call lvm_check_partitioned_dev()
> > > when we are scanning disks, I think this determines if LVM will start doing
> > > the gross DOS partition stuff.  Is it the case with these COMPAQ devices
> > > that they use DOS partitions?
> > 
> > I'm not sure - that's why I asked the user to test it for me! Anyway you can
> > partition any block device you like - or even a file :-)
> 
> Sure you can run fdisk on just about anything, but you can't access the
> partitions unless it is a partitioned device (i.e. the minor numbers
> mean "look at a partition").

I wasn't being entirely serious here, but the original bug report had 
a /proc/partitions file showing several minors attached to major 72 so it seemed
reasonable to me that it was partitioned.

It would be nice to know if adding the entries into lvm_check_partitioned_dev
did actually fix the problem.

 
> You also need to add "/dev/cciss" to lvm_dir_cache.c"
> 

Ta.

patrick
