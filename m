Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3MJuwsT014654
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 15:56:58 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3MJuiHf005299
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 15:56:50 -0400
Date: Sat, 22 Apr 2006 21:56:44 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Another XFS + LVM2 snapshots problems
Message-ID: <20060422195644.GF15564@percy.comedia.it>
References: <003f01c66616$de010400$0100a8c0@inspiron>
	<20060422180104.GD4809@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060422180104.GD4809@agk.surrey.redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Apr 22, 2006 at 07:01:04PM +0100, Alasdair G Kergon wrote:
>On Sat, Apr 22, 2006 at 04:13:01PM +0200, Gabriel Barazer wrote:
>> Linux kernel 2.6.16.1
>> LVM & mapper version 2.01.15 (library 1.01.15, driver version 4.5.0)
>
>As you discovered, those versions are not compatible.
>You upgraded your kernel to a recent one: you need to upgrade your 
>dm & lvm2 packages to correspond with that kernel.  (1.02.* & 2.02.*)
>
sorry,
is there a documented compatibility matrix between dm driver version and
device-mapper library version?

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
