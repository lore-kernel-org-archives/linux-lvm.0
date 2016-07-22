Received: from [10.10.54.179] (vpn-54-179.rdu2.redhat.com [10.10.54.179])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6MDCgH0014527
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2016 09:12:43 -0400
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <1293a47ac069aa8851c5e8d2c67fad81@dds.nl>
Date: Fri, 22 Jul 2016 08:12:42 -0500
Message-Id: <5C234A9A-A73D-4E4E-ABD9-1ADCEF255333@redhat.com>
References: <96ed1c73-85ca-f20d-f249-cf1d775c0a92@yahoo.co.uk>
	<E1976556-4D69-443C-ACB2-23A186D9A624@redhat.com>
	<1293a47ac069aa8851c5e8d2c67fad81@dds.nl>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] export/migrate - but only a LV - how?
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>


> On Jul 18, 2016, at 3:28 PM, Xen <list@xenhideout.nl> wrote:
> 
> Brassow Jonathan schreef op 18-07-2016 17:50:
>> maybe pvmove the LV to a unique device and then vgsplit?
>> brassow
>>> On Jul 12, 2016, at 10:23 AM, lejeczek <peljasz@yahoo.co.uk> wrote:
>>> .. if possible?
> 
> 
> Shouldn't you in general just recreate the LV with the same amount of extents and then perform a DD?
> 
> I realize an atomic move operation for an LV could conceptually be nice but apart from the mental effort required to do this recreation manually, there is not much practically in the way of doing it yourself.
> 
> In the end, it would be nothing more than a shell script doing an LVCREATE, DD, and LVREMOVE?

One advantage is that pvmove allows you to keep the device online...  We are also working on a feature ATM called “duplicate”.  It allows you to create a duplicate of any LV stack, create the duplicate where you want, and even change the segment type in the process.  For example, you could move a whole RAID5 LV, or thin-p, in one go.

 brassow
