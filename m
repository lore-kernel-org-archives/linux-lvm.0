Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3SIaX8p018385
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 14:36:33 -0400
Received: from smtp05.atlngahp.sys.nuvox.net (smtp-out5.atlngahp.sys.nuvox.net
	[70.43.63.23])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3SIZllg013785
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 14:35:47 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp05.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3SIZiR5014355
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 14:35:44 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 42279379B63
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 14:35:44 -0400 (EDT)
Message-ID: <48161900.4040701@Media-Brokers.com>
Date: Mon, 28 Apr 2008 14:35:44 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to move /usr from LVM back to non-LVM?
References: <4814E782.9080805@Media-Brokers.com>
	<4815553F.5030806@free.fr>	<4815FA96.1090302@Media-Brokers.com>
	<4816063A.1060200@free.fr>
In-Reply-To: <4816063A.1060200@free.fr>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 4/28/2008, Georges Giralt (georges.giralt@free.fr) wrote:
> The fisrt one,  small will be used for /boot
> The second one for everything else using LVM. 

Actually, I should have gone ahead and mention how I usually do it...

/boot (100MB)
/ (10GB - I know, but disks are cheap these days)
swap (1GB)
/tmp (1GB)

Then LVM for:

/home
/var

-- 

Best regards,

Charles
