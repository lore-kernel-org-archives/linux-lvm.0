Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBAMpN122452
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 17:51:23 -0500
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBAMpBqB003664
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 17:51:17 -0500
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id 431C524FAB
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 15:51:01 -0700 (MST)
Date: Sat, 10 Dec 2005 15:51:00 -0700
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] LVM onFly features
Message-ID: <208D3DC6840704A034151D63@dhcp-2-206.wgops.com>
In-Reply-To: <B3E2561C8D66866DCF5FD2D8@dhcp-2-206.wgops.com>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<20051210194827.GE3103@mjk.myfqdn.de>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
	<20051210202232.GG3103@mjk.myfqdn.de>
	<64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
	<20051210223139.GI3103@mjk.myfqdn.de>
	<B3E2561C8D66866DCF5FD2D8@dhcp-2-206.wgops.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: LVM general discussion and development <linux-lvm@redhat.com>



--On December 10, 2005 3:44:00 PM -0700 Michael Loftis <mloftis@wgops.com> 
wrote:

>
>
> --On December 10, 2005 11:31:40 PM +0100 Marc-Jano Knopp
> <pub_ml_lvm@marc-jano.de> wrote:
>
>> I thought the tails would be used to save the file blocks with less than
>> $BLOCKSIZE? So, if ReiserFS lost the tails, it would be a very lucky
>> coincidence, if none of the files were damaged. Or am I misguided again?
>> :-}
>
> Any tail can be packed if it doesn't match the block size.  In our case
> the corruption evidenced itself as files with the first part being ok,
> and the last part being all NULLs (0x0) up to the 'normal' file size.


I really should say *mostly* because yes, files that were entirely shorter 
than the blocksize were essentially gone (full of NULLs).

Our mail server makes the best use of reiserfs because of the huge number 
of files and the amount of files that end up packed.
