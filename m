Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3IKdk89027825
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 16:39:46 -0400
Received: from hathawaymix.org (host-36.pl107867-6.fiber.net [216.83.137.36])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3IKdj5P006051
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 16:39:45 -0400
Message-ID: <44454E8E.70800@hathawaymix.org>
Date: Tue, 18 Apr 2006 14:39:42 -0600
From: Shane Hathaway <shane@hathawaymix.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] physical volume smaller than partition?
References: <AAB83747-D6F3-4148-9836-7E22B8AD9ABF@isg.si>	<4445294D.6050500@conterra.de>
	<CDF11F32-D2D3-47EB-8B00-E91614CEA795@isg.si>
In-Reply-To: <CDF11F32-D2D3-47EB-8B00-E91614CEA795@isg.si>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>

Martin Gombac wrote:
> Tnx. for explanation.
> I didn't think that cfdisk uses 1000 instead of 1024.

FYI: the official meaning of kilobyte is 1000 bytes.

http://en.wikipedia.org/wiki/Kilobyte
http://lwn.net/2002/0103/a/esr-kibi.php3

Interestingly, this means drive manufacturers are not misleading 
consumers after all.

Shane
