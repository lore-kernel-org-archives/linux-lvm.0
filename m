Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j24MZXn07680
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 17:35:33 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.196])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j24MZRvI017529
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 17:35:27 -0500
Received: by rproxy.gmail.com with SMTP id g11so1256084rne
	for <linux-lvm@redhat.com>; Fri, 04 Mar 2005 14:35:27 -0800 (PST)
Message-ID: <10bf2d0c05030414357c65c6b9@mail.gmail.com>
Date: Fri, 4 Mar 2005 17:35:27 -0500
From: "Mark W. Jeanmougin" <markjx@gmail.com>
Subject: Re: [linux-lvm] LVM Question
In-Reply-To: <CEEE90D87043AA4487634844B31B03631141B17B@ukspkem01.corp.hds.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <CEEE90D87043AA4487634844B31B03631141B17B@ukspkem01.corp.hds.com>
Reply-To: "Mark W. Jeanmougin" <markjx@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Cc: Linux-LVM@sistina.com

On Fri, 4 Mar 2005 12:49:00 -0000, Matthias Rudolph
<Matthias.Rudolph@hds.com> wrote:
> how can I force to activate a VG on a special device file?
> One FC Storage Disk is visible over two pathes (sda and sdb). We use our
> Path Management Software. It creates sddlmaa. After creating the VG the
> sddlmaa is ACTIVE - OK. But after deactivating and activating sdb is ACTIVE.
> This means: no pathfailover.

Matthias,

If you look in /etc/lvm/lvm.conf, there is a line in there that will
explain how you can exclude certain devices from a vgscan.  man
lvm.conf should help you out.

I'd suggest excluding /dev/sd[ab] or maybe /dev/sd?

Hope this helps...

MJ
