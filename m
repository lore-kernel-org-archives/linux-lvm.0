Message-ID: <52E281E1.2090604@redhat.com>
Date: Fri, 24 Jan 2014 16:08:17 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <87zjmxzmga.fsf@red.mvo.lan>, <87y5265106.fsf@red.mvo.lan>,
	<52E269A8.9090707@redhat.com> <87vbx94ep0.fsf@red.mvo.lan>
In-Reply-To: <87vbx94ep0.fsf@red.mvo.lan>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Identifying useable block devices
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
To: linux-lvm@redhat.com
Cc: marius.vollmer@redhat.com

On 01/24/2014 03:50 PM, Marius Vollmer wrote:
> Peter Rajnoha <prajnoha@redhat.com> writes:
> 
>> Thanks! Well, sorry for that, I've finally noticed the thing,
>> that was another bug, unfortunately. Should be solved now with
>> this git head in lvm2 upstream:
>>   89d77326170d020ebba6ae1c717c08ac4b07996a
>> (git.fedorahosted.org/git/lvm2.git)
>>
>> Thing is that the pool volume *should always* be marked
>> as private which also means DM_UDEV_DISABLE_OTHER_RULES_FLAG
>> is set.
> 
> Nice, thanks!
> 
> With this fixed, I have to ask again: Is _every_ situation where a block
> device goes from public to private with a "change" event a bug?
> 

Hmm, and if we can detect a device going from public to private, would
it be a problem to detect the other way round - a device going from
private to public? IMHO it would be exactly the same situation - just
in case it gets public, the device would be presented to any event
listeners again with all the context it currently has.

-- 
Peter
