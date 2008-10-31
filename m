Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9VCO2vr023316
	for <linux-lvm@redhat.com>; Fri, 31 Oct 2008 08:24:02 -0400
Received: from om.cz.net (om.cz.net [193.85.2.13])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9VCMUJh003521
	for <linux-lvm@redhat.com>; Fri, 31 Oct 2008 08:22:31 -0400
Received: from 192.168.60.224 ([193.179.76.212])
	by om.cz.net (8.13.8/8.13.8/om) with SMTP id m9VCMTa0005140
	for <linux-lvm@redhat.com>; Fri, 31 Oct 2008 13:22:30 +0100 (CET)
Received: from [192.168.58.13] (skadlec.es.gk-software.com [192.168.58.13])
	by hermes.es.gk-software.com (Postfix) with ESMTP id D86908F6C3
	for <linux-lvm@redhat.com>; Fri, 31 Oct 2008 13:22:29 +0100 (CET)
Message-ID: <490AF885.3060504@gk-software.com>
Date: Fri, 31 Oct 2008 13:22:29 +0100
From: Stepan Kadlec <skadlec@gk-software.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clvmd locking disabled
References: <490678BE.1070700@hidden.domain.name>	<08781647-26E4-46F3-B148-A64933B84363@redhat.com>	<4907AF21.4030808@hidden.domain.name>	<49083B9E.4090308@gk-software.com>	<49083EBC.5080301@gk-software.com>
	<490849C2.2040900@redhat.com>
In-Reply-To: <490849C2.2040900@redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Christine Caulfield wrote:
> Stepan Kadlec wrote:
>> one more report:
>>
>> # vgscan
>> File descriptor 3 (/dev/tty) leaked on vgscan invocation. Parent PID
>> 3389: bash
>> File descriptor 5 (/dev/pts/1) leaked on vgscan invocation. Parent PID
>> 3389: bash
>> File descriptor 7 (pipe:[9066]) leaked on vgscan invocation. Parent PID
>> 3389: bash
>>   Unknown locking type requested.
>>   Locking type 3 initialisation failed.
>>
>> steve
>>
>> Stepan Kadlec wrote:
>>>     hello,
>>>     I can't make the clustered LVM running. it can't start the
>>> built-in clustered locking mechanism (using cman).
>>>
>>>     lvm is compiled with following options:
>>>
>>> ./configure --with-clvmd=cman  --with-cluster=shared
>>> --libdir=/usr/lib64/ --enable-dmeventd --enable-cmdlib
> 
> 
> If you've built using with-cluster=shared then the locking type in
> lvm.conf should be 2 and not 3, provided you have remembered to install
> the shared library that gets built.
> 
> I recommend you don't build it shared (the default), and use locking type 3
> 

ok, I have recompiled it with --with-cluster=internal, but still seeing:

WARNING: Locking disabled. Be careful! This could corrupt your metadata.

in lvm.conf I have locking_type = 3, complete configure line was:

./configure --with-clvmd=cman  --with-cluster=internal 
--libdir=/usr/lib64/ --enable-dmeventd --enable-cmdlib

cluster was compiled with following options:

./configure --disable_kernel_check --enable_xen --libdir=/usr/lib64/ 
--without_gnbd --without_kernel_modules --without_gfs --without_gfs2

running on kernel 2.6.25

any suggestion?

thanks steve

> Chrissie
> 
>>>     does anyone have some experiences that could help me make it working?
>>>     thanks, steve
>>>
>>>     when the clvmd starts it reports this:
>>>
>>> CLVMD[1772a6d0]: Oct 29 13:16:57 CLVMD started
>>> CLVMD[1772a6d0]: Oct 29 13:16:57 Connected to CMAN
>>> CLVMD[1772a6d0]: Oct 29 13:16:57 CMAN initialisation complete
>>> CLVMD[1772a6d0]: Oct 29 13:16:57 DLM initialisation complete
>>> CLVMD[1772a6d0]: Oct 29 13:16:57 Cluster ready, doing some more
>>> initialisation
>>> CLVMD[1772a6d0]: Oct 29 13:16:57 starting LVM thread
>>> CLVMD[41d0c940]: Oct 29 13:16:57 LVM thread function started
>>> CLVMD[1772a6d0]: Oct 29 13:16:57 clvmd ready for work
>>> CLVMD[1772a6d0]: Oct 29 13:16:57 Using timeout of 60 seconds
>>> File descriptor 3 (/dev/tty) leaked on lvm invocation. Parent PID
>>> 13867: clvmd
>>> File descriptor 5 (/dev/pts/3) leaked on lvm invocation. Parent PID
>>> 13867: clvmd
>>> File descriptor 7 (pipe:[12892]) leaked on lvm invocation. Parent PID
>>> 13867: clvmd
>>> File descriptor 8 (/dev/zero) leaked on lvm invocation. Parent PID
>>> 13867: clvmd
>>>   WARNING: Locking disabled. Be careful! This could corrupt your
>>> metadata.
>>> CLVMD[41d0c940]: Oct 29 13:16:57 LVM thread waiting for work
>>>
>>>
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

-- 
Eurosoftware s.r.o.
skadlec@gk-software.com
+420 379 307 379
+420 724 554 104
