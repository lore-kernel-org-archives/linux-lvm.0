Received: from reti (vpn50-34.rdu.redhat.com [172.16.50.34])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i2AFhEuq009937
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 15:43:14 GMT
Received: from joe by reti with local (Exim 4.30)
	id 1B15sy-0000W5-U8
	for linux-lvm@redhat.com; Wed, 10 Mar 2004 15:44:44 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] [PATCH] calc_max_buckets bug
Message-ID: <20040310154444.GE643@reti>
References: <1078927858.25064.1468.camel@watt.suse.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1078927858.25064.1468.camel@watt.suse.com>
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
Date: Wed Mar 10 10:42:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Mar 10, 2004 at 09:10:59AM -0500, Chris Mason wrote:
> Hello everyone,
> 
> This is in both 2.4.x lvm and 2.6.x dm code, calc_max_buckets is broken
> for 32bit machines with > 4GB of ram.  This leads to -ENOMEM errors
> during snapshot creation.

heh, this must be the only bit of code I copied from LVM1 :) Serves me
right for being lazy.

Thanks,

- Joe
