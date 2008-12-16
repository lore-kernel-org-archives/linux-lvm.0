Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBGGKGXX000331
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 11:20:16 -0500
Received: from mx03.syneticon.net (mx03.syneticon.net [87.79.32.166])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id mBGGJRMw021931
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 11:19:28 -0500
Message-ID: <4947D509.6080005@wpkg.org>
Date: Tue, 16 Dec 2008 17:19:21 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
References: <49479897.1080500@wpkg.org>
	<20081216161312.GI18423@boogie.lpds.sztaki.hu>
In-Reply-To: <20081216161312.GI18423@boogie.lpds.sztaki.hu>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: can I freeze I/O for some time to a given disk / md
	/ dm	device?
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
To: Gabor Gombas <gombasg@sztaki.hu>
Cc: Linux-Raid <linux-raid@vger.kernel.org>, Linux IDE <linux-ide@vger.kernel.org>, LVM general discussion and development <linux-lvm@redhat.com>

Gabor Gombas schrieb:
> On Tue, Dec 16, 2008 at 01:01:27PM +0100, Tomasz Chmielewski wrote:
> 
>> Is it possible to "freeze I/O" for some time to a given disk / md / dm  
>> device?
>>
>> Say, "freeze I/O" so that userspace waits for any response for 30, 60  
>> seconds or more?
> 
> For real disks you can use /sys/block/sdX/device/unload_heads to achieve
> something similar (see Documentation/laptops/disk-shock-protection.txt
> in the kernel source about how to use it). That won't work for md/dm
> devices though.

Thanks, I think I have enough hints now.

Bryn M. Reeves on linux-lvm list suggested using dmsetup's 
suspend/resume, which seems to be the easiest way for this purpose 
(requires device mapper / LVM).


-- 
Tomasz Chmielewski
http://wpkg.org
