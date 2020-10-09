Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D8FE2166B28
	for <linux-lvm@redhat.com>; Fri,  9 Oct 2020 21:21:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CFA0811E79
	for <linux-lvm@redhat.com>; Fri,  9 Oct 2020 21:21:48 +0000 (UTC)
Date: Fri, 9 Oct 2020 16:15:55 -0500 (EST)
From: Duncan Townsend <duncancmt@duncancmt.com>
In-Reply-To: <CAODnkUAeUVROzFe3M3=FQqncg=mzu6SEey8rBh_CF2Z-8kOp5w@mail.gmail.com>
Message-ID: <nycvar.YAK.7.78.906.2010091605400.3372@mail.duncancmt.com>
References: <CAODnkUDhzOudB_5C+esDfLp+SAm6fa9bZ+ZLFwW4ep0eG0a6Fg@mail.gmail.com>
	<73d0ffcd-4ed5-38b1-0d17-a4b16c7863d6@redhat.com>
	<CAODnkUCkbfvyq8mUpK1OEx5C1jgfmjyYauHzjcA12aGnY6kLGA@mail.gmail.com>
	<c675a85e-9739-cda9-5588-654337783182@redhat.com>
	<CAODnkUDFLBsbhCOHcqza=mDagOR7HQ1GVCoVGr2pfM6v2h3wjQ@mail.gmail.com>
	<a5d9f6e1-ae4e-845f-f1d2-a119959b6548@redhat.com>
	<CAODnkUDWBtOUkwOKSpqjh2Jguc9K9+KQfnK_w7j=EVXKgOfuVQ@mail.gmail.com>
	<f09e1927-e44c-a1c6-757f-ffe1c0e6a0d5@redhat.com>
	<CAODnkUCc6r5kphRs27PE6azH-bDni+pTC02bN5XBhwRcY7+c5A@mail.gmail.com>
	<CAODnkUDFj8CB4UwquYmGkdG2O9E+uge-E6SFqu7=htOVECNShA@mail.gmail.com>
	<d572fdec-c2f1-b02a-7697-45ce932f9220@redhat.com>
	<CAODnkUDLbQ12itWB8OaOzbwhem8ozF+L4eq0z+=KhJX6fQ_=eQ@mail.gmail.com>
	<CAODnkUAeUVROzFe3M3=FQqncg=mzu6SEey8rBh_CF2Z-8kOp5w@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] thin: pool target too small
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
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2 Oct 2020, Duncan Townsend wrote:

> On Wed, Sep 30, 2020, 1:00 PM Duncan Townsend <duncancmt@gmail.com> wrote:
>
>> On Tue, Sep 29, 2020, 10:54 AM Zdenek Kabelac <zkabelac@redhat.com> wrote:
>>
>>> Dne 29. 09. 20 v 16:33 Duncan Townsend napsal(a):
>>>
>>> So the lvm2 has been fixed upstream to report more educative messages to
>>> the user - although it still does require some experience in managing
>>> thin-pool kernel metadata and lvm2 metadata.
>>>
>>
>> That's good news! However, I believe I lack the requisite experience. Is
>> there some documentation that I ought to read as a starting point? Or is it
>> best to just read the source?
>>
>>> In your case - dmeventd did 'unlocked' resize - while other command
>>> was taking a snapshot - and it happened the sequence with 'snapshot' has
>>> won - so until the reload of thin-pool - lvm2 has not spotted difference.
>>> (which is simply a bad race cause due to badly working locking on your
>>> system)
>>>
>>
>> After reading more about lvm locking, it looks like the original issue
>> might have been that the locking directory lives on a lv instead of on a
>> non-lvm-managed block device. (Although, the locking directory is on a
>> different vg on a different pv from the one that had the error.)
>>
>> Is there a way to make dmeventd (or any other lvm program) abort if this
>> locking fails? Should I switch to using a clustered locking daemon (even
>> though I have only the single, non-virtualized host)?
>>
>>> You will need to vgcfgrestore - but I think you've misused my passed
>>> recoverd
>>> piece, where I've specifically asked to only replace specific segments of
>>> resized thin-pool within your latest VG metadata - since those likely have
>>> all the proper mappings to thin LVs.
>>>
>>
>> All I did was use vgcfgrestore to apply the metadata file attached to your
>> previous private email. I had to edit the transaction number, as I noted
>> previously. That was a single line change. Was that the wrong thing to do?
>> I lack the experience with lvm/thin metadata, so I am flying a bit blind
>> here. I apologize if I've made things worse.
>>
>> While you have taken the metadata from 'resize' moment - you've lost all
>>> the thinLV lvm2 metadata for later created one.
>>>
>>> I'll try to make one for you.
>>>
>>
>> Thank you very much. I am extremely grateful that you've helped me so much
>> in repairing my system.
>>
>>> Well - lvm2 is glibc oriented project - so users of those 'esoteric'
>>> distribution need to be expert on its own.
>>>
>>> If you can provide coredump or even better patch for crash - we might
>>> replace the code with something better usable - but there is zero testing
>>> with anything else then glibc...
>>>
>>
>> Noted. I believe I'll be switching to glibc because there are a number of
>> other packages that are broken for this distro.
>>
>> If you have an interest, this is the issue I've opened with my distro
>> about the crash: https://github.com/void-linux/void-packages/issues/25125
>> . I despair that this will receive much attention, given that not even gdb
>> works properly.
>>
>
> Hello! Could somebody advise whether restoring the VG metadata is likely to
> cause this system's condition to worsen? At this point, all I want is to do
> is get the data off this drive and then start over with something more
> stable.

I believe I have repaired my system to the point of usability. I ended up 
editing *JUST* the transaction number in the metadata backup from before 
the snapshot creation that brought the system down. Restoring that VG 
metadata backup enabled me to activate my thin pool and LVs. After booting 
the system and inspecting further, I discovered that the locking directory 
for dmeventd was *NOT* mounted on a thin LV as a stated earlier, but was 
instead mounted on a tmpfs. As Zdenek hinted that the root cause of my 
original problem may have been a failure of local, file-based locking, my 
conclusion is that I may have gotten unlucky with the timing of the 
delivery of a SIGTERM from my broken runit script. I'm happy to be shown 
to be wrong about that conclusion, but it's the best I can draw given the 
information available to me.

The follow-on problem appears to have been a metadata mismatch on the 
transaction ID, which was effectively repaired by the aforementioned 2nd 
metadata transaction ID editing and restoration.

I have now been able to boot my system and complete several full 
iterations of my backup script using thin LV snapshotting. There were no 
problems. FWIW, I have been using this backup script as a cronjob for the 
last 8 years with minimal modification. I would be surprised to discover 
that there's something fundamental about the script that is erroneous.

Thanks again to Zdenek Kabelac for all the help. If there's any additional 
information I can provide to stop this from happening to anyone else in 
the future, I'm happy to assist. Otherwise, I'm going to consider this 
problem solved.

--Duncan Townsend
