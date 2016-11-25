Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAP9Uhcf006888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2016 04:30:43 -0500
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33B5E635E2
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2016 09:30:42 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id a197so137538649wmd.0
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2016 01:30:42 -0800 (PST)
Received: from [10.34.130.232] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	w7sm12428686wmd.24.2016.11.25.01.30.39 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 01:30:40 -0800 (PST)
References: <kcim.5838018e.2209.36b950052698aabe@ucs.cubewerk.intern>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <729f6285-1b10-c8cc-1a07-2441414da7ba@gmail.com>
Date: Fri, 25 Nov 2016 10:30:39 +0100
MIME-Version: 1.0
In-Reply-To: <kcim.5838018e.2209.36b950052698aabe@ucs.cubewerk.intern>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] auto_activation_volume_list in lvm.conf not honored
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

Dne 25.11.2016 v 10:17 Stefan Bauer napsal(a):
> Hi Peter,
>
> as i said, we have master/slave setup _without_ concurrent write/read. So i do not see a reason why i should take care of locking as only one node is activating the volume group at the same time.
>
> That should be fine - right?

Nope it's not.

Every i.e. activation  DOES validation of all resources and takes ACTION when 
something is wrong.

Sorry, but there is NO way to do this properly without locking manager.

Although many lvm2 users always do try to be 'innovative' and try to use in 
lock-less way - this seems to work most of the time - till the moment some
disaster happens - then just lvm2 is blamed about data loss..

Interestingly they never tried to think why we invested so much time into 
locking manager when there is such 'easy-fix' in their eyes...

IMHO lvmlockd is relatively 'low-resource/overhead' solution worth to be 
explored if you don't like clvmd...

Regards

Zdenek
