Received: from jeltz.pjc.net (vpn-6-1.fab.redhat.com [10.33.6.1])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l9H8YpxA030385
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 04:34:51 -0400
Message-ID: <4715C925.6060405@redhat.com>
Date: Wed, 17 Oct 2007 09:34:45 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] stupid question about lvm/lvm2/clvm
References: <4715A86F.40504@ezpear.com> <4715C511.3050400@redhat.com>
	<4715C6E9.4000703@ezpear.com>
In-Reply-To: <4715C6E9.4000703@ezpear.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hans wrote:
> Thanks. Openfiler uses rPath linux.
> Is it any way that I can check if lvm is configured with clvm?

Check you have the clvmd binary installed :)
You also need to set the locking_type to 2 or 3 in /etc/lvm/lvm.conf

> Maybe it should be listed in lvm formats?

It's not a format :)

-- 
Patrick
