Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3P9sB8O022580
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2016 05:54:11 -0400
References: <5714EE58.8080400@assyoma.it>
	<dede65b769d68f0988811f89fb10fdcb@assyoma.it>
	<571A2F6C.6050006@redhat.com> <571B350F.9050708@assyoma.it>
	<c01a4d679e96185c56352648cb6159fc@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <571DE943.40204@redhat.com>
Date: Mon, 25 Apr 2016 11:54:11 +0200
MIME-Version: 1.0
In-Reply-To: <c01a4d679e96185c56352648cb6159fc@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Testing ThinLVM metadata exhaustion
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
To: linux-lvm@redhat.com

On 25.4.2016 10:59, Gionatan Danti wrote:
> Il 23-04-2016 10:40 Gionatan Danti ha scritto:
>> On 22/04/2016 16:04, Zdenek Kabelac wrote:
>>>
>>>
>>> I assume you miss newer kernel.
>>> There was originally this bug.
>>>
>>> Regards
>>>
>>> Zdenek
>>
>> Hi Zdenek,
>> I am running CentOS 6.7 fully patched, kernel version
>> 2.6.32-573.22.1.el6.x86_64
>>
>> Should I open a BZ report for it is RH aware of the problem on RH/CentOS 6.7?
>>
>> Thanks.
>
> Hi,
> sorry for the bump, by I really like to understand if current RHEL6 and RHEL7
> kernels are affected by this serious bug and, if it is the case, if Red Hat is
> aware of that.
>
> I understand this is not the better place to ask about a specific
> distribution, but I see many RedHat peoples here ;)
>
> If this really is the wrong place, can someone point me to the right one (RH
> Bugzilla?).
> Thanks.
>

bugzilla.redhat.com

Anyway - 6.8 will likely be your solution.

Thin-provisioning is NOT supposed to be used at 'corner' cases - we improve 
them, but older version simply had more of them as there was always clearly 
communicated do not over-provision if you can't provide the space.

Out-of-space  is not equal if you run out of your filesystem space - you can't 
expect things will continue to work nicely - the cooperation of block layer 
with filesystem and metadata resilience are continually improved.

We have actually even seen users 'targeting' to hit full-pool as a part of 
regular work-flow - bad bad plan...

Regards

Zdenek
