Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8HKPLku010415
	for <linux-lvm@redhat.com>; Fri, 17 Sep 2010 16:25:21 -0400
Received: from q7.q7.com (q7.q7.com [69.168.48.248])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8HKP6x1027242
	for <linux-lvm@redhat.com>; Fri, 17 Sep 2010 16:25:07 -0400
Received: from q7.q7.com (localhost [127.0.0.1])
	by q7.q7.com (8.13.1/8.13.1) with ESMTP id o8HKP6pD018785
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Fri, 17 Sep 2010 13:25:06 -0700
Received: from localhost (joey@localhost)
	by q7.q7.com (8.13.1/8.13.1/Submit) with ESMTP id o8HKP6MF018780
	for <linux-lvm@redhat.com>; Fri, 17 Sep 2010 13:25:06 -0700
Date: Fri, 17 Sep 2010 13:25:06 -0700 (PDT)
From: Joe Pruett <joey@q7.com>
In-Reply-To: <4C8A5F54.3060007@q7.com>
Message-ID: <alpine.LRH.2.00.1009171322010.18181@q7.q7.com>
References: <4C8A5F54.3060007@q7.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] changing pe size
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

> i have looked around the net and not found much info about this...

so i spent time experimenting...

> i have a centos 5 system with a 32m pe size vg and have attached some
> storage with an lvm1 4m pe size vg.  i converted the old vg to lvm2
> without problem, but i would like to merge the volumes and pvmove data
> onto the newer 32m pe pvs.  but you can't merge things with different pe
> size, so i've been trying to get the 4m pe vg changed to 32m pe.  after
> much monkeying around i was able to get all the pvs and lvs to have le
> counts that were the right size to be convertible to 32m pe.  but it
> looks like each segment must be sized appropriately and i can't find a
> way to merge segments together so that things are sized correctly.

it turns out that pvmove will coalesce adjecent segments.  so i was able 
to use a series of pvmoves to get all my segments to be contiguous and a 
mulitple of the new pe size i wanted.

once i did that, then vgchange -s worked just fine.
