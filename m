Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m38Ahirh019545
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 06:43:44 -0400
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.169])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m38AhN0A013997
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 06:43:23 -0400
Received: by wf-out-1314.google.com with SMTP id 28so1934388wfc.6
	for <linux-lvm@redhat.com>; Tue, 08 Apr 2008 03:43:22 -0700 (PDT)
Date: Tue, 8 Apr 2008 20:43:04 +1000
From: David Robinson <zxvdr.au@gmail.com>
Subject: Re: [linux-lvm] Problem in mounting LVM1 filesystem on RHEL AS 4.4
Message-ID: <20080408104259.GA2898@laptop.home>
References: <20080408045221.6115.qmail@f4mail-235-129.rediffmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20080408045221.6115.qmail@f4mail-235-129.rediffmail.com>
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
Content-Transfer-Encoding: 7bit
To: umesh susvirkar <susvirkar_3616@rediffmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Apr 08, 2008 at 04:52:21AM -0000, umesh susvirkar wrote:
>   
> we have two server connected to same storage.
> 
> server app1 version RHEL AS 3.4
> server app2 version RHEL AS 4.4
> 
> I have created a filesystem on  app1 and same filesystem i am mounting on app2,but its giving me following error.
> 
>   LV lvol1: inconsistent LE count 96 != 192
>   Internal error: LV segments corrupted in lvol1.
>   PV /dev/sdi   VG app_vg02   lvm1 [15.66 GB / 0    free]
>   PV /dev/sdj   VG app_vg02   lvm1 [15.66 GB / 0    free]
>   Total: 2 [31.31 GB] / in use: 2 [31.31 GB] / in no VG: 0 [0   ]

Are the logical volumes stripped? I'd say you're encountering bug 232397. The
problem is fixed in 4.5.

https://bugzilla.redhat.com/show_bug.cgi?id=232397
http://rhn.redhat.com/errata/RHBA-2007-0287.html

--Dave
