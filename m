Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAGGP6r28967
	for <linux-lvm@redhat.com>; Tue, 16 Nov 2004 11:25:06 -0500
Received: from www.austinlogistics.com (mail.austinlogistics.com
	[69.150.203.234])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAGGOxFp010727
	for <linux-lvm@redhat.com>; Tue, 16 Nov 2004 11:24:59 -0500
In-Reply-To: <20041116155839.GJ24229@agk.surrey.redhat.com>
Subject: Re: [linux-lvm] Expanding a PV on a hardware RAID
Message-ID: <OF21EA6AE8.44EC5B87-ON86256F4E.0058D71B-86256F4E.005A2AAB@austinlogistics.com>
From: Jetkins@austinlogistics.com
Date: Tue, 16 Nov 2004 10:24:52 -0600
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


linux-lvm-bounces@redhat.com wrote on 11/16/2004 09:58:39 AM:

> On Mon, Nov 15, 2004 at 12:47:28PM -0600, Jetkins@austinlogistics.com
wrote:
> > any way to expand a PV, and therein lies my problem.  It seems that
without
> > a pvexpand or pvresize command, I have no way of utilizing the
additional
> > space.
>
> LVM1 or LVM2?

lvm-1.0.8-5, as supplied with RH ES3/AS

> Using LVM2 tools you can pvexpand (offline) by backing up the metadata,
> editing the PV size in it (pe_count), then restoring it.
>   new pe_count =
>     floor((new_disk_size_in_512_byte_sectors - pe_start) / extent_size)

By inference, there's no way with LVM1?

> > 2)  Would I have been better off creating a partition table and
> > pvcreate'ing on /dev/sdb1instead of pvcreate'ing the entire /dev/sdb
disk
> > initially, given that I could now have created a new partition on the
extra
> > space and pvreate'd a new PV alongside the old?
>
> That's the supported way.

Bummer that the HOWTO at tldp.org makes no mention of the full-volume
method being unsupported, or even of a preference for one method over the
other. :(

Thanks.  I guess I'll start pulling these drives out of the array; my users
are screaming for the extra space.


Jon Etkins
IT Administration & Support
Austin Logistics, Inc
