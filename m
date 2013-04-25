Received: from [10.10.58.55] (vpn-58-55.rdu2.redhat.com [10.10.58.55])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r3PFQY7j017380
	for <linux-lvm@redhat.com>; Thu, 25 Apr 2013 11:26:34 -0400
Mime-Version: 1.0 (Apple Message framework v1085)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <201304211237.12973.benscott@nwlink.com>
Date: Thu, 25 Apr 2013 10:26:33 -0500
Message-Id: <8633C31E-F644-4DC5-A7BD-9E64BB39503E@redhat.com>
References: <201304211237.12973.benscott@nwlink.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] How big can an LVM mirror log get?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

LV_size / region_size = region_cnt
region_cnt / 8 ~= number of bytes necessary for the log

So,
100GiB LV / 512kiB region size = 200,000 regions
200000 / 8 = ~25kiB log

It takes quite a bit to get the log to be large and if that happens and you don't like it, you can always increase the region size.

 brassow

On Apr 21, 2013, at 2:37 PM, Ben wrote:

> In my testing of LVM2 I have seen a mirror log up to 512KiB. Does anyone know, 
> outside of pathlogical use cases, what the largest mirror log that would be 
> created using the default region size? 
> 
> Thank you.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
