Received: from reti (vpn50-31.rdu.redhat.com [172.16.50.31])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i2590huq031541
	for <linux-lvm@redhat.com>; Fri, 5 Mar 2004 09:00:43 GMT
Received: from joe by reti with local (Exim 4.30)
	id 1AzBDE-00010T-Rb
	for linux-lvm@redhat.com; Fri, 05 Mar 2004 09:01:44 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] linux 2.6.3 -- device-mapper: dm-linear: Device lookup failed
Message-ID: <20040305090144.GC744@reti>
References: <20040305003050.GA4134@yggdrasil.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040305003050.GA4134@yggdrasil.localdomain>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Mar  5 03:59:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Mar 04, 2004 at 06:30:51PM -0600, Greg Norris wrote:
> When I boot up under 2.6.3 or 2.6.4-rc[12], I get several occurrences
> of the message listed below.  All of the filesystems are mounted
> successfully, however, and I don't notice any problems once it's up.
> Is this something I should be concerned about?  If so, what do I need
> to check?
> 
>    kernel: device-mapper: dm-linear: Device lookup failed

This is a serious error, it means that device mapper was asked to
instance a linear mapping across a non-existent device.  Could you
turn on verbose logging in the LVM2 tools, and try and find out which
LV is failing to activate please ?

- Joe
