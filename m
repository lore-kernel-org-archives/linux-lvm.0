Received: from o.ww.redhat.com (vpn-4-2.stuttgart.redhat.com [10.32.4.2])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	k1GCWMCb024292
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2006 13:32:22 +0100
Date: Thu, 16 Feb 2006 13:32:22 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Recognizing VG in another machine
Message-ID: <20060216123222.GA23655@redhat.com>
References: <1417e79c0602131640l47b21c37o4ababa566bb53bf9@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1417e79c0602131640l47b21c37o4ababa566bb53bf9@mail.gmail.com>
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

On Mon, Feb 13, 2006 at 09:40:54PM -0300, Garcia JR wrote:
> Hi PPL, little question.
> 
> Supposing i have 1 HD with 2 pvs (hda1 and hda3) in VG named VG01 and LV
> named lv01 working successfully in MACHINE1.
> 
> root@solid:/etc/lvmconf# lvscan
> lvscan -- ACTIVE            "/dev/vg01/lv01" [704 MB]
> lvscan -- 1 logical volumes with 704 MB total in 1 volume group
> lvscan -- 1 active logical volumes
> 
> root@solid:/etc/lvmconf# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/hda1" of VG "vg01" [1.41 GB / 1.41 GB free]
> pvscan -- ACTIVE   PV "/dev/hda3" of VG "vg01" [1.41 GB / 736 MB free]
> pvscan -- total: 2 [2.91 GB] / in use: 2 [2.91 GB] / in no VG: 0 [0]
> 
> Supposing again: MACHINE1 is down and I need to put VG above in another
> server, named MACHINE2. I Will remove HD from MACHINE1 and put in MACHINE2.
> 
> What the nexts steps i will have to follow to make VG be recognized by
> MACHINE2 exactly how was in MACHINE1 without lose data?

vgscan ; vgchange -ay

presumably the filter in /etc/lvm/lvm.conf includes /dev/hd* (which it
does by default).

> 
> regards,

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
