Received: from ns3.rdu.redhat.com (ns3.rdu.redhat.com [10.11.255.199])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8CK4iRC000877
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 16:04:44 -0400
Received: from leguan.localdomain (vpn-4-112.str.redhat.com [10.32.4.112])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m8CK4hOm032124
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 16:04:44 -0400
Message-ID: <48CACB5B.7030507@redhat.com>
Date: Fri, 12 Sep 2008 22:04:43 +0200
From: Jaroslav Stava <jstava@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Please help
References: <425904320809121138u3a25c1cfr63313aae98573f3e@mail.gmail.com>
In-Reply-To: <425904320809121138u3a25c1cfr63313aae98573f3e@mail.gmail.com>
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

Vineet Agarwal napsal(a):
> Hello
> Can anyone please tell me the entry point of LVM in kernel . I want to 
> know that when we do lvcreate or pvcreate or vgcreate then whether a 
> linear map is made by device mapper. If yes can anyone please tell 
> which function it uses or how mapping is done
> thank you
> -- 
> From :
> Vineet Agarwal
Hi,

maybe I don't understand you correctly, but isn't
"dmsetup table" sufficient?

Regards,

Jaroslav Stava
