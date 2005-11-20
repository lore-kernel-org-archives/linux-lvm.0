Received: from o.ww.redhat.com (vpn50-2.rdu.redhat.com [172.16.50.2])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	jAKCohYx028384
	for <linux-lvm@redhat.com>; Sun, 20 Nov 2005 13:50:44 +0100
Date: Sun, 20 Nov 2005 13:50:39 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] can't remove volume group
Message-ID: <20051120125039.GD30556@redhat.com>
References: <200511192312.49547.Matthias.Meyer@gmx.li>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200511192312.49547.Matthias.Meyer@gmx.li>
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


It says you can't remove an active VG ->

vgchange -an LVM2 ; vgremove LVM2

On Sat, Nov 19, 2005 at 11:12:49PM +0100, Matthias Meyer wrote:
> Hello,
> 
> I have a volume group with one physical volume and I can't remove this 
> volume group :-(
> 
> vdr:~# vgdisplay LVM2
> --- Volume group ---
> VG Name               LVM2
> VG Access             read/write
> VG Status             available/resizable
> VG #                  1
> MAX LV                256
> Cur LV                0
> Open LV               0
> MAX LV Size           2 TB
> Max PV                256
> Cur PV                1
> Act PV                1
> VG Size               92.75 GB
> PE Size               256 MB
> Total PE              371
> Alloc PE / Size       0 / 0
> Free  PE / Size       371 / 92.75 GB
> VG UUID               2Oojws-3owd-iK1X-wbpy-Mx9X-CieY-7JN0b0
> 
> vdr:~# vgreduce LVM2 /dev/hdd1
> vgreduce -- can't reduce volume group "LVM2" to zero physical volumes
> 
> vdr:~# vgremove LVM2
> vgremove -- ERROR: can't remove active volume group "LVM2"
> 
> What I have to do?
> 
> Thanks in advance
> Matthias
> -- 
> Don't Panic
> 
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
