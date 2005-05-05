Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j45F5VO27081
	for <linux-lvm@redhat.com>; Thu, 5 May 2005 11:05:31 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.194])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j45F5QiW025028
	for <linux-lvm@redhat.com>; Thu, 5 May 2005 11:05:26 -0400
Received: by wproxy.gmail.com with SMTP id 68so828426wra
	for <linux-lvm@redhat.com>; Thu, 05 May 2005 08:05:21 -0700 (PDT)
Message-ID: <472d4b2505050508052371491e@mail.gmail.com>
Date: Thu, 5 May 2005 10:05:21 -0500
From: David Mohr <squisher@gmail.com>
Subject: Re: [linux-lvm] help
In-Reply-To: <20050505125502.M61440@pk25.com>
Mime-Version: 1.0
Content-Disposition: inline
References: <427A1103.7030207@ucd.ie> <20050505125502.M61440@pk25.com>
Content-Transfer-Encoding: 8bit
Reply-To: david@mcbf.net,
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

Hi,

On 5/5/05, Diaz Rodriguez, Eduardo <ediaz@pk25.com> wrote:
> # From LVM how to
> 
> xfs
> There is no way to shrink XFS file systems.
> 
> If your are touch lvm2 you must know that about 250Gx1000 and 233x1024.
> 
> try use xfs_repair -n for see the reparis..

I don't think that's an issue here because the history that was posted
did not include an xfs_grow after he grew the LV. As such this should
IMO be a pure LVM issue, because XFS was not grown.

> I use (but it is only a personal opinion, this is very dangerous)
> (use again the first commands).
> vgextend my_volume_group /dev/hdc1
> lvextend -L250G /dev/HOME_VG/HOME_LV
> lvscan

Hmm, I agree that it sounds a bit "dangerous" but it might be worth a shot.

> In this point use xfs_repair -n
> If you see good, use xfs_repair (pray)....
> if you don't have luck try xfs_repair -d (after of this reboot) (read man
> xfs_repair)
> try to mount. (pray again).....

See above, should not be necessary.

~David
