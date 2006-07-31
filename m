Received: from o.ww.redhat.com (vpn-4-43.stuttgart.redhat.com [10.32.4.43])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6VED0XA025820
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 10:13:01 -0400
Received: from o.ww.redhat.com (localhost.localdomain [127.0.0.1])
	by o.ww.redhat.com (8.13.7/8.13.7) with ESMTP id k6VECxcm003886
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 16:12:59 +0200
Received: (from mauelsha@localhost)
	by o.ww.redhat.com (8.13.7/8.13.7/Submit) id k6VECw6b003885
	for linux-lvm@redhat.com; Mon, 31 Jul 2006 16:12:58 +0200
Date: Mon, 31 Jul 2006 16:12:58 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Activate Volume Group
Message-ID: <20060731141258.GB2967@redhat.com>
References: <1cbd6f830607290741t75384c30v273db8f67972a7fe@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cbd6f830607290741t75384c30v273db8f67972a7fe@mail.gmail.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


Make the 2 PVs reappear (did you remove them from the system or did
you write over by accident ?).

Then 'vgchange -ay'.

Heinz

On Sat, Jul 29, 2006 at 10:41:08AM -0400, Mag Gam wrote:
> Running Debian Etch.
> 
> debian:/# pvdisplay
>  --- Physical volume ---
>  PV Name               unknown device
>  VG Name               testvg
>  PV Size               9.31 GB / not usable 0
>  Allocatable           yes (but full)
>  PE Size (KByte)       4096
>  Total PE              2384
>  Free PE               0
>  Allocated PE          2384
>  PV UUID               Pvmwcl-Z9Zg-rVJv-Q5Si-pP0g-2s7u-hveDWS
> 
>  --- Physical volume ---
>  PV Name               unknown device
>  VG Name               testvg
>  PV Size               9.31 GB / not usable 0
>  Allocatable           yes (but full)
>  PE Size (KByte)       4096
>  Total PE              2384
>  Free PE               0
>  Allocated PE          2384
>  PV UUID               vmmYU5-2KEi-jjTn-baQl-Ckj2-wqmK-7TGn4P
> 
>  --- Physical volume ---
>  PV Name               /dev/hde3
>  VG Name               testvg
>  PV Size               9.31 GB / not usable 0
>  Allocatable           yes
>  PE Size (KByte)       4096
>  Total PE              2384
>  Free PE               902
>  Allocated PE          1482
>  PV UUID               w3tmk3-Zkbj-MRkJ-OrIQ-ku3b-Hw1i-FRlwcg
> 
>  --- Physical volume ---
>  PV Name               /dev/hde4
>  VG Name               testvg
>  PV Size               9.32 GB / not usable 0
>  Allocatable           yes
>  PE Size (KByte)       4096
>  Total PE              2386
>  Free PE               2386
>  Allocated PE          0
>  PV UUID               f5fdpL-quXK-m6Bf-1s7w-LHk5-Y3fK-1kcUSy
> 
> 
> I would like to activate the 'testvg', how would I do that?
> 
> tia

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
