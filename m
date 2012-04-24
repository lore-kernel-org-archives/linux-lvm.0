Received: from mx2.redhat.com (ext-mx01.rdu.redhat.com [10.11.45.6])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q3OFJmSE029588
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 11:19:48 -0400
Received: from smtp2-1.tng.de (smtp2-1.tng.de [213.178.66.95])
	by mx2.redhat.com (8.13.8/8.13.8) with ESMTP id q3OFJkBf018676
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 11:19:47 -0400
Received: from smtp2-2.tng.de (smtp2-2.tng.de [213.178.66.96])
	by smtp2-1.tng.de (Postfix) with ESMTP id 60E9C7400E
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 17:19:44 +0200 (CEST)
Received: from smtp.tng.de (proxy02.mailcluster.tng.de [82.97.146.16])
	by smtp2-2.tng.de (Postfix) with ESMTP id 5954D9C0BB
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 17:19:44 +0200 (CEST)
Received: from [213.178.67.139] (myrmidia.tng.de [213.178.67.139])
	by smtp.tng.de (Postfix) with ESMTPSA id 50CD31FFE2
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 17:19:44 +0200 (CEST)
Message-ID: <4F96C48F.3040300@ki.tng.de>
Date: Tue, 24 Apr 2012 17:19:43 +0200
From: Jan-Hendrik Palic <billgotchy@ki.tng.de>
MIME-Version: 1.0
References: <4F969B43.2080504@ki.tng.de>
	<20120424095252.15fdcb07@bettercgi.com>
In-Reply-To: <20120424095252.15fdcb07@bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] calculating size of metadata.
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
To: linux-lvm@redhat.com

Hi,

On 24.04.2012 16:52, Ray Morris wrote:
> It's good think about this because running out of metadata space is no
> fun.

We had this problem already on an other system. We had to migrate to 
another storage with pain. The new storage has a larger space for the 
metadata for sure. .-)

But I want to understand and not only set this size to an high value. 
Therefore this question here.

> We use 181KB for about 300 LVs, where each snapshot is counted as
> two LVs because of the way it's stored.  That's based on the size of the
> backup. vgs shows 8 MB of metadata used, though:
>
> # vgs --units k -o vg_mda_count,vg_mda_free,vg_mda_size clones
> vgs  #VMda VMdaFree  VMdaSize
> vgs      3  7973.50k 16444.00k

Thank you and Lars for your replies. If I understand you right, I have 
to look to the count of LVs I will have in the future and not only on 
the size of my volumegroup.

Ok.

> In any event, on a 19,950,000 MB partition, even 64 MB of metadata
> would represent 0.0006% of the storage. To think of it another way, 64
> MB costs roughly 0.03 cents, so allocate plenty.

Lars stated in his mail to this list, that one entry for a LV should be 
less than 1kb. So if I calculate 2kb for this entry, I will be safe. I 
checked this here and I can confirm this.

If I have a metadata space of 64MB, I am able to create 32000 different 
LV (without snapshots). Right?

Well, that is enought, even with snapshots,

Anyway ... thank you for my enlightment. .-)

Best regards

Jan
