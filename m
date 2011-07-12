Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6CAx0NA024455
	for <linux-lvm@redhat.com>; Tue, 12 Jul 2011 06:59:00 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6CAx078012138
	for <linux-lvm@redhat.com>; Tue, 12 Jul 2011 06:59:00 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p6CAwnId005881
	for <linux-lvm@redhat.com>; Tue, 12 Jul 2011 03:58:51 -0700
Message-ID: <4E1C28E9.2020701@tlinx.org>
Date: Tue, 12 Jul 2011 03:58:49 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4E19E3FD.9000805@tlinx.org>
	<20110710220815.GB7857@agk-dp.fab.redhat.com>
In-Reply-To: <20110710220815.GB7857@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Bug!  lvs shouldn't need 'root' access
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



Alasdair G Kergon wrote:
> On Sun, Jul 10, 2011 at 10:40:13AM -0700, Linda A. Walsh wrote:
>   
>> I could write to the darn things!, but all I NEED is read (hmmm
>>     
>
> I thought so too when we first began work on LVM, but - surprising 
> to me - there's been hardly any demand expressed for this feature.
>
> The proposed method of handling this was to accept dm ioctls on
> the actual devices themselves controlled by normal ioctl permissions.
>
> Currently, you need CAP_SYS_ADMIN (and access to /dev/mapper/control).
>   
Ishtar:/suse/x86_64> filecap /sbin/lvm
file                 capabilities
/sbin/lvm     sys_admin
Ishtar:/suse/x86_64> llg /dev/mapper/control
crw-rw---- 1 root disk 10, 236 Jul  8 16:52 /dev/mapper/control
(am in group disk).

---
    Doesn't work.   Still get access failures.
(open not permitted)
I got slightly further with cap_rawio, (gave more error messages).

I'm sure with enough experimenting, I could eventually find the
required set, but it seems to be a bit more than 1 cap.

Oh well, not that important...just found the caplibs on my system
and decided to give them a try...(didn't know the bins were
in yet!....only remember discussing their implementation about
11 years back.  At least ACL's were faster...


(I made the exec +eip on the binary for sys_admin and rawio, and
that wasn't sufficient).
