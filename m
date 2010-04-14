Message-ID: <4BC5D982.8030205@redhat.com>
Date: Wed, 14 Apr 2010 18:04:34 +0300
From: Avi Kivity <avi@redhat.com>
MIME-Version: 1.0
References: <4BC58DF3.608@redhat.com> <4BC5D58F.2030809@cfl.rr.com>
	<4BC5D83D.7040600@redhat.com>
In-Reply-To: <4BC5D83D.7040600@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Problems resizing physical volume
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
To: Phillip Susi <psusi@cfl.rr.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 04/14/2010 05:59 PM, Avi Kivity wrote:
>
>>>> [root@violet-regb ~]# pvmove /dev/sda2:4704-4765 /dev/sda2:4384-4445
>>>>    No extents available for allocation
>>> At this point I gave up.  Is there any way to accomplish this?
>> pvmove normally is used to move segments off the pv to other pvs in
>> order to free up that pv for removal.  So it is failing since it can not
>> find space on other disks, since you limited its search to specific
>> extents on the same disk.  You need to add --alloc anywhere to stop it
>> from excluding the current disk from its search.  The need for this is
>> kind of silly given that you explicitly tell it where to move to, it
>> should probably be assumed, but isn't.
>
> I'll try it out.  Thanks.
>

It worked, but only after I removed the destination extent specification.

-- 
error compiling committee.c: too many arguments to function
