Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3M58jp23174
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 01:08:45 -0400
Received: from solwarra.gbrmpa.gov.au (solwarra.gbrmpa.gov.au [146.116.1.5])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3M58gFe023503
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 01:08:43 -0400
Received: from gbrmpa.gov.au (pandemonium.gbrmpa.gov.au [146.116.2.0])
	by solwarra.gbrmpa.gov.au (8.11.6+Sun/8.10.2) with ESMTP id
	i3M53RK18085
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 15:03:27 +1000 (EST)
Message-ID: <40875353.8020104@gbrmpa.gov.au>
Date: Thu, 22 Apr 2004 15:08:35 +1000
From: Glen Harris <glen@gbrmpa.gov.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] About Extending LVM size with Hardware Raid
References: <01285A15-9419-11D8-B982-000A95730E92@spamaps.org>
In-Reply-To: <01285A15-9419-11D8-B982-000A95730E92@spamaps.org>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Clint Byrum wrote:
> Just curious, but what kind of rebuild time do you see on that 1.25TB 
> RAID5 volume?

Adding a single 250Gb 5400RPM Maxtor disk to the 5-disk RAID5 took just
over 30 hours. For future disks, we'll be adding them in multiples - if
we can get pvresize working, of course. The box can take 12 disks.

We're willing to take the time penalty, and in return get more space, as
this box is a rsync server. The servers rsync to this box quickly overnight,
then it backs up to the tape library in the early morning/during the day.
This is a (relatively)cheap backup solution, and as such, doesn't need the
on-line resiliancy of the file or database servers.

For the file/IMAP/Oracle servers with their Sun SCSI FC raid box, we're
running several raids as needs grow and aggregating them with the metadisk
software.
