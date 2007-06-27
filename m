Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5RIv3Um018037
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2007 14:57:03 -0400
Received: from carpentier.vpsland.com (carpentier.vpsland.com [207.210.113.97])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l5RIv0YX008960
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2007 14:57:01 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by carpentier.vpsland.com (Postfix) with ESMTP id 8955818246
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2007 20:56:54 +0200 (CEST)
Received: from carpentier.vpsland.com ([127.0.0.1])
	by localhost (carpentier.vpsland.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id M2tf3DdkWYlk for <linux-lvm@redhat.com>;
	Wed, 27 Jun 2007 20:47:04 +0200 (CEST)
Received: from soetens.vdberg.org (h8441201224.dsl.speedlinq.nl
	[84.41.201.224])
	by carpentier.vpsland.com (Postfix) with ESMTP id 0649118240
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2007 20:42:31 +0200 (CEST)
Received: from [192.168.0.14] (82-170-10-11.dsl.ip.tiscali.nl [82.170.10.11])
	by soetens.vdberg.org (Postfix) with ESMTP id 6587A14C1C6
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2007 20:42:30 +0200 (CEST)
Message-ID: <4682AF92.8050303@vdberg.org>
Date: Wed, 27 Jun 2007 20:42:26 +0200
From: Richard van den Berg <richard@vdberg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] recover one LVM disk without the other
References: <4682A5BE.1050409@apollo.sr.unh.edu>
In-Reply-To: <4682A5BE.1050409@apollo.sr.unh.edu>
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

burlen wrote:
> How can I recover this drive? Really all I need to do is mount it and
> recover some data then we can repartion/ format it as well.

It should be a simple matter of using "vgscan" to activate the volume
groups. Of course this will only work if the volume groups do not
contain any physical volumes that were on the failed drives. If the vgs
do come up, use "lvdisplay" or "lvs" to display the logical volumes that
you can mount.

Sincerely,

Richard van den Berg
