Received: from [172.16.31.174] (dhcp174.msp.redhat.com [172.16.31.174])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id iAMFaEgs030961
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 10:36:14 -0500
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
From: Kevin Anderson <kanderso@redhat.com>
In-Reply-To: <1100917096.4379.92.camel@tesuji.nac.uci.edu>
References: <1100857645.13422.99.camel@grma-lap>
	<1100888487.4379.9.camel@tesuji.nac.uci.edu>
	<20041119192447.GB10969@nile.gs.washington.edu>
	<1100909625.4379.51.camel@tesuji.nac.uci.edu>
	<20041120002207.GK3139@polop.usc.edu>
	<1100914586.4379.75.camel@tesuji.nac.uci.edu>
	<20041120020807.GP3139@polop.usc.edu>
	<1100917096.4379.92.camel@tesuji.nac.uci.edu>
Message-Id: <1101137773.3399.4.camel@dhcp174.msp.redhat.com>
Mime-Version: 1.0
Date: Mon, 22 Nov 2004 09:36:13 -0600
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2004-11-19 at 20:18, Dan Stromberg wrote:

> 
> Last I heard:
> 
> Sistina (prior to the Redhat purchase) had a roadmap for GFS, which
> included bringing it up to, but not surpassing, the 16 terabyte limit.
Plans were always to go way past 16TB, requires 64bit hardware
architectures and the 2.6 kernel to push the limits.
> 
> Since the Redhat purchase, my understanding is that this previous
> roadmap has been scrapped, and there are no longer any immediate plans
> to raise the GFS filesystem size limit from 2 terabytes to 16 terabytes
> - in which case, you can pretty much just use NFS, unless you're stuck
> with small disks or low density servers.  :)
> 
> I'd -really-like- to find out this isn't true.
> 
For the 2.6 kernel, GFS should be able to go to 16TB on 32bit machines. 
On 64 bit machines, the theoretical limit is something like 8 exabytes. 
If anyone wants to pony up that amount of storage, we would be more than
happy to give it a go.  In the meantime, smaller sizes are going to be
validated.  So, plans have not been scrapped or even changed much from
Sistina to Red Hat.
> 
> ______________________________________________________________________
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
