Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q998iQVZ027785
	for <linux-lvm@redhat.com>; Tue, 9 Oct 2012 04:44:26 -0400
Received: from mail-bk0-f46.google.com (mail-bk0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q998iPA7015348
	for <linux-lvm@redhat.com>; Tue, 9 Oct 2012 04:44:25 -0400
Received: by mail-bk0-f46.google.com with SMTP id jk13so2349332bkc.33
	for <linux-lvm@redhat.com>; Tue, 09 Oct 2012 01:44:24 -0700 (PDT)
Message-ID: <5073E3E5.4050501@gmail.com>
Date: Tue, 09 Oct 2012 10:44:21 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <1995832.KOAsOlur8n@laptop>
In-Reply-To: <1995832.KOAsOlur8n@laptop>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Will RAID or mirror thin pools be supported?
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

Dne 8.10.2012 21:51, ben napsal(a):
> Is there any plan to implement thin pools that are mirrors or RAID devices or
> thin volumes that are mirrors or RAID?
>


lvcreate -m ....  vg/lv-mirror-1
lvcreate -m ....  vg/lv-mirror-2

lvconvert  --thinpool   vg/lv-mirror-1   --poolmetadata  vg/lv-mirror-2


with current git-head should be usable for experiments.


Zdenek
