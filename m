Received: from redhat.com (astrea.boston.redhat.com [172.16.80.45])
	by mail.boston.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l1LHwgT8008919
	for <linux-lvm@redhat.com>; Wed, 21 Feb 2007 12:58:42 -0500
Message-ID: <45DC8852.9040807@redhat.com>
Date: Wed, 21 Feb 2007 12:58:42 -0500
From: James Parsons <jparsons@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM - History
References: <628454.24513.qm@web32913.mail.mud.yahoo.com>	<87f94c370702210853i643ef08co7667e9bf5e77f126@mail.gmail.com>
	<45DC80B3.6000001@free.fr>
In-Reply-To: <45DC80B3.6000001@free.fr>
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

Georges Giralt wrote:

> Greg Freemyer a �crit :
>
>> On 2/20/07, k <shikam@yahoo.com> wrote:
>>
>>> History of LVM
>>>
>>> I am researching about LVM, and looking for historical
>>> data, such as; how did it get started, who was
>>> involved, information about the functionality of the
>>> first release ( Was it supporting raid, Size
>>> restrictions, etc�), and any other historical data.
>>>
>>> I appreciate any suggestions you might have.
>>>
>>> Thanks!
>>> Shi kam
>>
>>
>> A key point was 3 years ago when Redhat bought Sistina.
>>
>> See http://www.open-mag.com/features/Vol_90/Sistina/Sistina.htm.
>>
>> Also see http://lwn.net/2000/0224/kernel.php3 for when it first got
>> into the vanilla kernel.
>>
>> Greg
>
> Hi !
> If you plan to learn who invented LVM, you have to know that IMHO IBM 
> was the first company to include LVM into it's Unix flavor called Aix.
> Later, HP bought a software license and implemented it into HP-UX with 
> modification. The HP version is quite similar as the one we have in 
> Linux.
> Also, I think Veritas software has/had a comercial LVM version to fit 
> the Veritas journaled file system. I don't know if this was devised 
> from IBM research or a new implementation.
> Sistina software inplemented LVM into the Linux Kernel by making 
> something looking like HP flavor of LVM. But due to PC hardware 
> anlimitations, the LVM on Linux still lacks the ability to boot from 
> an LVM root, lacks mirroring (well, true mirroring....) and things 
> like that...
> I'm not sure about the exact status of Linux LVM on other platforms 
> than PC hardware...
> Of course, I'm not an historian, and I do not pretend to know eery 
> Unix flavor on the planet (even if I've put my hands on some really 
> old/or arcane) so you'd better check with the cited companies to 
> correct me if I'm wrong...
> Regards

No discussion of LVM history should take place without mentioning Heinz 
Mauelshagen, who did some of the earliest LVM on Linux work. Thanks, lvmguy.

-J
