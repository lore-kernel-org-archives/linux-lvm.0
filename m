Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s99ELQCj027087
	for <linux-lvm@redhat.com>; Thu, 9 Oct 2014 10:21:26 -0400
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s99ELN4j007064
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 9 Oct 2014 10:21:24 -0400
Received: by mail-qg0-f41.google.com with SMTP id f51so2287216qge.14
	for <linux-lvm@redhat.com>; Thu, 09 Oct 2014 07:21:23 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
In-Reply-To: <5436998F.5090004@redhat.com>
References: <CACaajQu+i6wu1z86wzWa-x=HN_wWy6ByZBnLHzPy7E5Etpj6jw@mail.gmail.com>
	<542ABFC3.4000909@redhat.com>
	<CACaajQut7caHMw6nc-ZUbb=1NuYMZu-untY3y6XdXkk==K7+WA@mail.gmail.com>
	<20140930154918.GB9925@redhat.com>
	<CACaajQuvvGhXsAG9FUjJ3p_EbwZ6XovFuY_9eU-fhHppi_5_YQ@mail.gmail.com>
	<CACaajQuyXg-=LUgwkFKEpH8mVc_CAyCkMUff3JAqxo_-Mg485A@mail.gmail.com>
	<5436998F.5090004@redhat.com>
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Thu, 9 Oct 2014 18:21:08 +0400
Message-ID: <CACaajQs2JQ4Osxefy-C6R7eD3WJv=swwNPu8ok9h1yWDo0CouA@mail.gmail.com>
Subject: Re: [linux-lvm] thin pool and discards
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Mike Snitzer <snitzer@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

2014-10-09 18:19 GMT+04:00 Zdenek Kabelac <zkabelac@redhat.com>:
> Please mention which kernel do you use - there have been patches
> related to discard on thin volumes (pretty resent - kernel 3.14 I think).
>
> If you use old stable 3.10  from vanilla kernel it simply cannot be compared
> with 3.10  RHEL kernel -  they are very different (RHEL has ton of stuff
> backported even from the latest kernels)
>
> So - please try first with upstream to see if you problem is not already
> fixed.


I'm recreate all devices and now all works fine in 3.10.55 and in
rhel. I think my hands bad =(.

-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
jabber: vase@selfip.ru
