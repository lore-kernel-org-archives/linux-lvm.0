Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5AIFF19010594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2016 14:15:15 -0400
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43F85C04D296
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2016 18:15:13 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id v199so2774121wmv.0
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2016 11:15:13 -0700 (PDT)
Received: from [192.168.0.76] (cpe-70-123-244-133.satx.res.rr.com.
	[70.123.244.133])
	by smtp.gmail.com with ESMTPSA id k62sm320426wmb.7.2016.06.10.11.15.10
	for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jun 2016 11:15:10 -0700 (PDT)
From: Bruce Dubbs <bruce.dubbs@gmail.com>
References: <575A2F24.2020906@gmail.com>
Message-ID: <575B03AC.7070103@gmail.com>
Date: Fri, 10 Jun 2016 13:15:08 -0500
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
To: linux-lvm@redhat.com

Zdenek Kabelac wrote:
> Bruce Dubbs wrote:
>>
>> I am having a problem with building LVM2.2.02.155 from source.
>>
>> Actually, the build is OK:
>>
>> ./configure --prefix=/usr       \
>>              --exec-prefix=      \
>>              --enable-applib     \
>>              --enable-cmdlib     \
>>              --enable-pkgconfig  \
>>              --enable-udev_sync
>>
>> make
>> sudo make install
>>
>> My problem comes when I try to run some checks:
>>
>> sudo make -k check_local
>>
>> In this case every test times out.  I killed the tests after two hours.
>> The journal shows things like:
>>
>> ndev-vanilla:api/dbustest.sh started
>> ndev-vanilla:api/dbustest.sh timeout

> dbus support is highly experimental and likely full of bugs.
> It's not even supported - it's purely  proof-of-concept.

> For now  use  'make check_local S=dbustest'  to skip this one...

I wasn't clear enough.  *ALL* the tests time out for me.

As a test, I rebuilt the kernel enabling CONFIG_MAGIC_SYSRQ=y and the 
tests now work.  Too bad that this is not documented.  Perhaps a mention 
of the kernel requirements for the regression tests in the README or 
INSTALL files would be appropriate.

   -- Bruce
