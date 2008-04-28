Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3SHFsrx017170
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 13:15:54 -0400
Received: from smtp4-g19.free.fr (smtp4-g19.free.fr [212.27.42.30])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3SHFgBV008750
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 13:15:42 -0400
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 4F99C3EA213
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 19:15:41 +0200 (CEST)
Received: from [192.168.1.2] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 2324D3EA198
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 19:15:39 +0200 (CEST)
Message-ID: <4816063A.1060200@free.fr>
Date: Mon, 28 Apr 2008 19:15:38 +0200
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to move /usr from LVM back to non-LVM?
References: <4814E782.9080805@Media-Brokers.com> <4815553F.5030806@free.fr>
	<4815FA96.1090302@Media-Brokers.com>
In-Reply-To: <4815FA96.1090302@Media-Brokers.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Charles Marcus a �crit :
> On 4/28/2008, Georges Giralt (georges.giralt@free.fr) wrote:
>> But some people will question the reason you will move from LVM to 
>> plain filesystem/partitioning.... 
> 
> Good point... and maybe my reason is not a 'good one'... ;)
> 
> My thinking is, since /usr is a critical system partition, it should be 
> on the main system drive - which I always set up as a simple 2 drive 
> mirror.
> 
> So, I'm now curious how/what other people generally use LVM for?
> 
Just my 2 � here. I do not pretend to have the TRUTH ....
Said you've 2 identical drives for the system.
Set up  2 partitions onto them exactly the same.
The fisrt one,  small will be used for /boot
The second one for everything else using LVM.
Set up software raid to make a first mirror of the two /boot
and another one for the LVM.
This way, you can boot and run your machine from any disk and you can 
even do a backup by splitting the raid....
IT has always worked except on my home machine where I was unable to 
insatall a Fedora system using software mirror AND lvm ..; Go figure ;-)

-- 
Ce message est constitu� d'au moins 50 % d'�lectrons recycl�s.
S'il vous pla�t, aidez nous � conserver nos ressources,
recyclez vos �lectrons !
