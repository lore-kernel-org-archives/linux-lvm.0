Message-ID: <4124D256.7060605@backtobasicsmgmt.com>
Date: Thu, 19 Aug 2004 09:16:22 -0700
From: "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] *** Announcement: dmraid 1.0.0-rc3 ***
References: <20040818190610.GA6267@redhat.com>
In-Reply-To: <20040818190610.GA6267@redhat.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Heinz Mauelshagen wrote:

> The following ATARAID types are supported on Linux 2.6:
> 
> Highpoint HPT37X
> Highpoint HPT45X
> Intel Software RAID
> Promise FastTrack
> Silicon Image Medley

Heinz,

I'd really like to see dmraid be able to support Linux software RAID (md 
driver) as well, at least for RAID-0/1. On my newer systems, using udev, 
mdadm is difficult to use to discover arrays because it requires that 
the /dev/md? devices already exist before they have been activated :-)

I've thought (and talked to Neil B.) about extending the MD driver to 
have ways around this problem, but for my needs (RAID-1), using the DM 
raid 1 target would suffice, and if dmraid could discover and activate 
my arrays I'd be all set.
