Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mAEFSXme018019
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 10:28:33 -0500
Message-Id: <D7E96DB2-3B89-4661-B78C-D391FB4DCE4B@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <61252CC53A97634BA52256DCF2344FBC66CA1457C7@OFFICEEXCHANGE.office.smartechcorp.net>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] Moving Xen LV to image and mounting the image.
Date: Fri, 14 Nov 2008 09:27:28 -0600
References: <491BF3CF.2090800@knebb.de>
	<C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>
	<491C019F.6060205@knebb.de>
	<361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
	<491D34F3.7030108@knebb.de>
	<61252CC53A97634BA52256DCF2344FBC66CA1457C7@OFFICEEXCHANGE.office.smartechcorp.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

Looks like you are doing it correctly, but you would have to mount the  
copied image via loopback, because it is a file now and not a device.

  brassow

On Nov 14, 2008, at 8:53 AM, Chris Edwards wrote:

> Hello All!
>
> I have been trying to solve a problem.  In my current scenario I  
> created on our SAN multiple volume groups with a single logical  
> volume on each taking the entire groups space.  I realized that I  
> made a mistake and did not leave room for doing snapshots.  Now I am  
> moving each of the LV's to a new single large logical group and  
> leaving space for snap shots.  So then I realized that I could do a  
> "dd" to an image file (example: "dd if=/dev/VolGroup00/LogVol00 of=/ 
> root/wdcdns1.img").  I was wondering if there was a way to mount  
> this image file?  I can't seem to mount it no matter what I do.  Am  
> I doing this correctly?
>
> Thanks for any help!
>
> ---
>
> Chris Edwards
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
