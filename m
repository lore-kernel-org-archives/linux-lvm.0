Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i57EQT016948
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 10:26:29 -0400
Received: from mail.jct.ac.il ([147.161.1.14])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i57EQKXn025625
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 10:26:22 -0400
Received: from kidushin.jct.ac.il (kidushin.jct.ac.il [147.161.1.19])
	by mail.jct.ac.il (8.12.8+Sun/8.12.8) with SMTP id i57EPoXW003473
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 17:26:05 +0300 (IDT)
Received: from jct.ac.il ([147.161.1.211])
	by kidushin.jct.ac.il (SAVSMTP 3.1.3.37) with SMTP id
	M2004060717100802435
	for <linux-lvm@redhat.com>; Mon, 07 Jun 2004 17:10:08 +0300
Message-ID: <40C47AD8.1010303@jct.ac.il>
Date: Mon, 07 Jun 2004 17:25:28 +0300
From: Yedidia Klein <yedidia@jct.ac.il>
MIME-Version: 1.0
Subject: Re: [linux-lvm] can't create snapshot on FC2
References: <40C32E02.9070902@jct.ac.il>
	<20040606150550.GF6302@agk.surrey.redhat.com>
In-Reply-To: <20040606150550.GF6302@agk.surrey.redhat.com>
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

Alasdair G Kergon wrote:

>On Sun, Jun 06, 2004 at 05:45:22PM +0300, Yedidia Klein wrote:
>  
>
>>I'm trying to create snapshot on lvm2 rinning on a fresh Fedora Core 2 
>>linux machine
>>    
>>
>
>Fedora doesn't include kernel support for snapshots/mirrors yet.
>
>To use them you'd need to patch your kernel.
>  http://sources.redhat.com/dm/
>
>Alasdair
>  
>
tnx,
Is anyone using lvm2 snapshot in productions ?
I would like to use it w/ a storage system - is it ready for production ??

--Yedidia Klein
