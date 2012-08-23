Received: from [10.11.8.136] (vpn-8-136.rdu.redhat.com [10.11.8.136])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7NG7Asi028107
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 12:07:10 -0400
Mime-Version: 1.0 (Apple Message framework v1084)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <50363C6D.7090104@zipman.it>
Date: Thu, 23 Aug 2012 11:08:35 -0500
Message-Id: <318A0630-03D5-4B29-BBDC-23F0444A50B8@redhat.com>
References: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
	<CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
	<50363C6D.7090104@zipman.it>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvextend NEVER works but screws up
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


On Aug 23, 2012, at 9:21 AM, flavio-redhat@zipman.it wrote:

> On 08/23/2012 01:14 PM, tariq wali wrote:
>> I wanted to use the free 42.7 G and allocate it to /bin-logs so this is
>> what I ran in order to extended
>> 
>> # lvextend -L +42.7G -n /dev/vg0/logs
>>  Rounding up size to full physical extent 42.70 GB
>>  Extending logical volume logs to 142.70 GB
>>  Logical volume logs successfully resized
>> 
>> #resize2fs /dev/vg0/logs    ( and it gets screwed up here )
>> resize2fs 1.39 (29-May-2006)
>> *resize2fs: Filesystem has unsupported feature(s) while trying to open
>> /dev/vg0/logs*
>> *Couldn't find valid filesystem superblock.*
> 
> This problem seems to be with your filesystem tools, not with LVM. If I
> were you I'd create a new LV, make a new filesystem, move all the files
> on the new LV, mount it, remove the OLD LV and then extend the new LV.

It does seem to be with the filesystem tools at first glance.  Presumably, the file system is still usable after you've resized the LV?  IOW, after 'lvextend' has resized the LV your (still small) file system should be usable.  If it is still usable at that point (try unmounting and mounting to ensure superblock is still in place), then you know the 'resize2fs' isn't working right.

 brassow
