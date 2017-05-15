Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8006219EFA
	for <linux-lvm@redhat.com>; Mon, 15 May 2017 08:08:51 +0000 (UTC)
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8493261D25
	for <linux-lvm@redhat.com>; Mon, 15 May 2017 08:08:49 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id v15so36434133wmv.1
	for <linux-lvm@redhat.com>; Mon, 15 May 2017 01:08:49 -0700 (PDT)
References: <f6fc4140fc2dc768e9eb18080f8442a5@xenhideout.nl>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <ea8a866c-a59a-20c3-a0fa-18374b5294f0@gmail.com>
Date: Mon, 15 May 2017 10:08:46 +0200
MIME-Version: 1.0
In-Reply-To: <f6fc4140fc2dc768e9eb18080f8442a5@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] on discards
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 15.5.2017 v 05:16 Xen napsal(a):
> On discards,
> 
> I have a thin pool that filled up when there was enough space, because the 
> filesystem hadn't issued discards.
> 
> I have ext4 mounted with the discard option, I hope, because it is in the list 
> of default mount options of tune2fs:
> 
> Default mount options:    user_xattr acl discard
> 
> What can I do to ensure that it won't happen again?
> 
> Is the filesystem really mounted with discard?
> 
> It doesn't say so anywhere.
> 


Hi


I'd not suggest to mount fs with discard - but rather run 'fstrim' in your 
cron once a while.

Standalone 'small trim' on deleted file is quite inefficient and will not 
resolve aggregation of continuous blocks for proper trimming.

For thin-pool - min size of trim is i.e. whole 64K chunk, - when it sits on 
SSD you need to even trim much multiple pool chunks to free something on your SSD.

When you run 'fstrim'   whole region of unused blocks is trimmed - to it's 
always biggest possible chunk.

Regards

Zdenek
