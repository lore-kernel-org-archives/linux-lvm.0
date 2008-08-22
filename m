Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7MF3dDO027666
	for <linux-lvm@redhat.com>; Fri, 22 Aug 2008 11:03:39 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.233])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7MF3C5h018546
	for <linux-lvm@redhat.com>; Fri, 22 Aug 2008 11:03:20 -0400
Received: by rv-out-0506.google.com with SMTP id f6so1168129rvb.51
	for <linux-lvm@redhat.com>; Fri, 22 Aug 2008 08:03:12 -0700 (PDT)
Message-ID: <b072968d0808220803s16906f0ajdd73c406e3e94d9f@mail.gmail.com>
Date: Fri, 22 Aug 2008 16:03:12 +0100
From: "David Robinson" <zxvdr.au@gmail.com>
Subject: Re: [linux-lvm] devices clarification
In-Reply-To: <779919740808191309r63a54bd6q7335aba2e56e3715@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <779919740808191309r63a54bd6q7335aba2e56e3715@mail.gmail.com>
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

> In the following output, are the numbers in the parentheses the starting PE
> of that LV?
>
>   VG        LV        KMin Devices
>   vg00      lvol1     0    /dev/sda2(0)
>   vg00      lvol4     1    /dev/sda2(32)
>   vg00      lvol7     2    /dev/sda2(64)
>   vg00      lvol5     3    /dev/sda2(192)
>   vg00      lvol3     4    /dev/sda2(208)
>   vg00      lvol6     5    /dev/sda2(272)
>   vg00      lvol6     5    /dev/sda2(1136)
>   vg00      lvol2     6    /dev/sda2(304)
>   vg00      lvol8     7    /dev/sda2(496)

You didn't show the command that you used, but yes, it looks like they
are. The devices and seg_pe_ranges parameters for lvs show the details
you're after, eg:

# lvs -o lv_name,vg_name,seg_start,seg_size,devices,seg_pe_ranges
  LV     VG   Start SSize  Devices         PE Ranges
  fedora vg0     0   9.75G /dev/dm-0(0)    /dev/dm-0:0-311
  home   vg0     0  44.44G /dev/dm-0(312)  /dev/dm-0:312-1733
  swap   vg0     0   1.50G /dev/dm-0(1734) /dev/dm-0:1734-1781

--Dave
