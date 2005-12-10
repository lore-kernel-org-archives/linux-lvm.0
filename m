Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBAMiF121627
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 17:44:15 -0500
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBAMiBTb010085
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 17:44:12 -0500
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id B36CE24FAB
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 15:44:00 -0700 (MST)
Date: Sat, 10 Dec 2005 15:44:00 -0700
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] LVM onFly features
Message-ID: <B3E2561C8D66866DCF5FD2D8@dhcp-2-206.wgops.com>
In-Reply-To: <20051210223139.GI3103@mjk.myfqdn.de>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<20051210194827.GE3103@mjk.myfqdn.de>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
	<20051210202232.GG3103@mjk.myfqdn.de>
	<64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
	<20051210223139.GI3103@mjk.myfqdn.de>
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



--On December 10, 2005 11:31:40 PM +0100 Marc-Jano Knopp 
<pub_ml_lvm@marc-jano.de> wrote:

> I thought the tails would be used to save the file blocks with less than
> $BLOCKSIZE? So, if ReiserFS lost the tails, it would be a very lucky
> coincidence, if none of the files were damaged. Or am I misguided again?
> :-}

Any tail can be packed if it doesn't match the block size.  In our case the 
corruption evidenced itself as files with the first part being ok, and the 
last part being all NULLs (0x0) up to the 'normal' file size.
