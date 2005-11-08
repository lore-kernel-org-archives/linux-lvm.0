Received: from o.ww.redhat.com (vpn50-53.rdu.redhat.com [172.16.50.53])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	jA8A0OJp023146
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2005 11:00:25 +0100
Date: Tue, 8 Nov 2005 11:00:23 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] vgchange partial mount fails
Message-ID: <20051108100023.GA30556@redhat.com>
References: <436FD150.9080800@oxtel.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <436FD150.9080800@oxtel.com>
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

On Mon, Nov 07, 2005 at 10:12:32PM +0000, Tom Robinson wrote:
> 
> Hi,
> 
> I'm trying to do a partial mount of a VG in order to rescue data from it
> (the last of the 8 PVs has died)
> 
> If I do vgchange -P -a y vg1
> It says:
> 
>  Partial mode. Incomplete volume groups will be activated read-only.
>  7 PV(s) found for VG vg1: expected 8
>  Logical volume (lv1) contains an incomplete mapping table.
>  7 PV(s) found for VG vg1: expected 8
>  Logical volume (lv1) contains an incomplete mapping table.
>  1 logical volume(s) in volume group "vg1" now active
> 
> Which looks like it might have worked, but in /dev/mapper I have:
> 
> crw-rw----  1 root root  10, 63 May 30 02:48 control
> brw-------  1 root root 254,  0 Oct 25 13:20 vg1-lv1
> 
> But I can't mount vg1-lv1 (its ext2 - but it says "must specify fs type).

Looks like expected behaviour.

You're likely missing the beginning of your filesystem which was mapped
to the dead PV and the fs code fails to find its metadata
(ie. superblock).

Check with "lvdisplay -m /dev/vg1/lv1"

Regards,
Heinz    -- The LVM Guy --

> 
> What is wrong? Have I misconfigured lvm / dm?
> are there any lines I need in my config file?
> Are there any tools I can run to get more info?
> 
> The array was built with LVM1 & 2.4.18,
> I'm now using LVM2/DM under 2.6.11.10
> 
> Also, It looks like it has done something, because if I try
> to deactivate it with "vgchange -P -a n vg1" I get:
> 
>  Partial mode. Incomplete volume groups will be activated read-only.
>  7 PV(s) found for VG vg1: expected 8
>  Logical volume (lv1) contains an incomplete mapping table.
>  Can't deactivate volume group "vg1" with 1 open logical volume(s)
> 
> Any help greatly appreciated.
> Kind regards,
> Tom
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
