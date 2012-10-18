Message-ID: <508003F1.8090308@shiftmail.org>
Date: Thu, 18 Oct 2012 15:28:17 +0200
From: Spelic <spelic@shiftmail.org>
MIME-Version: 1.0
References: <CB12DB70-5C4F-4936-9EDE-BFF4096D064F@active.ee>
	<507FDA2E.8080301@redhat.com>
In-Reply-To: <507FDA2E.8080301@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] how to recover after thin pool metadata did fill up?
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
Cc: Andres Toomsalu <andres@active.ee>, Zdenek Kabelac <zkabelac@redhat.com>

On 10/18/12 12:30, Zdenek Kabelac wrote:
> Dne 17.10.2012 22:21, Andres Toomsalu napsal(a):
>> Hi,
>>
>> I'm aware that thin provisioning is not yet production ready (no 
>> metadata resize) - but is there a way to recover from thin pool 
>> failure when pool metadata was filled up?
>>
>>
>
>
> Unfortunately there is no 'easy' advice for now yet - you hit current 
> Achilles heel of thinp support in lvm2 - we are thinking how to make 
> recovery usable for user - but it's not easy task since many things 
> are making it very complex - so it still needs some month of work.
>

So, supposing one is aware of this problem beforehand, at pool creation
can this problem be worked around by using --poolmetadatasize  to make a 
metadata volume much larger than the default?

And if yes, do you have any advice on the metadata size we should use?

Thank you
