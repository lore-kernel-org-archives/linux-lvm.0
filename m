From: Kevin Corry <kevcorry@us.ibm.com>
Subject: Re: [linux-lvm] 2.6.7 and snapshots
Date: Tue, 22 Jun 2004 14:10:14 -0500
References: <35454.192.168.101.20.1087928919.squirrel@192.168.101.20>
In-Reply-To: <35454.192.168.101.20.1087928919.squirrel@192.168.101.20>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Message-Id: <200406221410.14271.kevcorry@us.ibm.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: DevMapper <dm-devel@redhat.com>, linux-lvm@redhat.com

On Tuesday 22 June 2004 1:28 pm, Donald Thompson wrote:
> Sorry I'm getting desperate...
>
> Whats the status on dm patches for 2.6.7? The patches available for
> 2.6.7-rc3 (the latest I've been able to obtain) don't insert cleanly into
> a vanilla 2.6.7 and its looking like it might be very difficult to hand
> patch the rejects. Due to security issues with 2.6.6, I'm very eager to
> get the 2.6.7 kernel installed, but I'm held back due to a snapshot
> requirement. I'm happy to test 'untested' patches if need be. If its a
> matter of man hours to port the patches to 2.6.7, I can help with that as
> well, but being lazy I'd rather not reinvent the wheel if something is
> already available or going to be soon.

I would recommend simply grabbing the latest -bk or -mm patch for 2.6.7. Most 
of what you're interested in will be in that patch, and will be in 2.6.8 
whenever it is released. The only reason you'll need -udm at this point is if 
you are using/testing dm-multipath.

http://www.kernel.org/pub/linux/kernel/v2.6/snapshots/patch-2.6.7-bk5.bz2

-- 
Kevin Corry
kevcorry@us.ibm.com
http://evms.sourceforge.net/
