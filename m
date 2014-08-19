Received: from dhcp80-224.msp.redhat.com (dhcp80-224.msp.redhat.com
	[10.15.80.224])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7JNf3js020517
	for <linux-lvm@redhat.com>; Tue, 19 Aug 2014 19:41:03 -0400
Mime-Version: 1.0 (Apple Message framework v1085)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <53E8BD5B.2070002@gmail.com>
Date: Tue, 19 Aug 2014 18:41:02 -0500
Message-Id: <26E8C1C4-3218-4F3A-876E-9257E234E350@redhat.com>
References: <53E65987.8010605@mglug.de> <53E8BD5B.2070002@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] what todo with broken cachedev?
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


On Aug 11, 2014, at 7:55 AM, Zdenek Kabelac wrote:

> Dne 9.8.2014 19:25, Oliver Rath napsal(a):
>> Hi list,
>> 
>> assuming a cached device mylv from /dev/sda1 with cachepool from
>> /dev/sdb1 (ssd i.e.):
>> 
>> If now the ssd crashes and the cachemode is "writethrough" i think,
>> there is no data loss for my lv's, right?
>> 
>> But then mylv runs without a cache device although the device is set in
>> metadata.
>> 
>> The command lvreduce cant remove the cache-attribut. vgreduce *could*
>> remove it, right? But only if there is no usage bei the cachepool-device
>> anymore.
>> 
>> Is there a solution for that?
> 
> 
> Cache support is still experimental - so please open bugzillas
> for your issues found on  bugzilla.redhat.com
> (if you are not using Fedora/RHEL - use Fedora Rawhide for your reports)
> 
> I assume your problem is likely related to still missing repair support
> for cached volumes.
> 
> You would need to use  cache utils  (cache_check, cache_repair, cache_dump...) to fix broken metadata.

Also, it would be nice when using "writethrough" to have the option of abandoning the cache - making it a normal LV again.  If there is no way to get the SSD back, there is probably no point in fixing.  Operation might have to be forced if "writeback".

 brassow
