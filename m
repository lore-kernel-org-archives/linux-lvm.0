Received: from [10.34.131.225] (dhcp131-225.brq.redhat.com [10.34.131.225])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4RBHP71009216
	for <linux-lvm@redhat.com>; Wed, 27 May 2015 07:17:26 -0400
Message-ID: <5565A7C5.5000408@redhat.com>
Date: Wed, 27 May 2015 13:17:25 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <D1850E72.1B024%murali.balcha@triliodata.com>
In-Reply-To: <D1850E72.1B024%murali.balcha@triliodata.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] custom targets in lvm created dm tree
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
To: linux-lvm@redhat.com

Dne 22.5.2015 v 22:48 Murali Balcha napsal(a):
> Hi,
>
> We are planning to implement couple of custom targets and we want to add to
> lvm created dm tree. How tolerant is LVM with custom targets in its tree
> structure? For example if an LVM is resized when the tree has custom target,
> does it keep the custom target after resize. Are there any best practices that
> I need to follow adding custom targets?

In general - there trial plugin support for various targets
(as you can see i.e. with the '--with-thin=internal|shared|none' option.

However this plugin support is not generally well designed and thus target
often needs various tweaks across whole code base since every target usually 
brings-in something new which needs in certain situation special care
(i.e. even allocation of such LV might impose new restriction on extent 
allocator).

So I'm quite afaird lvm2 is not really capable to support 'external' plugin 
types for different targets.

So your best chance is probably to propose a new type of supported target
(you could start to look at i.e. thin-pool target support) - but I'm still 
afraid it's quite a big challenge trying to understand lvm2/dm internals -
there are many undocumented restrictions which are hard to easily follow.
So I expect target might need to be maintained by some lvm2 team member for 
full support.

Do you want to support/enhance some existing dm/lvm2 targets ?
(If not - is it going to be included in linux kernel ?)
Is even GPL code ?

What is the time frame for support inclusion you are looking for ?
(it might be quite lengthy process to fully support new --type)

Zdenek
