Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pB33mk4T020463
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 22:48:46 -0500
Received: from mx.binnacle.cx (mx.binnacle.cx [74.95.187.105])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pB33mjqc022072
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 22:48:45 -0500
Received: from CIANNAIT.binnacle.cx (ciannait [172.29.87.10])
	by mx.binnacle.cx (envelope-from <starlight@binnacle.cx>)
	(8.14.4/8.14.4) with ESMTP id pB33mhLS004284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 22:48:44 -0500
Message-Id: <6.2.5.6.2.20111202223618.0399e7a0@binnacle.cx>
Date: Fri, 02 Dec 2011 22:44:28 -0500
From: starlight@binnacle.cx
In-Reply-To: <6.2.5.6.2.20111202164221.063eb6d0@binnacle.cx>
References: <6.2.5.6.2.20111202121427.03b28738@flumedata.com>
	<6.2.5.6.2.20111202132949.03b2cc68@binnacle.cx>
	<alpine.LRH.2.00.1112021553440.5337@bmsred.bmsi.com>
	<6.2.5.6.2.20111202164221.063eb6d0@binnacle.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [linux-lvm] cmp of inactive mirrored LV fails
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On 12/02/2011 17:47 PM, Ron Johnson wrote:
>On 12/02/2011 03:47 PM, starlight binnacle cx wrote:
>
>It just occurred to me that the system
>in question is a development box that
>is abused in stress testing and other
>scenarios.  It crashes in horrible ways
>fairly often.
>
>Unless you're testing the kernel or libc, crashes aren't really 
>supposed to happen, even when putting the system under heavy 
>load. 
>

:-D  !!!!!!    Your joking right?

I know at least half a dozen ways to crash
or deadlock linux.  Perhaps some of the
bugs have been fixed in newer kernels
(I generally report them), but like any
OS out there Linux has it holes.  The
LVM bug where a system can be hung with
a mirrored swap LV is just one.  Reported
it for RHEL 4 but I'll bet it's still
in there (it was obvious that RH had no
intention of fixing it).

https://bugzilla.redhat.com/show_bug.cgi?id=559959
