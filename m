Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1LIX9122073
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 13:33:09 -0500
Received: from hotmail.com (bay101-f36.bay101.hotmail.com [64.4.56.46])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1LIX7j7022599
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 13:33:07 -0500
Message-ID: <BAY101-F36B95A665C96EE64901F3CC1FC0@phx.gbl>
From: "Dave Schile" <daveschile@hotmail.com>
Date: Tue, 21 Feb 2006 17:14:41 +0000
Mime-Version: 1.0
Subject: [linux-lvm] LVM - help replacing a drive.
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

This is a simple question, but I really don't want to lose any data, so I'd 
really appreciate it if someone could give me a quick rundown on how this is 
done. I've searched around and read the LVM Howto but Im still not 
comfortable with this specific scenario:

I have a simple implementation of LVM that creates logical volume from 
/dev/hda3 and /dev/hdc1. /dev/hda is a 250G drive that holds the filesystem 
on /dev/hda1, but only /dev/hda3 is part of the volume group. /dev/hdc1 is a 
100G drive with only one partition and its part of the volume group.

I want to replace /dev/hdc1 with a 250G drive I just bought. Right now the 
whole logical volume is 334G. All of that is allocated and none is free as 
far as physical extens go. However, I only have 119G of data on the whole 
logical volume. Is there any way to tell where physically that data resides? 
I cannot do a pvmove (as I understand it) because I have no free extens on 
/dev/hda3. Is it better to make extens available somehow on /dev/hda3 and do 
a pvmove? or should I install the new drive somewhere else, like /dev/hdb, 
then add it to the volume group and do a pvmove? If that's the case, then 
will it screw up the volume group when I move the new drive into its 
permanent location at /dev/hdc?

I know that's a lotta questions, but I really need some clarification. If 
anyone can help I'll be very thankfull.

Dave Schile
