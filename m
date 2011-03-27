Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2RLtpjR032655
	for <linux-lvm@redhat.com>; Sun, 27 Mar 2011 17:55:51 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2RLtlIo015622
	for <linux-lvm@redhat.com>; Sun, 27 Mar 2011 17:55:47 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p2RLtjF1015212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 27 Mar 2011 17:55:45 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p2RLtjIs008600
	for <linux-lvm@redhat.com>; Sun, 27 Mar 2011 17:55:45 -0400
Date: Sun, 27 Mar 2011 17:55:45 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <20110326203022.GA11173@redhat.com>
Message-ID: <alpine.LRH.2.00.1103271738040.8517@bmsred.bmsi.com>
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
	<4D8D6EAF.8050403@cox.net>
	<alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>
	<4D8D78D5.7050701@cox.net>
	<alpine.LRH.2.00.1103261143510.28300@bmsred.bmsi.com>
	<20110326203022.GA11173@redhat.com>
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

On Sat, 26 Mar 2011, Mike Snitzer wrote:

>> In the case of a snapshot, I believe the COW and origin blocks are written
>> in parallel.  Snapshots are slow enough as it is.  :-)  So it is not
>> surprising that it loses  consistency on power failure.
>
> The cow is completed before the origin is written.  In addition, the
> snapshot volume offers full support for flush (barriers) to both the
> origin and snapshot devices.
>
> Your FUD about inconsistency due to the snapshot implementation needs
> to be substantiated with something more than an incoherent guesswork
> theory.
>
> That said, anything is possible.  But if you want real help you need to
> be specific about which kernel you're using.  What is your underlying
> hardware (and caching mode)?  And what it was you were doing at the time
> of the power failure (running some FS benchmark? or what?).

Don't need help, just trying to understand the event.  So from what you
said, the problem probably stems from the RAID1 resync, which could
make one PV "older" than the other.

LVM is EL5.5 via Centos: lvm2-2.02.56 (really old - yes I know).  kernel-2.6.18
(with patches).

As I already said, the production system (on origin) was running a scheduled
database backup, which does involve copying about 2 gigs of data to another
directory on the origin.  So the origin was likely heavily writing when
the power (and UPS) failed.

I'll mention again that these are linear LVs on top of md raid1.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
