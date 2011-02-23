Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1NI5Z39011170
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 13:05:35 -0500
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NI5LRf013973
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 13:05:23 -0500
Message-ID: <4D654C52.8010301@abpni.co.uk>
Date: Wed, 23 Feb 2011 18:05:06 +0000
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>
	<1298466573.19562.147.camel@ubuntu>	<4D65124C.1070505@abpni.co.uk>
	<1298470564.19562.150.camel@ubuntu>	<4D651735.1000802@abpni.co.uk>	<20110223101259.77143753@bettercgi.com>	<4D653BEF.5010600@abpni.co.uk>
	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
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


On 23/02/11 17:54, Stuart D. Gathman wrote:
> On Wed, 23 Feb 2011, Jonathan Tripathy wrote:
>
>>> Zeroing c1_s1 first, then c1_s1_snap0-cow would zero everything,
>> Thanks for the explanation. But what if I don't want to zero everything? I
>> only want to return everything back to the state it was before I created the
>> snapshot.
> So you're not worried about the security implication of leftovers in free
> space, and just want a base image to clone for new customers?
Yes I am. This is exactly what I'm worried about. I just need to know 
how to zero out any "left over" bits of data that would be left over 
after removing a snapshot. I use snapshots for backing up a volume (by 
running rsync against the snapshot to a remote server)
