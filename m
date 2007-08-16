Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7GCH4gj007085
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 08:17:04 -0400
Received: from rv-out-0910.google.com (rv-out-0910.google.com [209.85.198.186])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7GCH1k8023396
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 08:17:01 -0400
Received: by rv-out-0910.google.com with SMTP id k15so197853rvb
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 05:17:00 -0700 (PDT)
Message-ID: <b30466f90708160517s3bc1e4d4q9da7a6d0889b0b90@mail.gmail.com>
Date: Thu, 16 Aug 2007 17:47:00 +0530
From: "prasad k" <openkerala@gmail.com>
Subject: Re: [linux-lvm] Redirecting LVM command output on RHEL5?
In-Reply-To: <55D16D5A051757489679376DECFE315E0157E47F@G3W0639.americas.hpqcorp.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <55D16D5A051757489679376DECFE315E0157E47F@G3W0639.americas.hpqcorp.net>
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

Hi,

The below command should work fine with RHEL5,

lvs | tee kevin.txt

check,

less kevin.txt

Thanks,


On 8/2/07, Joubert, Kevin <kevin.joubert@hp.com> wrote:
>
> Hello,
>
> Okay.. I am probably missing something simple here but...
>
> I just added a RHEL5 system to my lab and I am testing a script that
> captures LVM structure.
> This script works on other versions of RHEL and SLES, but on RHEL5,
> whenever I try to redirect LVM command output, I get a blank.
>
> For instance...
>
> [root@linux-dl585 ~]# pvs
>   PV         VG   Fmt  Attr PSize  PFree
>   /dev/sda   vg01 lvm2 a-   10.00G    0
>   /dev/sdd   vg02 lvm2 ax    1.95G 1.08G
>   /dev/sde   vg02 lvm2 ax    1.95G 1.46G
>
> [root@linux-dl585 ~]# pvs > kevin.txt
>
> [root@linux-dl585 ~]# cat kevin.txt
>
>
> No matter what LVM command I run (i.e. vgdisplay, lvs, etc. etc.), it
> will not redirect output to my text file. Screen output is always
> successful, and every other system command I have tried (i.e. fdisk,
> etc.) will redirect output successfully.
>
>
> Any ideas?
>
>
> Kevin
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
