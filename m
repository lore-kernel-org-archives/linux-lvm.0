Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5A8siTv013664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2016 04:54:44 -0400
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8CE98E667
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2016 08:54:43 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id k204so92649175wmk.0
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2016 01:54:43 -0700 (PDT)
Received: from [10.34.131.9] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	zc7sm11203210wjb.42.2016.06.10.01.54.41 for <linux-lvm@redhat.com>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Jun 2016 01:54:41 -0700 (PDT)
References: <575A2F24.2020906@gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <8c97b1fd-81d6-87d6-61bb-c8e206b89fb3@gmail.com>
Date: Fri, 10 Jun 2016 10:54:40 +0200
MIME-Version: 1.0
In-Reply-To: <575A2F24.2020906@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Running lvm2 regression tests
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

Dne 10.6.2016 v 05:08 Bruce Dubbs napsal(a):
> I am having a problem with building LVM2.2.02.155 from source.
>
> Actually, the build is OK:
>
> ./configure --prefix=/usr       \
>             --exec-prefix=      \
>             --enable-applib     \
>             --enable-cmdlib     \
>             --enable-pkgconfig  \
>             --enable-udev_sync
>
> make
> sudo make install
>
> My problem comes when I try to run some checks:
>
> sudo make -k check_local
>
> In this case every test times out.  I killed the tests after two hours. The
> journal shows things like:
>
> ndev-vanilla:api/dbustest.sh started
> ndev-vanilla:api/dbustest.sh timeout
>

dbus support is highly experimental and likely full of bugs.
It's not even supported - it's purely  proof-of-concept.

For now  use  'make check_local S=dbustest'  to skip this one...


Regards

Zdenek
