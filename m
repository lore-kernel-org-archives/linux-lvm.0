Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n15NGGq9011900
	for <linux-lvm@redhat.com>; Thu, 5 Feb 2009 18:16:16 -0500
Received: from smtp.01.com (smtp.01.com [38.98.186.166])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n15NFQ8P019622
	for <linux-lvm@redhat.com>; Thu, 5 Feb 2009 18:15:27 -0500
Received: from asav-1.01.com (localhost.localdomain [127.0.0.1])
	by asav-1.01.com (8.13.1/8.13.1) with ESMTP id n15NDZ97025502
	for <linux-lvm@redhat.com>; Thu, 5 Feb 2009 17:13:35 -0600
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp-2.01.com (Postfix) with ESMTP id 764721AD3D1
	for <linux-lvm@redhat.com>; Thu,  5 Feb 2009 17:13:35 -0600 (CST)
Received: from smtp-2.01.com ([127.0.0.1])
	by localhost (smtp-2.01.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pP5bSBeppbrS for <linux-lvm@redhat.com>;
	Thu,  5 Feb 2009 17:13:35 -0600 (CST)
Received: from [172.16.23.43] (unknown [12.130.157.75])
	by smtp-2.01.com (Postfix) with ESMTP id 3E9351AD3B0
	for <linux-lvm@redhat.com>; Thu,  5 Feb 2009 17:13:35 -0600 (CST)
Message-ID: <EMEWEMEW2_DELIMl14HDZd4de99353d877064574350,
	vsrini@spikesource.com, 498B72AB.>
Date: Thu, 05 Feb 2009 15:13:47 -0800
From: Vinay Srini <vsrini@spikesource.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 specificiation
References: <20090205224659.GU20668@agk.fab.redhat.com>
	<498B6FF5.9010307@gmail.com>
In-Reply-To: <498B6FF5.9010307@gmail.com>
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

Les Mikesell wrote:
> Alasdair G Kergon wrote:
>> On Thu, Feb 05, 2009 at 01:54:00PM -0800, Vinay Srini wrote:
>>> I have a requirement to mount multiple volume groups with the same 
>>> name (VolGroup00, as that is the most popular default name), without 
>>> first using vgrename (because something might go wrong, and I may not 
>>> be able to restore the name back).
>>  
>> It was an early design decision that every VG on a system should have a
>> different name.  Departures from that won't get supported - because 
>> it's so
>> simple to choose different names!
> 
> How do you move drives around among machines then, if they have been 
> created with the default names that will conflict?
> 

These are flat files mounted in a directory across the network. Which 
when accessed, gets bytes across the network. (mounted using fuse libs)

eg. if the flat file is located in /mnt/over-network/flat,
# losetup -f --show /mnt/over-network/flat
/dev/loop0

# vgscan (this will find my VolGroup00)
# .. and so on

One example is mounting virtual machine drives from the virtual server 
on to my desktop. In this case, i would like to perform some operations 
on the drive (copy from/to etc), and unmount.

Is there an RFC for the lvm design that I could read throught to better 
understand this?

Vinay.
