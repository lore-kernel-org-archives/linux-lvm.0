Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5PDPvwd030039
	for <linux-lvm@redhat.com>; Tue, 25 Jun 2013 09:25:57 -0400
Received: from minerva.ithagi.be (minerva.ithagi.be [194.50.177.62])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5PDPuFw006752
	for <linux-lvm@redhat.com>; Tue, 25 Jun 2013 09:25:56 -0400
Received: from edynami by minerva.ithagi.be with local (Exim 4.80)
	(envelope-from <liedekef@telenet.be>) id 1UrTFp-0000FQ-9m
	for linux-lvm@redhat.com; Tue, 25 Jun 2013 15:25:53 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 25 Jun 2013 15:25:53 +0200
From: Franky Van Liedekerke <liedekef@telenet.be>
In-Reply-To: <25f646caf787289b2d4fb94f7f2c06da@imap.telenet.be>
References: <25f646caf787289b2d4fb94f7f2c06da@imap.telenet.be>
Message-ID: <4ccdd765850b8d95f9d84a1db2e0f10d@imap.telenet.be>
Subject: Re: [linux-lvm] lvcreate/convert a clustered striped mirror
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 2013-06-25 15:20, Franky Van Liedekerke wrote:

<snip>

> Now, however, if I decide to first create the stripe on SAN1:
>   lvcreate -i 2 -I 4 -n lvtest vgtest -L 90G
> /dev/mapper/CLVM-SAN1-1315 /dev/mapper/CLVM-SAN1-1316
> and then the mirror (mirrorlog core used for testing):
>   lvconvert -m1 --mirrorlog core vgtest/lvtest
> 

Nevermind this part: I found out that "--stripes 2 -I 4" for the 
lvconvert command works ok (I tried with the -i option first, as in the 
lvcreate, but apparantly that's a different thing for lvconvert).

So the remaining questions are:

> - And a second question: "-mirrorlog mirrored" doesn't seem to be
> possible in a clvm setup, is this intended?
> - And in general: is there another method to get a mirrored stripe in
> a clustered setup?


With friendly regards,

Franky
