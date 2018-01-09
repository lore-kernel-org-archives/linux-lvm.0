From: Eric Ren <zren@suse.com>
References: <f1be22d0-6bf3-e282-9692-92452f67122d@suse.com>
	<20180102171034.GC26695@redhat.com>
	<be5b9aa6-d9fb-2e45-d250-9736d1ae49a5@suse.com>
	<20180103150713.GA16217@redhat.com>
	<c4b0357d-2910-1c5f-7ffc-5cfbdecd4b11@suse.com>
Message-ID: <526766b0-c099-9c7c-9df7-4f48c23d2b24@suse.com>
Date: Tue, 9 Jan 2018 10:42:27 +0800
MIME-Version: 1.0
In-Reply-To: <c4b0357d-2910-1c5f-7ffc-5cfbdecd4b11@suse.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [linux-lvm] lvmlockd: about the limitation on lvresizing the LV
 active on multiple nodes
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>

Hi David,

On 01/04/2018 05:06 PM, Eric Ren wrote:
> David,
>
> On 01/03/2018 11:07 PM, David Teigland wrote:
>> On Wed, Jan 03, 2018 at 11:52:34AM +0800, Eric Ren wrote:
>>>> 1. one one node: lvextend --lockopt skip -L+1G VG/LV
>>>>
>>>>      That option doesn't exist, but illustrates the point that some 
>>>> new
>>>>      option could be used to skip the incompatible LV locking in 
>>>> lvmlockd.
>>> Hmm, is it safe to just skip the locking while the LV is active on 
>>> other
>>> node?
>>> Is there somewhere in the code to avoid concurrent lvm command to 
>>> execute
>>> at the same time?
>> The VG lock is still used to protect the VG metadata change. The LV lock
>> doesn't protect anything per se, it just represents that lvchange has
>> activated the LV on this host.  (The LV lock does not represent the
>> suspended/resumed state of the dm device either, as you suggested 
>> above.)
>
> I see, thanks for you explanation!
>> I'll send a simple patch to skip the lv lock to try this.
>
> I've tested your patch and it works very well.  Thanks very much.

Could you please consider to push this patch upstream? Also, Is this the 
same case
for pvmove as lvresize? If so, can we also work out a similar patch for 
pvmove?

Regards,
Eric
