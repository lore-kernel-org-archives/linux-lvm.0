Date: Mon, 19 Jun 2000 23:00:37 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: Re: [linux-lvm] groupship on /dev/<vg>/<lv> files
Message-ID: <20000619230037.E4867@hmsysv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <Pine.LNX.4.21.0006191257040.1848-100000@frame.pinchaser.com>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0006191257040.1848-100000@frame.pinchaser.com>; from chaser@mewl.net on Mon, Jun 19, 2000 at 01:02:06PM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Troy E. Ablan" <chaser@mewl.net>
Cc: linux-lvm@msede.com


Hi Troy,

actually TTBOMN it hasn't been discussed before ;-{)

If nobody complains i'll change that in the next release.

Regards,
Heinz      -- The LVM guy --


On Mon, Jun 19, 2000 at 01:02:06PM -0400, Troy E. Ablan wrote:
> Apologies if this has already been discussed on the list.  I did not find
> this in the archive.
> 
> It makes sense to me if lvcreate would put the device files for new
> volumes in group disk to match the disk block devices in /dev.  This
> makes sense as dump utils should be run as the context of a user
> with read access to the disks.
> 
> Thanks
> 
> -Troy

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
