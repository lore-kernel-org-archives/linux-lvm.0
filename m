Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2A9xlVG025689
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 05:59:47 -0400
Received: from a-eskwadraat.nl (a-eskwadraat.nl [131.211.39.72])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2A9xErZ023851
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 05:59:15 -0400
Received: from euclides.localdomain ([10.14.0.13])
	by a-eskwadraat.nl with esmtps (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <bas@tuxes.nl>) id 1JYemn-0005lB-7g
	for linux-lvm@redhat.com; Mon, 10 Mar 2008 10:59:13 +0100
Message-ID: <47D50670.7030006@tuxes.nl>
Date: Mon, 10 Mar 2008 10:59:12 +0100
From: Bas van Schaik <bas@tuxes.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Restore LVM snapshot without creating a full dump
	to an "external" device?
References: <47D45F39.4090502@tuxes.nl> <20080309233123.GA6688@racke.local>
In-Reply-To: <20080309233123.GA6688@racke.local>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Lars Ellenberg wrote:
> On Sun, Mar 09, 2008 at 11:05:45PM +0100, Bas van Schaik wrote:
>   
>> Hi all,
>>
>> When I started to use LVM snapshots, I presumed that it was easy to
>> restore a system to such a snapshot. As far as I can see now, this
>> presumption was incorrect... People on the internet write that I should
>> dump the whole snapshot using dd and then write it over the original
>> volume. This actually implies that I need another device with at least
>> the size of the original volume available to dump to. In my situation,
>> this means that I need about 2 TB free space to recover this snapshot!
>>
>> Isn't there a more sophisticated way to restore the snapshot than just
>> dumping it?
>>  1) create snapshot of /dev/myvolumegroup/myvolume to
>> /dev/myvolumegroup/mysnapshot
>>  2) dd if=/dev/myvolumegroup/mysnapshot of=/tmp/mysnapshot.dd
>>  3) lvremove /dev/myvolumegroup/mysnapshot
>>  4) dd if=/tmp/mysnapshot.dd of=/dev/myvolumegroup/myvolume
>>     
>
> you got (size-of-your-volume) free space in /tmp?
> pretty large /tmp, or pretty small volume, I guess.
>
>   
>> Something like:
>>  1) lvrevert /dev/myvolumegroup/mysnapshot /dev/myvolumegroup/myvolume
>>
>> I'd like to hear your thoughts on this, because I think it should be
>> fairly easy to restore a COW snapshot. Or am I wrong and missing something?
>>     
>
> you may want to investigate the status of
> http://fedoraproject.org/wiki/StatelessLinux/CachedClient
> were it says "The LVM and device-mapper code to allow merging is
> awaiting upstream review."
>   
Interesting project, interesting information, but it was last updated
2007-10-19. I'll try Googling for a more recent status, if that is
available...

> or you can try, at your own risk, the hack below.
>
> (... lots of excellent details ...)
Sounds very plausible, but there are some risks involved here ;). Thanks
anyhow, I'll really consider using your perl script when the situation
gets critical here...

  -- Bas
