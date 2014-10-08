Received: from [10.34.130.202] (dhcp130-202.brq.redhat.com [10.34.130.202])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s989e4Vu011747
	for <linux-lvm@redhat.com>; Wed, 8 Oct 2014 05:40:05 -0400
Message-ID: <54350673.8010202@redhat.com>
Date: Wed, 08 Oct 2014 11:40:03 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <5434562C.6020307@mglug.de>
In-Reply-To: <5434562C.6020307@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm2 low space handling
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 7.10.2014 v 23:07 Oliver Rath napsal(a):
> Hi list,
>
> how can I get some email, if a thin pool runs full? On my syslog i found
> the following messages:
>
>
> Oct  7 21:29:25 dmicn20 kernel: [1115276.145019] device-mapper: thin:
> 252:13: reached low water mark for metadata device: sending event.
> Oct  7 21:29:33 dmicn20 kernel: [1115284.693816] device-mapper: thin:
> 252:13: reached low water mark for metadata device: sending event.
> Oct  7 21:29:35 dmicn20 kernel: [1115286.086837] device-mapper: thin:
> 252:13: reached low water mark for metadata device: sending event.
> Oct  7 21:29:36 dmicn20 kernel: [1115287.369534] device-mapper: thin:
> 252:13: reached low water mark for metadata device: sending event.
> Oct  7 21:29:55 dmicn20 kernel: [1115306.290745] device-mapper: thin:
> 252:13: reached low water mark for metadata device: sending event.
> ...
>
> How can i find these messages?


Have you enabled  thin threshold in lvm.conf?

     thin_pool_autoextend_threshold = 70
     thin_pool_autoextend_percent = 20

Currently there is not yet better policy support for filled thin pool devices.

And yes - you need to trap syslog messages if you want monitoring for filled 
pool - there is no other support yet (i.e. dbus messaging)

Zdenek
