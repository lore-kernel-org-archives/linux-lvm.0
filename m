Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2AFtdn18216
	for <linux-lvm@redhat.com>; Thu, 10 Mar 2005 10:55:39 -0500
Received: from mail02.malor.com (host.malor.com [69.93.140.74] (may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2AFtbVf013874
	for <linux-lvm@redhat.com>; Thu, 10 Mar 2005 10:55:37 -0500
Received: from vanish (mail02.malor.com [127.0.0.1])
	by mail02.malor.com (Postfix) with SMTP id 41AA44A044
	for <linux-lvm@redhat.com>; Thu, 10 Mar 2005 09:55:44 -0600 (CST)
Message-ID: <001301c52589$978d1500$32dcdc0a@vanish>
From: "Ron Watkins" <linux-lvm@malor.com>
References: <422F679C.8010003@boyko.net> <422F73E8.4070707@vilain.net>
Subject: Re: [linux-lvm] Building up a RAID5 LVM home server (long)[0x05B52F13]
Date: Thu, 10 Mar 2005 10:55:33 -0500
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: LVM general discussion and development <linux-lvm@redhat.com>

Remember, this is for a HOME SERVER, not a corporate database.  Assuming he 
doesn't have Gigabit Ethernet, and assuming the CPU in his server is 
reasonably beefy (at least a gigahertz), the extra speed in RAID 1 or 10 
will be entirely wasted.   For almost any home application, RAID5 is going 
to be exactly what folks want.... cheap, reliable, and more than fast enough 
to saturate the wire.

Doing RAID 10 properly would cost a great deal for disks, a lot for 
motherboards with proper, non-PCI choked Gigabit ports (need them on both 
server and client, mind you), and would take a significant amount of 
learning on the part of the home admin to get really running properly.... 
how many people want to learn about jumbo frames and cat5e wiring to set up 
a video server that will only be serving one or two videos at a time?

Yes, your solution would run faster in some circumstances, but it would be a 
LOT more expensive.   After investing all that money, he'd see it run 
somewhat faster on writes, and the server wouldn't be speed-impaired during 
a rebuild.   But he's a HOME USER.  It doesn't MATTER if the server is slow 
for a night or two.  Everything will be sluggish for a couple nights, once a 
year or so.  So what?  Since when is this is worth spending a couple grand 
to avoid?

It would often make sense for a business to do that, but from a home user 
perspective, it seems like following this specific advice would be a 
gigantic waste of money.

For nearly all home users with reasonably modern hardware, RAID5 is the 
right way to go for servers, at least for now.
