Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5UMYn026262
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 18:34:49 -0400
Received: from mail.gurulabs.com (mail.gurulabs.com [67.137.148.7])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5UMYgXn005736
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 18:34:42 -0400
Date: Wed, 30 Jun 2004 16:34:41 -0600 (MDT)
From: Dax Kelson <dax@gurulabs.com>
Subject: Re: [linux-lvm] Viewing logical/physical mapping when striping
In-Reply-To: <Pine.GSO.4.58.0406302311560.15758@jekyll.uws.edu.au>
Message-ID: <Pine.LNX.4.44.0406301632400.21666-100000@mooru.gurulabs.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David J N Begley <d.begley@uws.edu.au>, LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 30 Jun 2004, David J N Begley wrote:

> Here's where my mind really gets screwed-up - if I throw data at the LVs, the
> read/write pattern tends to indicate that the striping _is_ working, which
> then contradicts the mapping that 'lvdisplay -v' shows!
> 
> What's happening?  Are LEs always mapped to PEs in a linear fashion whilst
> striping occurs at some lower (per-chunk-of-an-LE) layer?

My understanding that this behaviour you are seeing is coming from the 
*filesystem* (ext3, or whatever you are using).

I bet if you used dd, such as:

dd if=/dev/zero of=/dev/VG0/LV0 

And watch the write pattern it would be linear.

Dax Kelson
Guru Labs
