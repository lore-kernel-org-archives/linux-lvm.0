Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49E2F60461
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 21:36:50 +0000 (UTC)
Received: from mr002msb.fastweb.it (mr002msb.fastweb.it [85.18.95.86])
	by mx1.redhat.com (Postfix) with ESMTP id B9309C047B64
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 21:36:47 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 12 Sep 2017 23:36:45 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <418002318.647314.1505245480415@mail.yahoo.com>
References: <418002318.647314.1505245480415.ref@mail.yahoo.com>
	<418002318.647314.1505245480415@mail.yahoo.com>
Message-ID: <4dcfc4a557e98e0f98c6a1d568538d07@assyoma.it>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: matthew patton <pattonme@yahoo.com>
Cc: linux-lvm@redhat.com

Il 12-09-2017 21:44 matthew patton ha scritto:
>>  Wrong: Qemu/KVM *does* honors write barrier, unless you use  
>> "cache=unsafe".
> 
> seems the default is now 'unsafe'.
> http://libvirt.org/formatdomain.html#elementsDisks

The default is cache=none

> Only if the barrier frame gets passed along by KVM and only if you're
> running in "directsync" (or perhaps 'none?') mode there is no
> guarantee any of it hit the platter. Let's assume a hypervisor I/O is
> ahead of VM 'A's barrier frame, and blows up the thinLV. Then yes it's
> possible to propagate the ENOSPACE or other error back to the VM 'A'
> to realize that write didn't actually succeed. The rapid failure
> cascade across resident VMs is not going to end well either.

fsynched writes that hits a full pool returns EIO to the upper layer

> But if that's the only condition it works under they why bother with
> XFS on top of thin? You already mentioned that XFS is lousy about
> actually detecting underlying block layer problems until much too
> late. Just provision the Thin LV and map it directly to the VM. If
> your choice of hypervisor is broken, fix it, or choose another that
> doesn't have the problem. But really, using ThinLV for guest VM and
> asking the hypervisor to not blow up is nuts. Buy a friggin disk. Or
> put the onus on try/error where it belongs - inside the guest VM. Why
> is that so hard?

KVM is the most valid GPL hypervisor, and libvirt is the virtualization 
library of choice.
But I can not fix/implement thin pool/volumes management alone.

> You're a web-hosting company and you're trying to duck the laws of
> economics and the reality of running a business where other often
> clueless people trust you to keep their data intact?

Please, don't elaborate on things you don't know.
I asked a specific question on the linux-lvm list, and (as always) I 
learnt something. I don't see any problem in doing that.

> Given the screwball way you're going about handling your customer
> data, why are you trying to be 'creative'? Storage is your MOST
> important and vital capability and naturally your most expensive. Get
> real and spend the money. Storage is where you NEVER cut corners and
> you NEVER attempt naive optimization efforts.
> 
> I'm not quibbling over XFS, you could have picked EXT4 for all I care.
> The point is you're trying to get jiggy with customer data to save
> pennies. We have a saying, picking up pennies in front of a road
> paver. If you're selling capacity you don't have, it's not only
> dishonest, but there are proven and well understood ways to do so (eg.
> NFS or thin-alloc iSCSI) aimed at a proper storage head that is
> properly managed. But ultimately you HAVE to be able to satisfy the
> instant demands of all users even if that means they all suddenly wake
> up and want to use what you supposedly sold them and entered into a
> contract to supply by taking  their money.

Again, please don't speak about things you don't know.
I am *not* interested in thin provisioning itself at all; on the other 
side, I find CoW and fast snapshots very useful.

> Computing/Storage is not a ponzi scheme.

Thanks for remind me that.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
