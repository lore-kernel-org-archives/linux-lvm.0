Received: from dhcp80-224.msp.redhat.com (dhcp80-224.msp.redhat.com
	[10.15.80.224])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7JNYeZT018657
	for <linux-lvm@redhat.com>; Tue, 19 Aug 2014 19:34:41 -0400
Mime-Version: 1.0 (Apple Message framework v1085)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <53E64BB2.6020508@mglug.de>
Date: Tue, 19 Aug 2014 18:34:40 -0500
Message-Id: <0446AE87-805F-4C0A-BEBB-7930AAB36B8B@redhat.com>
References: <53E6259B.8090902@mglug.de> <53E64BB2.6020508@mglug.de>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] howto cache a thinpool-device?
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

If it was me, I would put the thinMetaLV directly on the fast device (because it is small) and I would cache the thinDataLV.

Remember that some of what you are doing is pretty cutting edge.  I wouldn't yet use caching + thin in production yet.

Also, consider making your thin devices redundant (if they are not already via backend storage).

 brassow


On Aug 9, 2014, at 11:26 AM, Oliver Rath wrote:

> Hi list,
> 
> what now worked:
> 
> - creating a cached data-lv
> - creating a non-cached meta-lv
> - converting data-lv to a thinpool-device with meta-lv as metadata
> 
> what not: doing the same thing with a cached meta-lv. Does this make sense?
> 
> Is the metadata already cached by lvm-logic? Do i have a cache thinpool
> (with non-cached metadata) with the used way?
> 
> Tfh!
> Oliver
> 
> 
> Am 09.08.2014 um 15:43 schrieb Oliver Rath:
>> Hi list,
>> 
>> Im playing around with the new cache options. Ive created a lvm-device
>> on my cache-disk named lvx-cache (vg is dmivg). Additionally Ive created
>> a thinpool-device named winthinpool.
>> 
>> Now i wanted to use my cache-device to cache my thinpool-lvm, but this
>> doesnt work:
>> 
>> ~# lvconvert --type cache --cachepool dmivg/lvx_cache dmivg/winthinpool
>>  Can't cache thin-pool volume dmivg/winthinpool.
>> 
>> isnt is possible to cache a thinpool-device?
>> 
>> Tfh!
>> Oliver
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
