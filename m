Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8LDchi4027834
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2006 14:38:43 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GQOlH-0002gs-Dp
	for linux-lvm@redhat.com; Thu, 21 Sep 2006 14:38:43 +0100
Date: Thu, 21 Sep 2006 14:38:43 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvs and pvscan does not show my PV's
Message-ID: <20060921133843.GW17654@agk.surrey.redhat.com>
References: <ab53550609210628v3fbaf1a0sb9f569faf8542389@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab53550609210628v3fbaf1a0sb9f569faf8542389@mail.gmail.com>
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

On Thu, Sep 21, 2006 at 09:28:15AM -0400, Bernard Fay wrote:
> Does someone can tell my why on my actual system pvs or pvscan does not list
> the PV's?
 
Check what version of lvm2 you're using - broken for a while; fixed in 2.02.07.
  Fix PV tools to include orphaned PVs in default output again.

Alasdair
-- 
agk@redhat.com
