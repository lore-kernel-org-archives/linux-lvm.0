Received: from [10.36.4.157] (vpn1-4-157.ams2.redhat.com [10.36.4.157])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6V9PmYS006110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 05:25:49 -0400
Message-ID: <1343726748.1876.2.camel@hex.usersys.redhat.com>
From: "Bryn M. Reeves" <bmr@redhat.com>
Date: Tue, 31 Jul 2012 10:25:48 +0100
In-Reply-To: <50177A93.1050208@profihost.ag>
References: <5016DD33.3050000@profihost.ag>
	<alpine.LRH.2.02.1207301618430.23442@bmsred.bmsi.com>
	<5016F258.9060206@profihost.ag>
	<CALVifsbTjYzyAs1x10Y-cFq4qqssVwqXZV_dYUfvmeb1uE5kxQ@mail.gmail.com>
	<50177A93.1050208@profihost.ag>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] how to online resize pv?
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

On Tue, 2012-07-31 at 08:26 +0200, Stefan Priebe wrote:
> Am 31.07.2012 07:10, schrieb Fred van Zwieten:
> > Try this
> > <http://epsilon.eridani.nl/2012/06/11/hot-resize-lvm2-lv-in-vmware-linux-gues/>
> 
> this just guarantees / updates the disk size. THis is not my problem the 
> disk size is correct. I just can't change the partition table.

Reading between the lines in that post the user added a new partition on
the newly-allocated region of disk (this is fine - it's only in-use
partitions that are a problem) and then extended the VG onto the new
partition.

It's an OK workaround if you have no option but I normally prefer to
arrange some downtime and enlarge the existing partition rather than end
up with multiple PVs on the same disk (the tools work fine I just feel
it looks messy).

Bryn. 
