Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB9JhVV17205
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 14:43:31 -0500
Received: from sccrmhc12.comcast.net (sccrmhc12.comcast.net [204.127.202.56])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB9JhNXi031219
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 14:43:23 -0500
Received: from [192.168.1.3] (silvio.localnet [192.168.1.3])
	by furio.localnet (8.13.4/8.13.4) with ESMTP id jB9JhIUN009634
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 14:43:18 -0500
Message-ID: <4399DE55.6090007@mattgillen.net>
Date: Fri, 09 Dec 2005 14:43:17 -0500
From: Matthew Gillen <me@mattgillen.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Newbie of LVM
References: <20051209033914.33441.qmail@web32605.mail.mud.yahoo.com>	<4399D72B.80408@mattgillen.net>
	<7119d52b0512091138s5615a650q5bad1a566cbde72b@mail.gmail.com>
In-Reply-To: <7119d52b0512091138s5615a650q5bad1a566cbde72b@mail.gmail.com>
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

Jeff Cousino wrote:
>>You're out of luck.  You can't take an existing partition and keep the
>>data yet switch it over to LVM.  It's like RAID that way: you need to
>>set up the lower level stuff *before* you format the disk/partition with
>>your filesystem and start putting data on it.
>>
> 
> 
> But couldn't he set up his new drive with LVM copy the data from the
> old drive to it, provided it's large enough and then add the old drive
> to the group?

Right,  I was writing a followup to this effect before I got your response.

--Matt
