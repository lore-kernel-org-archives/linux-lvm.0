Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4PEEBZM015960
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 10:14:11 -0400
Received: from nexredback-216-168-119-94.nexicom.net (mail.fibrespeed.net
	[216.168.105.35] (may be forged))
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k4PEE9se005003
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 10:14:10 -0400
Message-ID: <4475BB95.3070509@mikebabcock.ca>
Date: Thu, 25 May 2006 10:13:41 -0400
From: "Michael T. Babcock" <mike@mikebabcock.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Xraids and lvm
References: <C09B1F19.3972%schuemann@supportdept.com>
	<20060525133420.GD3674@percy.comedia.it>
In-Reply-To: <20060525133420.GD3674@percy.comedia.it>
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
To: linux-lvm@redhat.com

Luca Berra wrote:
> On Thu, May 25, 2006 at 08:45:13AM -0400, Dustin Schuemann wrote:
>> I have two xraid's that are on /dev/sda1 and /dev/sdb1. The device on
>> /dev/sda1 is formatted ext3. What I would like to do is format 
>> /dev/sdb1 as
>> ext3 and then create a volume out of the two that doesn't lose the 
>> data on
>> /dev/sda1. Is this possible without reformatting and then creating the
>> volume and copying back.
>
> NO
>
However, you could make a VG with just sdb1 instead of formatting it 
ext3, create the LV on it, format /that/ as ext3 and copy the sda1 data 
to the new LV (on sdb1).  Once copied off, you can make a PV over top of 
sda1 (erasing it) and add it to the same VG, making your VG span both 
devices without losing data.

This only works if you're not booting off sda1 and if sdb1 is at least 
as big as the data set on sda1.
-- 
Michael T. Babcock
http://mikebabcock.ca
