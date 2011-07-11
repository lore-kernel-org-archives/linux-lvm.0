Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p6B2V8WK029459
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 22:31:08 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6B2V7xh020844
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 22:31:07 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p6B2V1Zt014425
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 19:31:03 -0700
Message-ID: <4E1A6065.8010209@tlinx.org>
Date: Sun, 10 Jul 2011 19:31:01 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4E19E3FD.9000805@tlinx.org>
	<20110710220815.GB7857@agk-dp.fab.redhat.com>
	<4E1A50C7.5090006@tlinx.org>
	<20110711022433.GD7857@agk-dp.fab.redhat.com>
In-Reply-To: <20110711022433.GD7857@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Bug!  lvs shouldn't need 'root' access
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



Alasdair G Kergon wrote:
> On Sun, Jul 10, 2011 at 06:24:23PM -0700, Linda A. Walsh wrote:
>   
>>   Why is CAP_SYS_ADMIN needed to access a disk device when device  
>> permissions
>> are already present for this?
>>     
>
> It is reading control information about the device, which is not the
> same as reading the device itself.
>
> A global CAP_SYS_ADMIN restriction is easy to implement and audit.
> Anything else increases complexity and security exposure and like I
> said, there's simply been hardly any demand to implement it - nor has
> there been demand for proper selinux integration.
>
> For now, configuring sudo is the closest you can get.
>   
----
    Which is what I'm ending up doing...

putting 'sudo' in all my scripts.

    It also means the 'lvs' command to show you how close your snapshots are
to full isn't readily available w/o sudo, (or building it into a script).

    As for reading control information -- um....is there a reason why 
the information
couldn't be exported through a /proc interface?



>   
