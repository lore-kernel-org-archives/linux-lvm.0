Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o19BqK8t022541
	for <linux-lvm@redhat.com>; Tue, 9 Feb 2010 06:52:21 -0500
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <BLU110-W183F16A2ADF59D62B10952D4520@phx.gbl>
References: <BLU110-W183F16A2ADF59D62B10952D4520@phx.gbl>
Date: Tue, 09 Feb 2010 11:58:16 +0000
Message-Id: <1265716696.21442.18740.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM troubleshooting
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 2010-02-07 at 11:01 +0500, Muhammad Ammad Shah wrote:
> 
> HI,
> 
> I installed fedora 10 using default layout of partitioning of disk a
> year back, right now when i was trying to install fedora 12 using
> custom layout of partition, i was unable to delete Volume Group. i had
> only option to create new logical volumes. i have two questions in
> this regard.
> 
>      1. how do i delete volume group during installation of
>         RHEL5.x/Fedora.x?

Make sure that nothing in the configured partitioning scheme is using
any LV within the VG and you should be able to delete the LVs & VG from
the installer GUI.

>      1. How to recover if i am installing a new operating system, and
>         has data on VG[1-2]/LV[1-4] in each VG?

It depends whether you want to keep the existing VGs or not. If you do
then you will need to find space in the existing VGs for the new
installation (possibly by installing over the top of an existing
install) or provide new storage on which to place the new install.

If you don't want to keep the existing VGs but you do want to preserve
the data that is contained in the LVs then you will need to backup
before re-installing and then restore that data to the new system
afterwards.

Regards,
Bryn.
