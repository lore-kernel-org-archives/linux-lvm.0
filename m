From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] raid and lvm
Message-ID: <20030128145317.G11767@zealot.blacknet.de>
References: <1043751787.3989.20.camel@sidell.home.network>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1043751787.3989.20.camel@sidell.home.network>; from si@mindspring.com on Tue, Jan 28, 2003 at 05:03:07AM -0600
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
Date: Tue Jan 28 07:54:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

On Tue, Jan 28 '03 at 05:03, SI Reasoning wrote:
> I was reading back in 1999 mailing list about trying to merge in some
> raid functions into lvm. Did this ever happen?
except for striping (some call it RAID0) it did not happen

> Is it possible to use lvm to safeguard data (like raid 5) so that if a
> hard drive fails, the data is picked up by another volume group/or
> parts of the volume group not on the failed drive?
Why do people always want to bloat everything? LVM is one funcunality
and RAID a different one, you can layer tham as you please and get the
benefit of both with out any efford. So why should anyone integrate
them.

I know that the device mapper allows to add RAID5 functionality, but in
a different way (not as part of LVM, but as a plugin into DM)
-- 
Goetz Bock       (c) 2003 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
