Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6AF0ufu013373
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2007 11:00:56 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.181])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6AF0tLP026464
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2007 11:00:55 -0400
Received: by py-out-1112.google.com with SMTP id p76so2741354pyb
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2007 08:00:55 -0700 (PDT)
Message-ID: <1cd18cb0707100800l62d33876sc90e29854a43dc42@mail.gmail.com>
Date: Tue, 10 Jul 2007 17:00:55 +0200
From: "Marco Antonelli" <marcoantonelli82@gmail.com>
Subject: Re: [linux-lvm] Logical Volume on two disk,
	one is broken: how to restore data from the good disk?
In-Reply-To: <20070710145150.GA2984@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1cd18cb0707100731h7cef5a91qcab1051f234c61bb@mail.gmail.com>
	<20070710145150.GA2984@redhat.com>
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
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

2007/7/10, Heinz Mauelshagen <mauelshagen@redhat.com>:

> You got to put the PVs on MD RAID >= 1 or use LVM mirring to avoid this.
> Reach out for your backups :(
>
> Regards,
> Heinz    -- The LVM Guy --

Yes, I will setup RAID these days, but... there is no way to read the
data on the good disk?? I have only an incomplete backup
