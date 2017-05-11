Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3E31784A7
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 10:10:41 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 51E1B811D8
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 10:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id A4D64413
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 12:10:38 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id TfK6POWm9WBV for <linux-lvm@redhat.com>;
	Thu, 11 May 2017 12:10:38 +0200 (CEST)
Received: from [192.168.178.33] (p4FC4A0ED.dip0.t-ipconnect.de
	[79.196.160.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 62E17412
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 12:10:38 +0200 (CEST)
References: <23c510c6-8a15-7f7c-bcf5-1f72b5dca994@mglug.de>
	<6bf9d190-c009-344f-e4cc-a5a242090274@redhat.com>
	<20170511100337.GA28090@localhost.localdomain>
From: Oliver Rath <rath@mglug.de>
Message-ID: <af9d14ad-3aea-99fa-3965-8c8dfd597d5b@mglug.de>
Date: Thu, 11 May 2017 12:10:37 +0200
MIME-Version: 1.0
In-Reply-To: <20170511100337.GA28090@localhost.localdomain>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] configure fail with option --enable-notivy-dbus
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
To: linux-lvm@redhat.com

Hi Bryn!

On 11.05.2017 12:03, Bryn M. Reeves wrote:
[..]
>> ################################################################################
>> AC_CHECK_LIB(m, log10,
>>         [M_LIBS="-lm"], hard_bailout)
>>
>>
>>
>>
>> This is because of missing log10 function from m library (wherever that
>> comes from) and has nothing to do with dbus. So enabling or disabling it
>> should have absolutely no effect.
> 
> Similarly canonicalize_file_name, dlopen, and getline - the first is a
> GNUism, and we really should have a fallback if it is not found (there
> is a usable gnulib version), but dlopen and getline?
> 
> Those are both standard calls now - dlopen is part of POSIX.1-2001 and
> getline was added in POSIX.1-2008.
> 
> Are you compiling with an old or non-GNU libc?

My used glibc is:

$ LANG=POSIX dpkg-query -l libc6
Desired=Unknown/Install/Remove/Purge/Hold
|
Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                           Version              Architecture
    Description
+++-==============================-====================-====================-==================================================================
ii  libc6:amd64                    2.23-0ubuntu7        amd64
    GNU C Library: Shared libraries
ii  libc6:i386                     2.23-0ubuntu7        i386
    GNU C Library: Shared libraries

and

$ LANG=POSIX dpkg-query -l libc6-dev
Desired=Unknown/Install/Remove/Purge/Hold
|
Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                           Version              Architecture
    Description
+++-==============================-====================-====================-==================================================================
ii  libc6-dev:amd64                2.23-0ubuntu7        amd64
    GNU C Library: Development Libraries and Header Files
ii  libc6-dev:i386                 2.23-0ubuntu7        i386
    GNU C Library: Development Libraries and Header Files
oliver@w541:~/gits/lvm2$

Regards,
Oliver
