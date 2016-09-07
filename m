Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u87Gft8K017859
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 7 Sep 2016 12:41:55 -0400
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 971CA9B0DD
	for <linux-lvm@redhat.com>; Wed,  7 Sep 2016 16:41:54 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id b187so125669072wme.1
	for <linux-lvm@redhat.com>; Wed, 07 Sep 2016 09:41:54 -0700 (PDT)
Received: from [192.168.192.99] (ip-94-113-160-102.net.upcbroadband.cz.
	[94.113.160.102]) by smtp.gmail.com with ESMTPSA id
	bj8sm39682189wjc.49.2016.09.07.09.41.51 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Sep 2016 09:41:52 -0700 (PDT)
References: <20160907092945.GG2480@suse.de>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <07804262-5ad5-4c24-f5ee-e0e97c41a4d3@gmail.com>
Date: Wed, 7 Sep 2016 18:41:51 +0200
MIME-Version: 1.0
In-Reply-To: <20160907092945.GG2480@suse.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm2 tarballs vanishing
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

Dne 7.9.2016 v 11:29 Marcus Meissner napsal(a):
> Hi,
>
> Is there a specific reasons that old LVM2 tarballs are removed from
> ftp://sources.redhat.com/pub/lvm2/
>
> e.g. there are wide gaps in the series 133-143 144-147 147-152 152-154 154-162 162-165
>

Yep,  some releases  are 'developmental' check-points,
others were found with some rather 'unwanted' bugs/features.

Anyway if you still really want to get those 
'obsoleted'/'unsupportable'/'broken'  (pick the word you like) files for 
studying purpose - see:

ftp://sources.redhat.com/pub/lvm2/releases/

eventually use git with proper tag   v2_02_XXX

But please never-ever try to do any distro release with those tarballs....

Regards

Zdenek
