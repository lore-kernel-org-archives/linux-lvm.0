Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j02DUVr13777
	for <linux-lvm@redhat.com>; Sun, 2 Jan 2005 08:30:31 -0500
Received: from sv0.iquer.net (sv0.iquer.net [195.234.230.70])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j02DUKpp019127
	for <linux-lvm@redhat.com>; Sun, 2 Jan 2005 08:30:21 -0500
From: Erik Wasser <erik.wasser@iquer.net>
Subject: Re: [linux-lvm] LVM2 strange behaviour
Date: Sun, 2 Jan 2005 14:30:14 +0100
References: <20050102121805.GT326@dogbert>
In-Reply-To: <20050102121805.GT326@dogbert>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200501021430.15011.erik.wasser@iquer.net>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sunday 02 January 2005 13:18, Fred Donck wrote:

> $> lvm version
>   LVM version:     2.00.08 (2003-11-14)
>   Library version: 1.00.17-ioctl (2004-04-19)
>   Driver version:  4.3.0
> $>

Very funny, I made the same mistake like you. Please upgrade your LVM2 
to the newest version. B-)

Read the thread 'Very long startup times of the lv*-tools'[1][2] for 
further details.

[1]https://www.redhat.com/archives/linux-lvm/2004-December/msg00124.html
[2]https://www.redhat.com/archives/linux-lvm/2004-December/msg00126.html

-- 
So long... Fuzz
