Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2SLQAZb024521
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 17:26:10 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2SLQ6nP001609
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 17:26:06 -0400
Date: Mon, 28 Mar 2011 17:26:01 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D90C75A.2090203@cfl.rr.com>
Message-ID: <alpine.LRH.2.00.1103281705540.15600@bmsred.bmsi.com>
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
	<4D8D6EAF.8050403@cox.net>
	<alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>
	<4D8D78D5.7050701@cox.net>
	<alpine.LRH.2.00.1103261143510.28300@bmsred.bmsi.com>
	<20110326203022.GA11173@redhat.com>
	<alpine.LRH.2.00.1103271738040.8517@bmsred.bmsi.com>
	<4D90C374.9080106@cfl.rr.com>
	<alpine.LRH.2.00.1103281319240.13964@bmsred.bmsi.com>
	<4D90C75A.2090203@cfl.rr.com>
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
To: Phillip Susi <psusi@cfl.rr.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 28 Mar 2011, Phillip Susi wrote:

> On 3/28/2011 1:24 PM, Stuart D. Gathman wrote:
>> Ah, thank you!  Yes, I am using ext3 with EL5.5 defaults, and will now
>> learn
>> about the barrier option.  Seems like a good thing to turn on when "replace
>> battery" comes up on the ups.
>>
>> It sounds like dumb luck/divine mercy that the raid 1 PV on which the
>> production LV resides did not have a similar issue.
>
> It actually should be on all the time, which is why it defaults to on in
> ext4.  A UPS doesn't help if the kernel crashes or some hardware fails.
> I have no idea why incidents like this are not common place with ext3
> since it is inherently unsafe without barriers, whether you are using
> lvm or mdadm or not.

EL5.x does not support write barriers in lvm or md.  That may be why ext3
defaults to not using them.  Fedora supports barriers in md and LVM, but I'm
not clear on the VM systems.  There are hardware raid controllers with battery
backed write cache that disable write caching on the drives.  These fail if the
power outage is extended.

The size of a drive write cache is limited (8 MiB max), and a drive always
starts writing immediately - the write cache is to avoid blocking subsequent
host writes.  It seems to me that an ideal hardware solution would be a battery
that powers the drive just long enough to finish the write cache - just a few
seconds at worst.  Of course, the system UPS is supposed to supply that, and
that must be why I've never seen a drive level UPS offered.

We used to have Motorola servers that would provide a POWERFAIL signal when AC
failed, nearly a second before DC failed (big capacitors).  The OS could use
that to suspend disk writes, giving drives a chance to finish flushing.
If AC power is restored before the capacitor runs out, then writes would
resume.  Knowing what I know now, I used this signal incorrectly. 
On POWERFAIL, the database would flush its write cache.  Not smart if the
disk write cache was full.  (I'm not sure drives had write cache in those
days - drive tech was SCSI 2.)

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
