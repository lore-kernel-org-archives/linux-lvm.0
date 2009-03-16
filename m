Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GB2snG032143
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 07:02:54 -0400
Received: from thb-mta-18.emailfiltering.com (thb-mta-18-tx.emailfiltering.com
	[194.116.199.213])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2GB2d3q007535
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 07:02:39 -0400
Received: from smtp.media-brokers.com ([70.43.81.99])
	by thb-mta-18.emailfiltering.com with emfmta (version
	3.7.1.44.1.r-3.2.3-libc2.3.2) vanilla id 1110840886
	for linux-lvm@redhat.com; Mon, 16 Mar 2009 11:02:38 +0000
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 725C42D7F66
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 07:02:37 -0400 (EDT)
Message-ID: <49BE31CC.7050905@Media-Brokers.com>
Date: Mon, 16 Mar 2009 07:02:36 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fsync() and LVM
References: <49BA9BF9.3070507@esiway.net><Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>	<20090313203812.GK7445@agk.fab.redhat.com>	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
	<49BC511E.5040402@esiway.net>
In-Reply-To: <49BC511E.5040402@esiway.net>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 3/14/2009 8:51 PM, Marco Colombo wrote:
> Stuart D. Gathman wrote:
>> On Sat, 14 Mar 2009, Dietmar Maurer wrote: 
>> It just means that write barriers won't get passed to the device.
>> This is only a problem if the devices have write caches.  Note 
>> that with multiple devices, even a FIFO write cache could cause 
>> reordering between devices (one device could finish faster than another).

> No, it's more than that. PostgreSQL gurus say LVM doesn't honor fsync(),
> that data doesn't even get to the controller, and it doesn't matter
> if the disks have write caches enabled or not. Or if they have battery backed
> caches. Please read the thread I linked. If what they say it's true,
> you can't use LVM for anything that needs fsync(), including mail queues
> (sendmail), mail storage (imapd), as such. So I'd really like to know.

Seeing as my /var (with both postfix & courier-imap using it for mail
storage) has been on lvm for almost 4 years, that would be news to me...

;)

-- 

Best regards,

Charles
