Received: from o.ww.redhat.com (vpn50-1.rdu.redhat.com [172.16.50.1])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i1G9NYi12678
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 04:23:34 -0500
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Problems importing volume group
Message-ID: <20040216092332.GA13581@redhat.com>
References: <2022.63.106.141.106.1076694581.squirrel@www.fusion-hosting.net> <20040214101743.GD22753@redhat.com> <47927.129.33.49.251.1076828208.squirrel@www.fusion-hosting.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47927.129.33.49.251.1076828208.squirrel@www.fusion-hosting.net>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb 16 04:22:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Chris,

have you read the Howto (http://tldp.org/HOWTO/LVM-HOWTO/;
contained in every email from this list) ?

FYI: we've begun reworking the Howto to cover LVM2 as well.

Regards,
Heinz    -- The LVM Guy --


On Sun, Feb 15, 2004 at 01:56:48AM -0500, Chris Wells wrote:
> Heinz,
> 
> Thanks for the advice.. unfortunately I did not have a backup of
> /etc/lvmconf/.. the data was unfortunately lost.  As it stands, I'm still
> quite new to the Linux aspect of LVM.  How do I go about backing up VG
> configuration or /etc/lvmconf.. Also can you recommend any decent online
> guides/How-Tos for Linux LVM?  The documentation I've read thus far (books
> and online) has been limited.
> 
> >
> > Chris,
> >
> > looks like the installation toasted your PVs (writing partition tables
> > to the drives?).
> >
> > Run vgcfgrestore (you've got a backup of /etc/lvmconf/*, right?).
> >
> > Regards,
> > Heinz    -- The LVM Guy --
> >
> >
> > On Fri, Feb 13, 2004 at 12:49:41PM -0500, Chris Wells wrote:
> >> Hello all,
> >>
> >> I'm still a newbie to LVM but I've followed a FAQ in exporting my VG
> >> (I had to replace a failing system drive - not in the VG).  When I
> >> replaced the drive and tried to import the volume group, I get the
> >> following errors:
> >>
> >> vgimport kbvg /dev/hde /dev/hdf
> >> vgimport -- ERROR "pv_check_consistency(): PE size" checking physical
> >> volume consistency of "/dev/hde"
> >> vgimport -- ERROR "pv_check_consistency(): PE size" checking physical
> >> volume consistency of "/dev/hdf"
> >> vgimport -- ERROR: no valid physical volumes found to import volume
> >> group "kbvg"
> >>
> >> When I do a pvscan, I get:
> >>
> >> pvscan
> >> pvscan -- reading all physical volumes (this may take a while...)
> >> pvscan -- inactive PV "/dev/hde"  is in EXPORTED VG "kbvg" [0 / 0
> >> free] pvscan -- inactive PV "/dev/hdf"  is in EXPORTED VG "kbvg" [0 /
> >> 0 free] pvscan -- total: 2 [37.46 MB] / in use: 2 [37.46 MB] / in no
> >> VG: 0 [0]
> >>
> >>
> >> I get these errors even when replacing the old drive and trying to
> >> import back.  Any ideas on what I can do next or what the problem
> >> could be?  Or.. at least, does anyone know of any tools which I can
> >> use to retrieve data from these drives?
> >>
> >> Any help is greatly appreciated!
> >>
> >> --
> >> Thanks,
> >>    Chris Wells
> >>    Fusion Hosting & Design
> >>    Lexington, KY
> >>    chris@fusion-hosting.net
> >>    http://www.fusion-hosting.net
> >>    Phone: (859) 492-6439
> >>
> >>
> >> _______________________________________________
> >> linux-lvm mailing list
> >> linux-lvm@redhat.com
> >> https://www.redhat.com/mailman/listinfo/linux-lvm
> >> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> -- 
> Thanks,
>    Chris Wells
>    Fusion Hosting & Design
>    Lexington, KY
>    chris@fusion-hosting.net
>    http://www.fusion-hosting.net
>    Phone: (859) 492-6439
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat, Inc.
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
