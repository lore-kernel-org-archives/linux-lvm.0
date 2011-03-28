Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2SHsqpL018132
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 13:54:52 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2SHsm0X028235
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 13:54:48 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p2SHskud029106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 13:54:46 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p2SHskHf014215
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 13:54:46 -0400
Date: Mon, 28 Mar 2011 13:54:46 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D90C4B2.6020902@gmail.com>
Message-ID: <alpine.LRH.2.00.1103281346250.14152@bmsred.bmsi.com>
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
	<4D8D6EAF.8050403@cox.net>
	<alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>
	<4D8D78D5.7050701@cox.net>
	<alpine.LRH.2.00.1103261143510.28300@bmsred.bmsi.com>
	<4D90C4B2.6020902@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Powerfailure and snapshot consistency
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 28 Mar 2011, Les Mikesell wrote:

> On 3/26/2011 11:07 AM, Stuart D. Gathman wrote:
>> 
> Is there some non-destructive diagnostic that can tell you if a running 
> machine can or can't manage write ordering correctly through all of its 
> software and hardware layers?

http://blog.nirkabel.org/2008/12/07/ext3-write-barriers-and-write-caching/

The above mentions a test program that demonstrates the ext3 weakness.
You should be able to run it in a test VM, and destroy (virtual power off)
the VM.  When the barrier=1 mount option is turned on, the mapper is supposed
to log a warning if this is not supported at some level.  There appear to
be disks, however, with hardware write caching that do not correct support
barriers.  You must turn off hardware write caching on these models.

You can probably test the software stack by running md + lvm in a VM and 
destroying the VM.  To test the whole thing, you could run a test VM
on an external SATA/USB/Firewire drive and power off the drive during
the test.  This *shouldn't* affect your production VMs (but I'd use separate
hardware just to be sure.)

What a headache.  I want to be working on my programming projects, not
becoming a super admin.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
