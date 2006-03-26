Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2Q7PGgQ023410
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 02:25:16 -0500
Subject: Re: [linux-lvm] online resize
References: <20060316130827.5D17912ED4@bluewhale.planbit.co.uk>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 26 Mar 2006 09:21:13 +0200
In-Reply-To: <20060316130827.5D17912ED4@bluewhale.planbit.co.uk>;
	from "Roger Lucas" on Thu, 16 Mar 2006 13:08:33 -0000
Message-ID: <m2psk9acye.fsf@janus.isnogud.escape.de>
MIME-Version: 1.0
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
To: linux-lvm@sistina.com

"Roger Lucas" <roger@planbit.co.uk> writes:

> AFAIK, Reiser is the only filesystem in common use that allows volumes to be
> reduced.

ext2/3 can do that, too.  Since years.  But you have to unmount first.


urs
