Received: from reti (vpn50-17.rdu.redhat.com [172.16.50.17])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i2B9IWuq011533
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 09:18:32 GMT
Received: from joe by reti with local (Exim 4.30)
	id 1B1MMJ-0003gi-Ap
	for linux-lvm@redhat.com; Thu, 11 Mar 2004 09:20:07 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] LVM2-Snapshot
Message-ID: <20040311092007.GD2138@reti>
References: <20040310173002.75ca7590.Christoph.Pleger@uni-dortmund.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040310173002.75ca7590.Christoph.Pleger@uni-dortmund.de>
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
Date: Thu Mar 11 04:16:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Mar 10, 2004 at 05:30:02PM +0100, Christoph Pleger wrote:
> Hello,
> 
> I have problems when I try to create a snapshot of a logical volume
> under LVM2 (Kernel 2.6.3). I get the following messages after using
> "lvcreate -s -l 227 -n snap /dev/vg1/lv1":
> 
> device_mapper ioctl cmd 9 failed: Invalid argument
> Couldn't load device 'vg1-snap'.
> Problem reactivating origin lv1
> 
> 
> How can I solve that?
> 
> Using google, I found that snapshots under LVM2 and Kernel 2.6 generally
> do not work. I hope that that is no longer true, is it? 

The snapshot target isn't in vanilla 2.6 yet, use my udm (unstable dm)
tree if you want that functionality.

http://people.sistina.com/~thornber/dm/

I _hope_ to submit this to lkml within the next month.

- Joe
