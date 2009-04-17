Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3H8X9qU005795
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2009 04:33:09 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3H8WopU006941
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2009 04:32:51 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 06AB38732D
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2009 10:32:50 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id YlMAaFOQDsXz for <linux-lvm@redhat.com>;
	Fri, 17 Apr 2009 10:32:49 +0200 (CEST)
Date: Fri, 17 Apr 2009 10:32:49 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid
	10"? >>> Use HARDWARE RAID CONTROLLERS
Message-ID: <20090417083249.GA1483@maude.comedia.it>
References: <49DCA275.8070203@Calva.COM> <49DDA10D.3070005@awerner.homeip.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49DDA10D.3070005@awerner.homeip.net>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Apr 09, 2009 at 09:17:33AM +0200, Axel Werner wrote:
> Why you need RAID 10 at all ?
>
> Usualy because the need of performance and additional redundancy/fault 
> tollerance.
> So if u need performance a "Software RAID Solution" would always be a bad 
> choice. If you need some sort of redundancy and no performance, go for it. 
> if u need performance youll better get yourself a real HARDWARE RAID 
> CONTROLLER for your drives. Those cost a bit. but are worth it.

i have a couple usage cases for raid10 that make your point ridiculus

i have two san attached storages in two different buildings,
they present a number of lun (each is raid-5 (3+1)). those will likely
outperform your icp vortex by some order of magnitude, still it is not
enough for me, so i would use striping, between different luns to
achieve more iops.

now i said they were 2 and in two different buildings, this is why i use
mirroring, in case an entire building is unavailable. yes i have servers
in both building.

having this integrated seamlessly in lvm would be nice, so i could use
lvm locking integration with cluster software.

the other scenario is when i already have a striped lv and want to
mirror it for migration to a different storage.

L.

-- 
Luca Berra -- bluca@comedia.it
          Communication Media & Services S.r.l.
   /"\
   \ /     ASCII RIBBON CAMPAIGN
    X        AGAINST HTML MAIL
   / \
