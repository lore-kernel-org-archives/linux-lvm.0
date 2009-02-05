Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n15N2Ucs005556
	for <linux-lvm@redhat.com>; Thu, 5 Feb 2009 18:02:30 -0500
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n15N2FN0008395
	for <linux-lvm@redhat.com>; Thu, 5 Feb 2009 18:02:15 -0500
Received: from ns1.futuresource.com (ns3.futuresource.com [10.207.192.125])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id n15N2Eps015795
	for <linux-lvm@redhat.com>; Thu, 5 Feb 2009 17:02:14 -0600
Received: from [10.207.193.131] (les-xp.futuresource.com [10.207.193.131])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id n15N2Dx01785
	for <linux-lvm@redhat.com>; Thu, 5 Feb 2009 17:02:14 -0600
Message-ID: <498B6FF5.9010307@gmail.com>
Date: Thu, 05 Feb 2009 17:02:13 -0600
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 specificiation
References: <20090205224659.GU20668@agk.fab.redhat.com>
In-Reply-To: <20090205224659.GU20668@agk.fab.redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:
> On Thu, Feb 05, 2009 at 01:54:00PM -0800, Vinay Srini wrote:
>> I have a requirement to mount multiple volume groups with the same name 
>> (VolGroup00, as that is the most popular default name), without first 
>> using vgrename (because something might go wrong, and I may not be able 
>> to restore the name back).
>  
> It was an early design decision that every VG on a system should have a
> different name.  Departures from that won't get supported - because it's so
> simple to choose different names!

How do you move drives around among machines then, if they have been 
created with the default names that will conflict?

-- 
   Les Mikesell
     lesmikesell@gmail.com
