Received: from reti (vpn50-17.rdu.redhat.com [172.16.50.17])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i2B9Gguq011438
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 09:16:43 GMT
Received: from joe by reti with local (Exim 4.30)
	id 1B1MKX-0003gV-Ju
	for linux-lvm@redhat.com; Thu, 11 Mar 2004 09:18:17 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] [PATCH] calc_max_buckets bug
Message-ID: <20040311091817.GC2138@reti>
References: <1078927858.25064.1468.camel@watt.suse.com> <20040310154444.GE643@reti> <1078942647.25076.1530.camel@watt.suse.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1078942647.25076.1530.camel@watt.suse.com>
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
Date: Thu Mar 11 04:14:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Mar 10, 2004 at 01:17:27PM -0500, Chris Mason wrote:
> Do you see any problems with using a smaller fixed size on the hash
> table.  It seems like 2MB should be enough to me.

I've done no experiments in this area.

- Joe
