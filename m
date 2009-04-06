Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n36CPqKD007743
	for <linux-lvm@redhat.com>; Mon, 6 Apr 2009 08:25:53 -0400
Subject: Re: [linux-lvm] rebuilding raided root volume
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <49D8B7F2.2030706@traversetechnologies.com>
References: <49D8B7F2.2030706@traversetechnologies.com>
Date: Mon, 06 Apr 2009 13:27:46 +0100
Message-Id: <1239020866.4484.14.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 2009-04-05 at 09:53 -0400, Miles Fidelman wrote:
> after crash and partial recovery:
> /
> Logical Volume
> Physical Volume
> RAID1 array - showing inactive, running on spare drive alone

Is the root volume group now active and using one member of the array as
a PV, or is it still using the MD device? If LVM has grabbed one of the
members and is using that as its PV this may prevent the rebuild from
taking place.

Regards,
Bryn.
