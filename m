Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBKGn8r03811
	for <linux-lvm@redhat.com>; Mon, 20 Dec 2004 11:49:08 -0500
Received: from Trademart-1.ednet.ns.ca (Trademart-1.EDnet.NS.CA [142.227.51.1])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBKGn6Jb025837
	for <linux-lvm@redhat.com>; Mon, 20 Dec 2004 11:49:06 -0500
Received: from trademart-2.ednet.ns.ca ([142.227.51.61] helo=[10.227.7.25])
	by Trademart-1.ednet.ns.ca with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.43) id 1CgQiY-0007xD-AI
	for linux-lvm@redhat.com; Mon, 20 Dec 2004 12:49:06 -0400
Message-ID: <41C70281.2070404@ednet.ns.ca>
Date: Mon, 20 Dec 2004 12:49:05 -0400
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM strategy: Is One VG Safe?
References: <a06100527bdebff37d57f@[129.98.90.227]>
In-Reply-To: <a06100527bdebff37d57f@[129.98.90.227]>
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

Maurice Volaski wrote:
> I plan to start with a hardware RAID (level 5) of one physical volume 
> and one volume group. Then create several logical volumes from it and 
> grow them each as they are needed pulling space from what's not used in 
> the volume group until all the space in the group eventually utilized.
> 
> Is it reasonable to believe that such an arrangement is stable enough 
> that if anything were to ever go wrong a with an individual logical 
> volume that it wouldn't impact the other logical volumes in that same 
> volume group or the volume group itself?

We have used the above setup for years (one VG/many LV on top of 
hardware RAID 5). It is stable for us.
