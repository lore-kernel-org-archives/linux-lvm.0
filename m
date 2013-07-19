Message-ID: <51E9BD58.4030301@gmail.com>
Date: Sat, 20 Jul 2013 01:27:36 +0300
From: Martin Papik <mp6058@gmail.com>
MIME-Version: 1.0
References: <51E981EF.3020007@gmail.com> <51E99A85.8060901@redhat.com>
In-Reply-To: <51E99A85.8060901@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvmove
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dear Zdenek

Thank you very much, it works. I noticed a few more things. Not errors, 
just minor things that might be documented better or handled 
differently. Depending on the design philosophy.

"pvmove /dev/md127:152064-152319 /dev/md127:800000 --alloc anywhere" 
fails because /dev/md127:xx seems to be interpreted as "one extent 
starting at xx", I'm not sure that's what I'd guess from the man page.

"pvmove /dev/md127:152064-152319 /dev/md127:800000- --alloc anywhere" 
works, but the manual page indicates that the syntax is 
DestinationPhysicalVolume[:PE[-PE]...], which I would interpret as 
/dev/xx:111 OR /dev/xx:111-222, but not /dev/xx:111-, that would IMHO be 
DestinationPhysicalVolume[:PE[-[PE]]...].

I'd interpret /dev/md126:100 as a start of an area, since it has no 
explicit bound, where as /dev/md127:100-100 I would expect for a single 
extent, since there is an explicit bound. Does that make sense?

PS, how about a syntax variant where it can be /dev/md127:100+30 meaning 
30 extents starting at 100? I understand it's often better to print 
ranges, but maybe in some cases start+length might work better. Or 
start-end+length for printing, and start[-end][+length] as input, and 
exit with error if both end and length are specified and they don't 
match (start+length!=length).

I'm not complaining, just suggesting enhancements. :-)

Again, thank you very much for your quick and helpful response.

Martin

On 07/19/2013 10:59 PM, Zdenek Kabelac wrote:
> Dne 19.7.2013 20:14, Martin Papik napsal(a):
>> Hi everyone
>>
>> I'm new to the mailing list but not to LVM, until now everything was 
>> crystal
>> clear and working fine. Now I'm either stuck or found a minor issue. I'm
>> trying to move move extents on a physical volume. Not from one 
>> physical volume
>> to another.
>>
>> root@myhost# pvmove  /dev/md127:151808-152063 /dev/md127:152064-152319
>>    No extents available for allocation
>> root@myhost#
>
> Add  --alloc anywhere
>
> But I assume the tool could be a bit more smarter here.
> It looks more or less like a bug to me.
>
> Zdenek
>
