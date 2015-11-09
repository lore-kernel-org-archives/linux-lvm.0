Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA98HKoK017424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 9 Nov 2015 03:17:20 -0500
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mx1.redhat.com (Postfix) with ESMTPS id 6912C255
	for <linux-lvm@redhat.com>; Mon,  9 Nov 2015 08:17:19 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so92362348wmn.1
	for <linux-lvm@redhat.com>; Mon, 09 Nov 2015 00:17:18 -0800 (PST)
Received: from [10.34.131.78] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	q125sm12925237wmd.5.2015.11.09.00.17.16 for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Nov 2015 00:17:16 -0800 (PST)
References: <563FF33C.3010500@mglug.de>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <5640568C.6090009@gmail.com>
Date: Mon, 9 Nov 2015 09:17:16 +0100
MIME-Version: 1.0
In-Reply-To: <563FF33C.3010500@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Kombination of lvm-tags
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

Dne 9.11.2015 v 02:13 Oliver Rath napsal(a):
> Hi list,
>
> I see that I can use tags to group LVs together like a set union. So, if
> a couple of LVs have tag @a, another the tag @b, I can see all these LVs
> with
>
> lvs @a @b
>
> If now I want to see the LVs having @a *AND* @b, is this possible?
>
>

Please check possibilities of --select  option.

Note: you need to have relatively recent version of lvm2.
For description how select option works - look at  'man lvm'

Regards

Zdenek
