Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2D486017B
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2017 09:12:10 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B6CA7E426
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2017 09:12:09 +0000 (UTC)
References: <CALuPYL3fiHTGbxBFCeQw+HMEAwZBKs2HBMBuThnDFAHDCsDAsQ@mail.gmail.com>
	<CALuPYL3NMm7xrfemcbQ7Kt511rL=VrS7cKi0J0HBKjq8z7QDyg@mail.gmail.com>
	<CALuPYL2R1vLb5TY6CHEcC_m653oSyRHF2UBOU3if5fg2R8bCPg@mail.gmail.com>
	<CALuPYL0ohSNtaC4N97WWUHbW3J8DfnzhT1Pd=iTe_pFvhN2tjw@mail.gmail.com>
	<CALuPYL3EY2EjGER-Fhz0QW8Mu+LBE-L8oOAYo8=Eu9WwawCbgg@mail.gmail.com>
	<CALuPYL1KRtc5e-ZQOqCKE4fyNt9WAgKzBNDdn-6N52yEEQxvEA@mail.gmail.com>
	<CALuPYL26eMycV=h5ZLHTejWNSh-kwYdMKrNnfR7EfKNM83VBLQ@mail.gmail.com>
	<CALuPYL1uwtmaCS8PoVd6F4Y9u4qqhqtyST0yZi77H7fNdi2XUQ@mail.gmail.com>
	<CALuPYL1=MUfFawNOdSpSO-9az3m1vvWF3Y3jCrertFr5M3NewA@mail.gmail.com>
	<CALuPYL2=kUoNv=VhvKqzqEM9E0QOe5vjeopGAC4oZ8_=0TUhDg@mail.gmail.com>
	<CALuPYL2sLeTe8M7KgBGPbMkZWBQAGaOkkj0SS6ovHTg_0SCmuQ@mail.gmail.com>
	<CALuPYL1UVWO1013K7zna4xcBLQYx2zB1beJXVYpOyXWd=209Sw@mail.gmail.com>
From: Eric Ren <zren@suse.com>
Message-ID: <611a15f8-dd20-ac38-8be4-afd050a82293@suse.com>
Date: Fri, 13 Oct 2017 17:11:56 +0800
MIME-Version: 1.0
In-Reply-To: <CALuPYL1UVWO1013K7zna4xcBLQYx2zB1beJXVYpOyXWd=209Sw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: Re: [linux-lvm] Shared VG, Separate LVs
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Indivar Nair <indivar.nair@techterra.in>

Hi,

> With CLVM / HA-LVM on a 2 node cluster -
>
> Is it possible to have a shared VG but separate LVs, with each LV 
> exclusively activated on different nodes in a 2 node cluster.
> In case of a failure, the LV of the failed node will be activated on 
> the other node.

I think clvm can do what you want if you perform LVM commands by hand. 
But, with HA cluster manager (pacemaker) you cannot
do it with the current resource agents (clvm + LVM) [1] [2], because 
they do failover at a VG basis.

We are currently working on new resource agents [3] for lvmlockd [4]. 
The new agents can do activation on LV basis, but I won't
recommend doing that if there's no strong reason. It makes things much 
more complicated.

[1] 
https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/clvm
[2] https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/LVM
[3] https://www.redhat.com/archives/linux-lvm/2017-January/msg00025.html
[4] https://github.com/ClusterLabs/resource-agents/pull/1040

Eric
