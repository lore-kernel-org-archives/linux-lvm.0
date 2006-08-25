Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7P7UNux030299
	for <linux-lvm@redhat.com>; Fri, 25 Aug 2006 03:30:23 -0400
Received: from smtp-send.myrealbox.com (smtp-send.myrealbox.com
	[151.155.5.143])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7P7ULq8008269
	for <linux-lvm@redhat.com>; Fri, 25 Aug 2006 03:30:21 -0400
Message-Id: <7.0.1.0.2.20060825130840.00fb4a90@myrealbox.com>
Date: Fri, 25 Aug 2006 13:10:31 +0800
From: Jim Morgan <peripatetic@myrealbox.com>
Subject: Re: [linux-lvm] Partitioning remotely
In-Reply-To: <20060823172132.GG20318@percy.comedia.it>
References: <1156095294.3778.5.camel@dividebyzero.somewhere.localtld>
	<20060823142949.GA13859@agk.surrey.redhat.com>
	<7.0.1.0.2.20060823231439.020a6c48@myrealbox.com>
	<20060823172132.GG20318@percy.comedia.it>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

At 24/08/2006 01:21, you wrote:
>>I've been reading around the internet to see if I can resize the 
>>partitions on the disk and/or in the LVM. There seems to be 
>>conflicting advice on the subject and I don't want to make a move 
>>before I'm absolutely sure. My choices seem to be
>
>you are not using LVM

Thanks Luca. With that one comment you have clarified several days of 
confusion. My mistake, of course, was to assume that LVM was an 
integral part of software RAID, whereas it is a separate and 
complimentary entity.

It doesn't solve my problem, but now at least I understand what the 
problem is! :-)

Jim
