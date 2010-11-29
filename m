Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oATEolis022530
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 09:50:48 -0500
Received: from smtp12.tagonline.com (nat199.nat.tagonline.com [207.111.79.199])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oATEoZvI028923
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 09:50:35 -0500
Received: from taco.int.tagonline.com (localhost.localdomain [127.0.0.1])
	by localhost.localdomain for (8.13.1/8.12.8/muffin_cf_1.0) with ESMTP
	id oATEoYYU018410
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 09:50:34 -0500
Received: (from news@localhost)
	by taco.int.tagonline.com (8.13.1/8.13.1/Submit) id oATEoYUb018409
	for linux-lvm@redhat.com; Mon, 29 Nov 2010 09:50:34 -0500
From: Andrew Gideon <ag2827189@tagmall.com>
Date: Mon, 29 Nov 2010 14:50:34 +0000 (UTC)
Message-ID: <id0ejq$a7h$3@taco.int.tagonline.com>
References: <icjsgr$tm$1@taco.int.tagonline.com>
	<ickl50$tm$3@taco.int.tagonline.com> <4CEFDA59.1000204@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Unable to use metadata.dirs in lvm.conf? (Was: Re:
 Solving the "metadata too large for circular buffer"	condition)
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Fri, 26 Nov 2010 17:03:37 +0100, Peter Rajnoha wrote:

> (The metatada/dirs is not used so often so that's probably the reason
> why these bugs got unnoticed for a longer time. If you have any other
> problem while using this setting, plese, feel free to report it.
> Thanks.)

Thanks.  I was trying to use separate metadata storage as a way to work 
around a "metadata too large for circular buffer" problem.  I'm now 
trying to do it with "tiny" PVs storing only metadata.

But it's good to know that this feature will be available again soon.

	- Andrew
