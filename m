Received: from o.ww.redhat.com (vpn-4-20.stuttgart.redhat.com [10.32.4.20])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	jAMNJJYx022768
	for <linux-lvm@redhat.com>; Wed, 23 Nov 2005 00:19:19 +0100
Date: Wed, 23 Nov 2005 00:02:28 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] can t resize my lvm
Message-ID: <20051122230228.GF30556@redhat.com>
References: <200511211934.13943.Matthias.Meyer@gmx.li>
	<200511212322.52680.Matthias.Meyer@gmx.li>
	<20051122095820.GE30556@redhat.com>
	<200511222326.13555.Matthias.Meyer@gmx.li>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200511222326.13555.Matthias.Meyer@gmx.li>
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

On Tue, Nov 22, 2005 at 11:26:13PM +0100, Matthias Meyer wrote:
> Am Dienstag 22 November 2005 10:58 schrieb Heinz Mauelshagen:
> > Matthias,
> >
> > you don't need to deactivate your VG in order to grow it.
> >
> > That's the whole point behind LVM: be able to adjust your changing
> > storage requirements online.
> >
> > Do "vgchange -ay", "vgextend LVM2 /dev/hdc1" and you'll have your
> > VG online with extended capacity to grow your LV and FS in another step.
> >
> > Regards,
> > Heinz    -- The LVM Guy --
> >
> Thanks for your hint.
> But:
> vdr:~# vgchange -ay LVM2
> vgchange -- volume group "LVM2" does not exist

Hrm, run vgscan and 'vgchange -ay' afterwards.
You haven't overwritten your PV, have you ?

> 
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
