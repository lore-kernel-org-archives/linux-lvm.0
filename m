Received: from jeltz.chrissie.net (vpn-6-2.fab.redhat.com [10.33.6.2])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m09ERPFP017188
	for <linux-lvm@redhat.com>; Wed, 9 Jan 2008 09:27:25 -0500
Message-ID: <4784D9C8.1030203@redhat.com>
Date: Wed, 09 Jan 2008 14:27:20 +0000
From: Patrick Caulfeld <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] CLVM
References: <000c01c852c8$524660e0$eef8a8c0@pingwinek>
	<4784D565.1030702@redhat.com>
In-Reply-To: <4784D565.1030702@redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Bryn M. Reeves wrote:
> admin wrote:
>> Hi,
>> I wan't to use clvm but without cman and related packages, is this
>> possible. When i was trying to compile lvm to use clvm i need to add
>> --with-clvmd but there were problem with dependencies so I need to
>> compile cluster first. I'm using debian and don't need cluster and gfs,
>> only clvm.
> 
> 
> The clvm deamon currently depends on the RHCS infrastructure (cman, dlm).
> 
> In principal it's possible to make it work with other cluster software
> but you'll need to add support for whatever locking and membership
> mechanisms you're using.
> 
> See the code in daemons/clvmd/{clvmd-cman,clvmd-gulm,clvmd-openais}.c
> that interfaces to the different versions of RHCS and the cluster_ops
> struct in clvmd-comms.h to get some ideas.


That's good advice. clvmd will run with 'just' openais, but you need to
configure it yourself and it's not well tested. If you need to adapt
clvmd for other clustering infrastructures then clvmd-openais.c is the
file to adapt as it's by far the simplest. Though it does require that
the cluster software provides messaging as a service.

Patrick
