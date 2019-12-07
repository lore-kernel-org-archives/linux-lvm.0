Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AC9B2026D69
	for <linux-lvm@redhat.com>; Sat,  7 Dec 2019 20:53:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B58E4180063B
	for <linux-lvm@redhat.com>; Sat,  7 Dec 2019 20:53:10 +0000 (UTC)
Received: from wiki.gathman.org ([IPv6:2001:470:8:809::2])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id xB7KYraU031655
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 7 Dec 2019 15:34:56 -0500
Date: Sat, 7 Dec 2019 15:34:53 -0500 (EST)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <1p3erjcoc4qsk3gplvduhoep.1575740265800@gmail.com>
Message-ID: <alpine.LRH.2.21.1912071532450.27214@fairfax.gathman.org>
References: <1p3erjcoc4qsk3gplvduhoep.1575740265800@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Best way to run LVM over multiple SW RAIDs?
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

On Tue, Oct 29, 2019 at 12:14 PM Daniel Janzon <daniel.janzon@edgeware.tv> wrote:
> I have a server with very high load using four NVMe SSDs and
> therefore no HW RAID. Instead I used SW RAID with the mdadm tool.
> Using one RAID5 volume does not work well since the driver can only
> utilize one CPU core which spikes at 100% and harms performance.
> Therefore I created 8 partitions on each disk, and 8 RAID5s across
> the four disks.

> Now I want to bring them together with LVM. If I do not use a striped
> volume I get high performance (in expected magnitude according to disk
> specs). But when I use a striped volume, performance drops to a
> magnitude below. The reason I am looking for a striped setup is to

The mdadm layer already does the striping.  So doing it again in the LVM
layer completely screws it up.  You want plain JBOD (Just a Bunch
Of Disks).

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
