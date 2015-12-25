Received: from [10.40.200.18] (ovpn-200-18.brq.redhat.com [10.40.200.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBPIbUJn018115
	for <linux-lvm@redhat.com>; Fri, 25 Dec 2015 13:37:31 -0500
References: <CAAYit8SM0KNv88TiOqD9mNBrk4DX3dG9AcRA9V9aZvAQdJt7vw@mail.gmail.com>
	<567BB51A.4070101@redhat.com>
	<CAAYit8RpRFgYyeHmxyhOco=gxnYgoGPJBa_ssY+xq-D3S70GPw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <567D8CE9.3030101@redhat.com>
Date: Fri, 25 Dec 2015 19:37:29 +0100
MIME-Version: 1.0
In-Reply-To: <CAAYit8RpRFgYyeHmxyhOco=gxnYgoGPJBa_ssY+xq-D3S70GPw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Possible bug in expanding thinpool: lvextend
 doens't expand the top-level dm-linear device
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 25.12.2015 v 03:27 M.H. Tsai napsal(a):
> Hi,
>
> Sorry, what's the purpose of commit cd8e95d9337207a8f87a6f68dc9b1db7e3828bbf ?
>

Ahh my mistake - related to rename...

> Another issue is, the current code suspends the first thin volume
> (just the first one!)
> while extending a thinpool, which is unnecessary and also harms IO performance.
>
> Also, If the top-level "fake" pool device is unimportant, why not
> remove it, or simply
> make tp1 as a thin-pool target? It seems that the commit 00a45ca4 want
> to do this,
> it removes the -tpool layer while activating a new thinpool. But if
> there are thin
> volumes, the -tpool layer back again. This make me confused -- Do we really need
> layers?
>

It's not so simple - since the user may activate  thin-pool without activation 
of any thin-volume, and keep thin-pool active while thin-volumes are activated 
and deactivated - so it's different case if user activates
thin-pool explicitly or thin-pool is activated as thin volume dependency.

Also thin-pool LV has its own cluster lock which is quite complicated to 
explain, but for now -  thin-pool size is unimportant, but it's existence is 
mandatory :)

There is no simple way to avoid using current  'layer' logic, but as said
I've already do have some plan how to go without 'extra' layer 'fake' LV,
but it will take some time to implement.

Regards

Zdenek
