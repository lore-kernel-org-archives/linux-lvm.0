References: <4f9b8bba-d219-fca3-3b48-41e732044021@suse.com>
	<1ffc3903-4d55-ee1e-c58c-6fd3ea723856@redhat.com>
From: Eric Ren <zren@suse.com>
Message-ID: <7bff98df-3de3-3291-8bdf-81e84cbe8a7a@suse.com>
Date: Fri, 10 Mar 2017 09:39:56 +0800
MIME-Version: 1.0
In-Reply-To: <1ffc3903-4d55-ee1e-c58c-6fd3ea723856@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] is it right to specify '-l' with all the free PE in
 VG when creating a thin pool?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

On 03/09/2017 07:46 PM, Zdenek Kabelac wrote:
> [snip]
>>
>> while it works when specifying '-l' this way:
>>
>> # lvcreate -l 100%FREE --thinpool thinpool0 vgtest
>>   Logical volume "thinpool0" created.
>>
>> Is this something by design? or something may be wrong?
>> I can replicate this on both:
>
> Hi
>
> Yes this is by DESIGN
>
> When you specify '-l|-L'  you specify size of 'dataLV'  (logical size)
> But then you need some more space for 'metadata' LVs (_tmeta & _pmspare)
>
> -l100%FREE figure this automagically and reduces size a bit to fit in metadata LV.
>
>
> Some 'future' version of lvm2 may support something like '--physicalsize' which will be 'a 
> total size used for every allocation made by command).
Hi Zdenek,

Thanks a lot for your clarification!

Looks some changes to thin-pool feature make it behave differently since a certain version.
It worked on lvm2-2.02.98 (sles12) by specifying '-l' with all the free PE. Anyway, '-l 
100%FREE'
looks more reasonable in such case:)

Regards,
Eric
>
>
> Regards
>
> Zdenek
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
