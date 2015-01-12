Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0C6EBka001866
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2015 01:14:11 -0500
Received: from Ishtar.hs.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0C6E8JK003355
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2015 01:14:09 -0500
Received: from [192.168.4.12] (Athenae [192.168.4.12])
	by Ishtar.hs.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	t0C6E5p0056835
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2015 22:14:07 -0800
Message-ID: <54B3662C.4080902@tlinx.org>
Date: Sun, 11 Jan 2015 22:14:04 -0800
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <549471E8.6060209@ubuntu.com>
In-Reply-To: <549471E8.6060209@ubuntu.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Renaming volumes and /proc/mounts
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Phillip Susi wrote:
> Is it possible to get /proc/mounts to update to the new name after
> doing an lvrename of a mounted volume?  It plays hell on update-grub
> when you rename a mounted volume and /proc/mounts still has the old name.
>   
lvrename can rename an actively mounted device?  Is it supposed
to do that?

That sounds a bit strange.  I mean if I rename a network device, I'd
have to take down the interface before renaming it.  I'd think with a
disk partition unmounting it would be, at least, prudent?  Is it really
not necessary?
