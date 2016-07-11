Received: from deadbeef.usersys.redhat.com (dhcp130-190.brq.redhat.com
	[10.34.130.190])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6BCZHSn017823
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 11 Jul 2016 08:35:18 -0400
References: <c6001912-30cb-11a8-0481-4689718155cd@yahoo.co.uk>
	<e8765cf9-f990-1030-7ea8-fe4187d691b1@iki.fi>
	<81bdb891-3d03-f530-0016-181bcddd1384@yahoo.co.uk>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <80ed919c-052f-8699-307e-45fe5d9e8e1e@redhat.com>
Date: Mon, 11 Jul 2016 14:35:16 +0200
MIME-Version: 1.0
In-Reply-To: <81bdb891-3d03-f530-0016-181bcddd1384@yahoo.co.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvmove and filesystem - un/mount?
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

On 07/08/2016 11:03 AM, lejeczek wrote:
>
>
> On 07/07/16 19:10, Jarkko Oranen wrote:
>>
>>
>> On 07/07/16 19:01, lejeczek wrote:
>>> hi users,
>>>
>>> must be an easy one - what should be(is allowed to do) filesystem
>>> doing while there is a pvmove(failed hard disk) taking place in
>>> underlying LV?
>>>
>>> many thanks,
>>
>> Hi,
>>
>> pvmove is generally transparent to the layers above, so you can
>> continue using the system as usual while a pvmove is in progress.
>> While I have never seen pvmove actually fail (My desktop encountered a
>> power failure mid-operation once, and it just continued as if nothing
>> had happened after rebooting), with a failing hard disk, I would avoid
>> any additional IO while the operation is in progress.
>>
>>
> ok, thanks
> maybe a bit more tricky, would now downsizing a FS be one thing OK to
> do(probably also fsck) ? while pvmove is working?
> furthermore, would lvreduce be OK to take pvmote out of a LV ?
>
> I have a bit of puzzle type of situation here to deal with - started
> pvmove but seems that HDD is rather in a bad condition for after two
> days pvmove is barely at 4%.
> Should I let it finish - or - abort pvmove and try fsck; fsreduce;
> lvreduce..
> hmmm..

Use ddrescue. pvmove is not intended for data rescuing from failing disks.

ddrescue is using different strategy to quickly read whatever it can, 
quickly skipping over any failing regions, attempting to recover those 
on later iterations.

-- Martian



>
>>
>> --
>> Jarkko
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
