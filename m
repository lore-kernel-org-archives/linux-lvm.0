Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1KHaVsq030385
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 12:36:31 -0500
Received: from smtp112.sbc.mail.mud.yahoo.com (smtp112.sbc.mail.mud.yahoo.com
	[68.142.198.211])
	by mx2.redhat.com (8.13.1/8.13.1) with SMTP id l1KHaTBW030387
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 12:36:30 -0500
Message-ID: <45DB3196.20908@akamail.com>
Date: Tue, 20 Feb 2007 09:36:22 -0800
From: Duane Clark <dclark@akamail.com>
MIME-Version: 1.0
References: <682963.73875.qm@web38214.mail.mud.yahoo.com>	<45D0CFA1.9070508@akamail.com>
	<20070220114518.13e93256@slopi>
In-Reply-To: <20070220114518.13e93256@slopi>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Extending the Root Volume with LVM
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

Chris Osicki wrote:
> Clark
> 
> Have a look at ext2online. It comes with RHEL 4.

I'll admit I was unaware of that command. I notice that the third 
sentence of the man page says "It is only possible to enlarge a mounted 
filesystem". While Sean was indeed increasing the size, I was trying to 
reduce it.

<just a bit of venting, so feel free to ignore>
A big pain with Linux, in my view, is that even after using it for six 
years, I am unaware of the majority of features available in it. I did 
what I thought was reasonable; I read the HOWTO (the one mentioned down 
there at the bottom of this email ;). No mention of ext2online there, 
nor any mention of the steps I used to resize a root filesystem; only 
the steps for a filesystem that can be easily unmounted while the OS is 
running.

And in order to figure out the steps to resize the root filesystem, I 
read through a lot of man pages and web pages and howtos, and nowhere do 
I recall coming across ext2online (though I'll admit that was awhile 
ago). By the way, I suggested in my posting that the steps be added to 
the howto (the subject line was "Howto suggestion..."). And I have seen 
other postings here with suggestions about the howto.
