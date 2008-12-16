Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBGCrQJU012491
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 07:53:26 -0500
Received: from mx03.syneticon.net (mx03.syneticon.net [87.79.32.166])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBGCrAV3031407
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 07:53:10 -0500
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by mx03.syneticon.net (Postfix) with ESMTP id 993F295A8
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 13:53:09 +0100 (CET)
Received: from mx03.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id mFW0qO7nb76i for <linux-lvm@redhat.com>;
	Tue, 16 Dec 2008 13:53:05 +0100 (CET)
Received: from [192.168.10.145] (koln-4db40287.pool.einsundeins.de
	[77.180.2.135]) by mx03.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 13:53:05 +0100 (CET)
Message-ID: <4947A4B0.3080409@wpkg.org>
Date: Tue, 16 Dec 2008 13:53:04 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] can I freeze I/O for some time to a given disk /
	md /	dm device?
References: <49479897.1080500@wpkg.org> <4947A098.5020703@redhat.com>
In-Reply-To: <4947A098.5020703@redhat.com>
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

Bryn M. Reeves schrieb:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Tomasz Chmielewski wrote:
>> Is it possible to "freeze I/O" for some time to a given disk / md / dm
>> device?
>>
>> Say, "freeze I/O" so that userspace waits for any response for 30, 60
>> seconds or more?
> 
> You can suspend/resume dm devices via the dmsetup command.

Exactly what I was looking for - thanks!


-- 
Tomasz Chmielewski
http://wpkg.org
