Received: from leguan.localdomain (sebastian-int.corp.redhat.com
	[172.16.52.221])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n0F9USPh016935
	for <linux-lvm@redhat.com>; Thu, 15 Jan 2009 04:30:29 -0500
Message-ID: <496F0233.7040101@redhat.com>
Date: Thu, 15 Jan 2009 10:30:27 +0100
From: Jaroslav Stava <jstava@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Allocation maps of a mirrored LV?
References: <20090113100902.GJ21131@lupe-christoph.de>	<b072968d0901141258n12aaea7nbccf0700bdda4512@mail.gmail.com>
	<20090115083656.GL21131@lupe-christoph.de>
In-Reply-To: <20090115083656.GL21131@lupe-christoph.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Lupe Christoph wrote:
> I can't find an option for pvs that prints the allocation map, nor for
> vgs. Any suggestions?
>   
Try
lvs VG -a --segments -o +devices
that should print all the information you need.

Regards,
Jaroslav Stava
