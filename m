Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u18HOolZ013369
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 8 Feb 2016 12:24:50 -0500
Received: from mailrelay.lanline.com (mailrelay.lanline.com [216.187.10.16])
	by mx1.redhat.com (Postfix) with ESMTPS id 5A84580081
	for <linux-lvm@redhat.com>; Mon,  8 Feb 2016 17:24:49 +0000 (UTC)
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mailrelay.lanline.com (8.14.5/8.14.5) with ESMTP id u18GoLUT063933
	for <linux-lvm@redhat.com>; Mon, 8 Feb 2016 11:50:21 -0500 (EST)
	(envelope-from john@stoffel.org)
Received: from quad.stoffel.org (66-189-26-192.dhcp.oxfr.ma.charter.com
	[66.189.26.192]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id u18Gak8N028125
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 8 Feb 2016 11:36:47 -0500 (EST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <22200.51067.765584.447144@quad.stoffel.home>
Date: Mon, 8 Feb 2016 11:51:07 -0500
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <20160208091705.GA1612@rh-vpn>
References: <87a8nctl7x.fsf@vostro.rath.org>
	<20160208091705.GA1612@rh-vpn>
Subject: Re: [linux-lvm] lvmcache performance
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

>>>>> "Joe" == Joe Thornber <thornber@redhat.com> writes:

Joe> On Sun, Feb 07, 2016 at 10:43:30AM -0800, Nikolaus Rath wrote:
>> Is that the wrong expectation? But even then, shouldn't I at least see
>> some improvement?

Joe> Firstly, if you have the latest software, I suggest you switch to
Joe> the smq cache policy which is generally out performing the old mq
Joe> policy substantially.

Is there a tool to help measure lvmcache performance metrics and
display how well the cache is working?

Joe> Secondly, I think you may need to reset your expectations a bit.
Joe> dm-cache is a slow moving cache.  It monitors IO, detectings
Joe> hotspots on the disk and then 'promotes' those regions to the
Joe> SSD.  You may find that the reads that occur during a boot, occur
Joe> only infrequently once the system is booted.

I'm personally using it for caching VMs and NFS data dirs.  Seems to
be working well... but I wonder.  
