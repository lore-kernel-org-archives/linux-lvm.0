Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3MI0kp25566
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 14:00:46 -0400
Received: from mta2.cl.cam.ac.uk
	(IDENT:V8qIxLHx2ljbsp4FsZimrbY4Ea0+9w7k@mta2.cl.cam.ac.uk
	[128.232.0.14])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3MI0j99031108
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 14:00:46 -0400
Received: from greta.cl.cam.ac.uk ([128.232.8.169] helo=cl.cam.ac.uk
	ident=[omRJwyts/7oYjjl6ABqzc8K5cBzFvdlG])
	by mta2.cl.cam.ac.uk with esmtp (Exim 3.092 #1) id 1BGiVA-0008JJ-00
	for linux-lvm@redhat.com; Thu, 22 Apr 2004 19:00:44 +0100
Subject: Re: [linux-lvm] About Extending LVM size with Hardware Raid 
In-Reply-To: Message from "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com> 
	of "Thu, 22 Apr 2004 09:48:56 PDT."
	<4087F778.2080001@backtobasicsmgmt.com> 
References: <01285A15-9419-11D8-B982-000A95730E92@spamaps.org> 
	<40875353.8020104@gbrmpa.gov.au>
	<1082652373.9271.29.camel@arthur.cbd.careercast.com>
	<4087F778.2080001@backtobasicsmgmt.com>
Mime-Version: 1.0
Date: Thu, 22 Apr 2004 19:00:44 +0100
From: Piete Brooks <Piete.Brooks@cl.cam.ac.uk>
Message-Id: <E1BGiVA-0008JJ-00@mta2.cl.cam.ac.uk>
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

> I don't think there's a reliable, safe way to hotswap PATA,

I thought it was safe (i.e. would not damage the IDE bus drivers in the 
computer or disc) so long as the caddy takes care with the order in which the 
pins are (dis)connected [e.g. by having different pin lengths] or less subtly, 
by having the caddy lock disconnect the power on unlocking.

[ of course, you only have one device per IDE bus ]

> and even if the hardware exists Linux doesn't support it well.

Best bet is to look at the various "select bay" commands for laptops.
