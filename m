Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6JJebV19529
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2005 15:40:37 -0400
Received: from sklave3.rackland.de (sklave3.rackland.de [213.133.101.23])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6JJePS1025575
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2005 15:40:29 -0400
Received: (from hadmut@localhost)
	by sklave3.rackland.de (8.13.2/8.13.2/Debian-1) id j6JJeCNd000321
	for linux-lvm@redhat.com; Tue, 19 Jul 2005 21:40:12 +0200
From: Hadmut Danisch <hadmut@danisch.de>
Date: Tue, 19 Jul 2005 21:40:12 +0200
Subject: Re: [linux-lvm] LVM can't detect raid-1 mirrors?
Message-ID: <20050719194012.GA32719@danisch.de>
References: <20050718090226.GA4083@danisch.de>
	<20050718092926.GA4911@danisch.de>
	<5bd7d4014a8e197164c3ed203dace6ef@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5bd7d4014a8e197164c3ed203dace6ef@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jul 18, 2005 at 09:56:30AM -0500, Jonathan E Brassow wrote:
> Have you tried using the filters?
> 
>  brassow

Setting md_component_detection = 0  to 1 solved the problem.



regards
Hadmut
