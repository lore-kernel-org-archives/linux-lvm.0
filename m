Return-Path: <milang@tal.org>
Message-ID: <001501c0e509$45251b60$56dc10c3@tal.org>
From: "Kaj-Michael Lang" <milang@tal.org>
References: <Pine.LNX.4.33.0105241145560.1276-100000@UberGeek.coremetrics.com>
Subject: Re: [linux-lvm] Raid5 sync problem
Date: Fri, 25 May 2001 13:55:52 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: linux-raid@vger.kernel.org

> You are running off of parity. Until you get that drive fixed, it will
> hurt.
>

I *think* I've found out what happened (not sure, not tested), fsck was
trying to scan all of the LVs on the same raid5 at the same time. And as the
raid5 code had to calculate everything and trying to sync in the
background... instant high load. But I'm not sure.. and I really don't wan't
to test it..
Could that be it ?
