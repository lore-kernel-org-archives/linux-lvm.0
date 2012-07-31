Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6V9oUbs007867
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 05:50:30 -0400
Received: from mail.profihost.ag (mail.profihost.ag [85.158.179.208])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6V9oRlT013450
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 05:50:28 -0400
Message-ID: <5017AA60.1010306@profihost.ag>
Date: Tue, 31 Jul 2012 11:50:24 +0200
From: Stefan Priebe - Profihost AG <s.priebe@profihost.ag>
MIME-Version: 1.0
References: <5016DD33.3050000@profihost.ag>
	<alpine.LRH.2.02.1207301618430.23442@bmsred.bmsi.com>
	<5016F258.9060206@profihost.ag>
	<CALVifsbTjYzyAs1x10Y-cFq4qqssVwqXZV_dYUfvmeb1uE5kxQ@mail.gmail.com>
	<50177A93.1050208@profihost.ag>
	<1343726748.1876.2.camel@hex.usersys.redhat.com>
In-Reply-To: <1343726748.1876.2.camel@hex.usersys.redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Am 31.07.2012 11:25, schrieb Bryn M. Reeves:
> On Tue, 2012-07-31 at 08:26 +0200, Stefan Priebe wrote:
>> Am 31.07.2012 07:10, schrieb Fred van Zwieten:
>>> Try this
>>> <http://epsilon.eridani.nl/2012/06/11/hot-resize-lvm2-lv-in-vmware-linux-gues/>
>>
>> this just guarantees / updates the disk size. THis is not my problem the
>> disk size is correct. I just can't change the partition table.
>
> Reading between the lines in that post the user added a new partition on
> the newly-allocated region of disk (this is fine - it's only in-use
> partitions that are a problem) and then extended the VG onto the new
> partition.
>
> It's an OK workaround if you have no option but I normally prefer to
> arrange some downtime and enlarge the existing partition rather than end
> up with multiple PVs on the same disk (the tools work fine I just feel
> it looks messy).

OK that's right that's why i had the other idea to use the whole disk 
for LVM but then grub doesn't want to install ;-(

Stefan
