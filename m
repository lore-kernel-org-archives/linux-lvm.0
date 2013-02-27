Received: from localhost (vpn1-4-78.ams2.redhat.com [10.36.4.78])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1RA4lqR006909
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2013 05:04:47 -0500
Date: Wed, 27 Feb 2013 10:04:46 +0000
From: thornber@redhat.com
Message-ID: <20130227100446.GB2459@raspberrypi>
References: <CAEZ+n-hGcgRPvc+Rx1co3G_Bd-n8mC+5LUhdkSqiz9PRdtt27Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEZ+n-hGcgRPvc+Rx1co3G_Bd-n8mC+5LUhdkSqiz9PRdtt27Q@mail.gmail.com>
Subject: Re: [linux-lvm] How does LVM-Cache work?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Feb 26, 2013 at 03:44:43PM -0300, Leo Antonio wrote:
> Hello, everyone.
> 
> I'm willing to do research about second-level cache using SSDs and I think
> that the best way to do this is using LVM/Device Mapper, because other
> implementations are based on FUSE, virtualization layers, and others.
> 
> What I'm trying to do is to develop a subsystem that will put hot
> blocks/PEs on SSDs-Cache, as well as group related blocks/PEs on cache
> automatically. Not simply put on SSD the most  used files or directories.
> 
> The problem is that I could not find any documentation about DM or LVM to
> help my research and development.
> 
> Could you point me to some documentation or what's the best way to
> accomplish this?

See my dm-cache target in this branch of my tree:

https://github.com/jthornber/linux-2.6/tree/thin-dev

https://github.com/jthornber/linux-2.6/blob/thin-dev/drivers/md/dm-cache-target.c

There's still a lot of work to do on the policy plug-ins, so if you
like to get involved that would be great.

- Joe
