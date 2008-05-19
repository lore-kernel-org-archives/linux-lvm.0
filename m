Received: from file.rdu.redhat.com (file.rdu.redhat.com [10.11.255.147])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4JCeONt010782
	for <linux-lvm@RedHat.com>; Mon, 19 May 2008 08:40:24 -0400
Received: from o.ww.redhat.com (vpn-4-5.str.redhat.com [10.32.4.5])
	by file.rdu.redhat.com (8.13.1/8.13.1) with ESMTP id m4JCeNkI022592
	for <linux-lvm@RedHat.com>; Mon, 19 May 2008 08:40:24 -0400
Received: from o.ww.redhat.com (localhost [127.0.0.1])
	by o.ww.redhat.com (8.14.2/8.14.2) with ESMTP id m4JCeFn3006147
	for <linux-lvm@RedHat.com>; Mon, 19 May 2008 14:40:15 +0200
Received: (from mauelsha@localhost)
	by o.ww.redhat.com (8.14.2/8.14.2/Submit) id m4JCeEeC006146
	for linux-lvm@redhat.com; Mon, 19 May 2008 14:40:14 +0200
Date: Mon, 19 May 2008 14:40:14 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Kernel panic - not syncing: No init found. Try
	passing init= option to,kernel
Message-ID: <20080519124014.GA5134@redhat.com>
References: <483135CF.1080809@gfi-info.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <483135CF.1080809@gfi-info.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, May 19, 2008 at 10:09:51AM +0200, Raquel Real L=EF=BF=BDpez wrote:
>
> Hello!
>
> I have got  a RedHat 3 Update 6 system. The system has a hard disk It's=20
> partitioned like:
> /dev/sda1 /boot Linux
> /dev/sda2 LVM
>    /dev/disk1Vol/rootvol /
>    /dev/disk1Vol/export /export
>    /dev/disk1Vol/softw /softw
>
> The system was booted and it didn't start again.
> The message was:
> vgscan  ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of=20
> volume group "disk1Vol" from physical volume

Any indication that the disk turned bad from before ?

Looks like it either did and your single copy of the LVM1 metadata
went south
-or-
the metadata got corrupted somehow differently.

>
> And then:
>
> Kernel panic - not syncing: No init found. Try passing init=3D option to
> kernel.

Expected kernel behaviour w/o root fs.

>
> If I boot with a rescue disk and I type "lvdisplay", LV UUID is=20
> "000000-00....".

LVM1 didn't have UUIDs on LVs, that's why.
Can you access the VG from the rescue disk and access your data alright ?

>
> How can I recover the system?

If the disk's intact, and you better prove that by running access tests
on /dev/sda from your rescue disk, you have to restore the metadata from
backup using pvcreate+vgcfgrestore. See man vgcfgrestore for details.

>
> Thanks in advance
> I
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=20

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
