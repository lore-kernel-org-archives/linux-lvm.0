Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6L8RdON002231
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 04:27:39 -0400
Received: from eastrmmtao101.cox.net (eastrmmtao101.cox.net [68.230.240.7])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6L8RNFn003037
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 04:27:23 -0400
Received: from eastrmimpo03.cox.net ([68.1.16.126]) by eastrmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090721082723.VNRZ22545.eastrmmtao101.cox.net@eastrmimpo03.cox.net>
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 04:27:23 -0400
Message-ID: <4A657BEB.6070200@cox.net>
Date: Tue, 21 Jul 2009 03:27:23 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgs result code error
References: <38bdcd1f0907210016y440121c1x9c92f399e5ea1f9e@mail.gmail.com>
In-Reply-To: <38bdcd1f0907210016y440121c1x9c92f399e5ea1f9e@mail.gmail.com>
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
To: linux-lvm@redhat.com

On 2009-07-21 02:16, Masanari Iida wrote:
> Hello List,
> 
> I have encountered an error with vgs command.
> 
> How to reproduce.
> 
> (1) Initialize the PV.
> # pvcreate /dev/cciss/c0d3p3
> 
> (2) Create VG
> #  vgcreate vg01 /dev/cciss/c0d3p3
> 
> (3)  Use vgs command and see result code.
> 
> # vgs /dev/cciss/c0d3p3
>   Invalid volume group name: cciss/c0d3p3

You specified a PV, not a VG.  Try:
# vgs vg01


Here's what it does on my system:

# vgs
   WARNING: Ignoring duplicate config node: filter (seeking filter)
   VG           #PV #LV #SN Attr   VSize VFree
   main_huge_vg   9   1   0 wz--n- 2.69T    0

# vgs main_huge_vg
   WARNING: Ignoring duplicate config node: filter (seeking filter)
   VG           #PV #LV #SN Attr   VSize VFree
   main_huge_vg   9   1   0 wz--n- 2.69T    0

# pvs
   WARNING: Ignoring duplicate config node: filter (seeking filter)
   PV         VG           Fmt  Attr PSize   PFree
   /dev/sda2  main_huge_vg lvm2 a-   594.25G    0
   /dev/sdb4  main_huge_vg lvm2 a-   529.00G    0
   /dev/sdc1  main_huge_vg lvm2 a-   232.75G    0
   /dev/sdc2  main_huge_vg lvm2 a-   232.75G    0
   /dev/sdc3  main_huge_vg lvm2 a-   232.88G    0
   /dev/sdd1  main_huge_vg lvm2 a-   232.75G    0
   /dev/sdd2  main_huge_vg lvm2 a-   232.75G    0
   /dev/sdd3  main_huge_vg lvm2 a-   232.75G    0
   /dev/sdd4  main_huge_vg lvm2 a-   233.00G    0


> # echo $?
> 0
> 
> The result code should be none zero value.
> One of a script rely on this result code, and it failed to work
> because of this bug.
> 
> I have found this bug on RHEL5 (which uses lvm2.02.40-6) and
> I have checked out WHATS_NEW between 2.02-40 to 49,
> so far no similar symptom.

-- 
Scooty Puff, Sr
The Doom-Bringer
