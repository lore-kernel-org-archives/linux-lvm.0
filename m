Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6E74MFO007367
	for <linux-lvm@redhat.com>; Mon, 14 Jul 2008 03:04:22 -0400
Received: from tzm.it (relay.tzm.it [195.137.128.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6E745nI019199
	for <linux-lvm@redhat.com>; Mon, 14 Jul 2008 03:04:06 -0400
Message-ID: <000001c8e580$16b19310$ae00a8c0@ferroamd64>
From: "Alessandro Ferrari" <alexferro@tiscali.it>
References: <002301c8e29e$cca45110$ae00a8c0@ferroamd64>
	<20080710151043.GZ22522@agk.fab.redhat.com>
Subject: Re: [linux-lvm] vgscan problem: Snapshot and origin LVs must differ.
Date: Sun, 13 Jul 2008 20:45:16 +0200
MIME-Version: 1.0
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Alasdair!

I writed you log message show me by sysreccd 1.4beta7.

This sysresccd version is lvm1 capable.

I don't understand what means:

"Snapshot and origin LVs must differ." ?

Thanks, Alessandro


----- Original Message ----- 
From: "Alasdair G Kergon" <agk@redhat.com>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Thursday, July 10, 2008 5:10 PM
Subject: Re: [linux-lvm] vgscan problem: Snapshot and origin LVs must 
differ.


> On Thu, Jul 10, 2008 at 05:08:24PM +0200, Alessandro Ferrari wrote:
>> I tell you my LVM story....
>> I have add LVM1 capability to my linux box kernel 2.4.36.5.
>
>> Now I can't mount /dev/VOLHOME/HOMELV and "vgscan -v" write this 
>> messages:
>>     /dev/sdb1: size is 3906204687 sectors
>
> That's output from lvm2 - but you say your kernel only has lvm1 in it.
> You can't mix and match them like that: work out what you meant to
> run - lvm1 or lvm2.
>
> Alasdair
> -- 
> agk@redhat.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 
