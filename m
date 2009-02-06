Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n16B87DV008782
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 06:08:07 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n16B84mu000887
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 06:08:04 -0500
Message-ID: <498C1A1D.9080108@redhat.com>
Date: Fri, 06 Feb 2009 11:08:13 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 specificiation
References: <20090205224659.GU20668@agk.fab.redhat.com>
	<498B6FF5.9010307@gmail.com>
In-Reply-To: <498B6FF5.9010307@gmail.com>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Using the oft-posted directions for changing the VG name and UUID.

Regards,
Bryn.
