From: Richard Chan <rspchan@starhub.net.sg>
Subject: Re: [linux-lvm] Error with 2.5.50-dm-2; vanilla OK
In-reply-to: <3DF80316.8010708@starhub.net.sg>
Message-id: <3DF80C20.9000905@starhub.net.sg>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <3DF5DF79.4090708@starhub.net.sg> <3DF80316.8010708@starhub.net.sg>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Dec 11 22:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

AAACKK - I spoke too soon. This is with 00005.patch backed out.
If I use 00005.patch the same problem occurs.

activate/dev_manager.c:431   Loading vg00-LVmisc
activate/dev_manager.c:622   Adding target: 0 20963328 linear /dev/hdb6 
20980088
activate/dev_manager.c:622   Adding target: 20963328 20979712 linear 
/dev/hdb7 8
568
ioctl/libdevmapper.c:372   dm create vg00-LVmisc 
SsC7qFJb43vh72TctLwlpUiPvx1Hr3h
S00000000000000000000000000000001
ioctl/libdevmapper.c:375   device-mapper ioctl cmd 2 failed: Invalid 
argument
activate/dev_manager.c:471   Couldn't load device 'vg00-LVmisc'.



Richard Chan wrote:

> I'd like to report that the problem I encountered with 2.5.50-dm-2 (
> on LV not mounted, ioctl error) has been fixed in 2.5.51-dm-1. I can
> now get all my LVs with it.
>
> Thanks Joe, whatever you did works a charm.
>
> Regards
> Richard
