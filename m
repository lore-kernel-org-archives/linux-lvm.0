Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAUDsT6K021802
	for <linux-lvm@redhat.com>; Sun, 30 Nov 2008 08:54:29 -0500
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.174])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAUDrpMn025888
	for <linux-lvm@redhat.com>; Sun, 30 Nov 2008 08:53:51 -0500
Received: by wf-out-1314.google.com with SMTP id 25so2158678wfc.6
	for <linux-lvm@redhat.com>; Sun, 30 Nov 2008 05:53:50 -0800 (PST)
Message-ID: <41519ea60811300553u65b6817bk508df6b8344d9c9f@mail.gmail.com>
Date: Sun, 30 Nov 2008 14:53:50 +0100
From: "Fabio Coatti" <fabio.coatti@gmail.com>
Subject: Re: [linux-lvm] pvresize complains about too many metadata
In-Reply-To: <20081130123440.GG13235@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <41519ea60811290713g46083998v6c42bb7b578f1472@mail.gmail.com>
	<20081130123440.GG13235@agk.fab.redhat.com>
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

2008/11/30 Alasdair G Kergon <agk@redhat.com>:
> On Sat, Nov 29, 2008 at 04:13:31PM +0100, Fabio Coatti wrote:
>>   /dev/md1: too many metadata areas for pvresize
>
> That's meant to be saying you chose to place a second copy of the metadata at
> the end of the device and if you want to increase the size of the data area you
> have to shift that metadata first and there is no code that does that.
>
> Workaround is to reduce to 1 metadata area first (backup VG, redo pvcreate with
> uuid & restorefile, restore VG), then extend, then put the 2nd metadata area
> back (same process) if you still want it.
>


Thanks for your explanation, really helpful. Now I can understand
what's going up.

Thanks.
