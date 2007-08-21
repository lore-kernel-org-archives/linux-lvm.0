Received: from [192.168.1.51] (vpn-248-43.boston.redhat.com [10.13.248.43])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7LMpAEi022967
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 18:51:11 -0400
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <Pine.LNX.4.44.0708211521350.12788-100000@bmsred.bmsi.com>
References: <Pine.LNX.4.44.0708211521350.12788-100000@bmsred.bmsi.com>
Message-Id: <4AA1D556-9908-4BB8-8E5B-3E9FF6CC7373@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] LVM mirrors and drive failure
Date: Tue, 21 Aug 2007 17:47:30 -0500
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


On Aug 21, 2007, at 2:27 PM, Stuart D. Gathman wrote:

> The current LVM mirror code creates 3 (or more - assume just 2
> copies for discussion) pieces: copy0, copy1, log.  It is obvious what
> should and probably does happen if the PV for copy0 or copy1 goes  
> away.
> But what happens if the PV for log goes away?  Does it convert to a  
> memory
> log?  When you reboot, does it do a full sync, like with a memory log?
> Which copy is copied from and which is copied to for the sync?

Yes, it converts to an in-memory log.  Yes, you will do a full sync  
if you reboot.

We are working on code to use hot-spares.  In that case, the log  
would simply be replaced.

Also, we are working on some allocation changes so you can have a log  
and 2 copies on just two devices.

Best thing to do now is to replace the log manually if it fails.  If  
the mirror is in-sync, that will be preserved, and the mirror will  
not need to be resynced.

  brassow
