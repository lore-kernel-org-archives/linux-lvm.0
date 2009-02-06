Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n16DpxkL017555
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 08:52:00 -0500
Received: from alopias.GreenKey.net (alopias.GreenKey.net [209.209.60.60])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n16Dpi4W003366
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 08:51:44 -0500
Date: Fri, 6 Feb 2009 05:51:44 -0800 (PST)
From: Curtis Doty <Curtis@GreenKey.net>
Subject: Re: [linux-lvm] LVM mirroring..
In-Reply-To: <a80c86b70902041042l3e9f3cecn1ade9ca25792039d@mail.gmail.com>
References: <a80c86b70902041042l3e9f3cecn1ade9ca25792039d@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <20090206135144.5544C6F064@alopias.GreenKey.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Yesterday Prateek Donni said:

> I have been trying to make use of LVM mirroring to create a data
> protection application , i tried configuring it on two disks but it
> does not work w/o using --corelog.

I think you need this or a third disk for log PE if you want mirror to 
persist reboots.

> And secondly i cannot see the volume which is the mirror using lvscan , 
> but can only be seen in the GUI.

Works here with -a and displays both lv target and mimages.

../C
