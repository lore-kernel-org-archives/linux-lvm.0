Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0LEoBdd026482
	for <linux-lvm@redhat.com>; Mon, 21 Jan 2008 09:50:11 -0500
Received: from slartibartfast.qult.net (Debian-exim@qult.net [82.238.217.46])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0LEnjUV018106
	for <linux-lvm@redhat.com>; Mon, 21 Jan 2008 09:49:46 -0500
Received: from zenon.in.qult.net ([192.168.0.1])
	by slartibartfast.qult.net with esmtp (Exim 4.67)
	(envelope-from <lvm@qult.net>) id 1JGxy4-0006IN-Ue
	for linux-lvm@redhat.com; Mon, 21 Jan 2008 15:49:44 +0100
Received: from ig by zenon.in.qult.net with local (Exim 4.67)
	(envelope-from <lvm@qult.net>) id 1JGxy4-000626-Ru
	for linux-lvm@redhat.com; Mon, 21 Jan 2008 15:49:44 +0100
Date: Mon, 21 Jan 2008 15:49:44 +0100
From: Ignacy Gawedzki <lvm@qult.net>
Subject: Re: [linux-lvm] How to hide a "Linux LVM" partition away from Windows?
Message-ID: <20080121144944.GA22769@zenon.in.qult.net>
References: <20080121140239.GA16686@zenon.in.qult.net>
	<1C8CF1EA1A5B5940B81B0710B2A4C9384FF7C05295@an-ex.ActiveNetwerx.int>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1C8CF1EA1A5B5940B81B0710B2A4C9384FF7C05295@an-ex.ActiveNetwerx.int>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jan 21, 2008 at 07:31:11AM -0700, thus spake Joseph L. Casale:
> >I've been looking for the answer for some time now and it is apparently
> >nowhere to be found, so I resolved to ask it here.
> 
> http://support.microsoft.com/kb/179221

I've seen that, but I'm not sure it works reliably.  It seems more like a
cosmetic hiding, but I suspect any program might still easily access the
partitions (i.e. still not by directly reading the bytes on the block device).

Besides, it is rather annoying 1) having to do it for each partition by hand,
2) eating up drive letters for nothing and 3) to use with drive racks or other
removeable drives.

-- 
Save the whales. Feed the hungry. Free the mallocs. 
