Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4A4vYJE030909
	for <linux-lvm@redhat.com>; Wed, 10 May 2006 00:57:34 -0400
Received: from russell.fmi.uni-sofia.bg (russell.fmi.uni-sofia.bg
	[62.44.101.23])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4A4vPCL007849
	for <linux-lvm@redhat.com>; Wed, 10 May 2006 00:57:25 -0400
Received: from [192.168.1.2] (unknown [84.22.12.152])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by russell.fmi.uni-sofia.bg (Postfix) with ESMTP id 484601B8BF
	for <linux-lvm@redhat.com>; Wed, 10 May 2006 08:10:00 +0300 (EEST)
Message-ID: <446172AD.1080401@fmi.uni-sofia.bg>
Date: Wed, 10 May 2006 07:57:17 +0300
From: Ognyan Kulev <ogi@fmi.uni-sofia.bg>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lseek errors after pvcreate on RAID5
References: <445E0440.70007@fmi.uni-sofia.bg>
In-Reply-To: <445E0440.70007@fmi.uni-sofia.bg>
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

Ognyan Kulev wrote:
>   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
>   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
>   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
>   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
>   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
>   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
>   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
>   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
>   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
>   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
>   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
>   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
>   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
>   PV         VG   Fmt  Attr PSize      PFree     
>   /dev/hdd2       lvm2 --   248064.43T 248064.43T
>   /dev/md1        lvm2 --      445.74G    445.74G

It's fixed now.  It looks like I have used/initialized hdd2 before RAID5
is completely built and there was some metadata garbage left in hdd2
made after starting RAID5 sync but before finishing.

Regards,
ogi
