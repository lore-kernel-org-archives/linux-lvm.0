Received: from jeltz.chrissie.net (vpn-4-125.str.redhat.com [10.32.4.125])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m9VDRfAQ030212
	for <linux-lvm@redhat.com>; Fri, 31 Oct 2008 09:27:42 -0400
Message-ID: <490B07CD.5040404@redhat.com>
Date: Fri, 31 Oct 2008 13:27:41 +0000
From: Christine Caulfield <ccaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clvmd locking disabled
References: <490678BE.1070700@hidden.domain.name>	<08781647-26E4-46F3-B148-A64933B84363@redhat.com>	<4907AF21.4030808@hidden.domain.name>	<49083B9E.4090308@gk-software.com>	<49083EBC.5080301@gk-software.com>	<490849C2.2040900@redhat.com>
	<490AF885.3060504@gk-software.com>
In-Reply-To: <490AF885.3060504@gk-software.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Stepan Kadlec wrote:
> Christine Caulfield wrote:
>> Stepan Kadlec wrote:
>>> one more report:
>>>
>>> # vgscan
>>> File descriptor 3 (/dev/tty) leaked on vgscan invocation. Parent PID
>>> 3389: bash
>>> File descriptor 5 (/dev/pts/1) leaked on vgscan invocation. Parent PID
>>> 3389: bash
>>> File descriptor 7 (pipe:[9066]) leaked on vgscan invocation. Parent PID
>>> 3389: bash
>>>   Unknown locking type requested.
>>>   Locking type 3 initialisation failed.
>>>
>>> steve
>>>
>>> Stepan Kadlec wrote:
>>>>     hello,
>>>>     I can't make the clustered LVM running. it can't start the
>>>> built-in clustered locking mechanism (using cman).
>>>>
>>>>     lvm is compiled with following options:
>>>>
>>>> ./configure --with-clvmd=cman  --with-cluster=shared
>>>> --libdir=/usr/lib64/ --enable-dmeventd --enable-cmdlib
>>
>>
>> If you've built using with-cluster=shared then the locking type in
>> lvm.conf should be 2 and not 3, provided you have remembered to install
>> the shared library that gets built.
>>
>> I recommend you don't build it shared (the default), and use locking
>> type 3
>>
> 
> ok, I have recompiled it with --with-cluster=internal, but still seeing:
> 
> WARNING: Locking disabled. Be careful! This could corrupt your metadata.
> 
> in lvm.conf I have locking_type = 3, complete configure line was:


Check there isn't another line in lvm.conf that puts the locking_type
back to 1. clvmd prints that line out at startup if it detects that
locking_type is not set to 3, or it is set to 2 and the library name is
wrong, or locking_type is other than 2 or 3.


> ./configure --with-clvmd=cman  --with-cluster=internal
> --libdir=/usr/lib64/ --enable-dmeventd --enable-cmdlib
> 
> cluster was compiled with following options:
> 
> ./configure --disable_kernel_check --enable_xen --libdir=/usr/lib64/
> --without_gnbd --without_kernel_modules --without_gfs --without_gfs2
> 
> running on kernel 2.6.25
> 
> any suggestion?
> 
> thanks steve
> 

Chrissie
