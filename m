Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oBHJcPvJ008721
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2010 14:38:25 -0500
Received: from mail-qw0-f46.google.com (mail-qw0-f46.google.com
	[209.85.216.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBHJcFcK007150
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2010 14:38:15 -0500
Received: by qwa26 with SMTP id 26so1069997qwa.33
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2010 11:38:15 -0800 (PST)
Message-ID: <4D0BBC21.2030103@gmail.com>
Date: Fri, 17 Dec 2010 14:38:09 -0500
From: Mauricio Tavares <raubvogel@gmail.com>
MIME-Version: 1.0
References: <4D0B9D71.3080602@gmail.com>
	<20101217184616.GA19317@agk-dp.fab.redhat.com>
In-Reply-To: <20101217184616.GA19317@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Conflicting vg names but can't rename one
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

On 12/17/2010 01:46 PM, Alasdair G Kergon wrote:
> What version of lvm2?
>
> Try a newer one in case it's something we already fixed.
> (An entry in 2.02.63 changelog might be relevant.)
>
> If it still fails on the latest upstream, obtain output with
> the -vvvv flags and post a link to it.
>
> Alasdair
>
lvm version
   WARNING: Running as a non-root user. Functionality may be unavailable.
   LVM version:     2.02.54(1) (2009-10-26)
   Library version: 1.02.39 (2009-10-26)
   /dev/mapper/control: open failed: Permission denied
   Failure to communicate with kernel device-mapper driver.

I do not know how ancient it is, but it seems that is the one that is 
currently available as a package for ubuntu 10.10 
(http://packages.ubuntu.com/maverick/lvm2-udeb). Am I missing anything? 
The HD in question has a VG that is a few years old (and done in centos 
4.7).
