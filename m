References: <bc1ccc58-1771-183b-2d40-1d8b198fb8b5@suse.com>
	<20180109160622.GB24472@redhat.com>
From: Eric Ren <zren@suse.com>
Message-ID: <0c7ad5f6-0399-e890-0205-281c0b9b9405@suse.com>
Date: Wed, 10 Jan 2018 15:11:24 +0800
MIME-Version: 1.0
In-Reply-To: <20180109160622.GB24472@redhat.com>
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
Subject: Re: [linux-lvm] The benefits of lvmlockd over clvmd?
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi David,

Thanks for your explanations!

On 01/10/2018 12:06 AM, David Teigland wrote:
> On Tue, Jan 09, 2018 at 11:15:24AM +0800, Eric Ren wrote:
>> Hi David,
>>
>> Regarding the question of the subject, I can think of three main benefit=
s of
>> lvmlockd over clvmd:
>>
>> - lvmlockd supports two cluster locking plugins: dlm and sanlock. sanlock
>> plugin can supports up to ~2000 nodes
>> that benefits LVM usage in big virtulizaton/storage cluster,
> True, although it's never been tried anywhere near that many.  The main
> point hiding behind the big number is that hosts are pretty much unaware
> of each other, so adding more doesn't have any affect, and when something
> happens to one, others are unaffected because they are unaware.

The comments above is only talking about lvmlockd with sanlock, and it's
because the different protocols/algorithms used by them: sanlock with Paxos,
dlm with corosync, right?

>
>> while dlm plugin fits HA clsuter.
>>
>> - lvmlockd has better design than clvmd. clvmd is command-line level bas=
ed
>> locking system, which means the
>>  =C2=A0whole LVM software will get hang if any LVM command gets dead-loc=
king
>> issue. However, lvmlockd is *resources* based
>> cluster locking. The resources to protect is VG and LV so that the deadl=
ock
>> issue will be isolated inside the resource and
>> operations on other VG/LV can still proceed.

Is this point roughly true?

>>
>> - lvmlockd can work with lvmetad.
>>
>> But, I may be wrong in some points. Could you please help correct me and
>> complete the benefit list?
> To me the biggest benefit is the design and internal implementation, which
> I admit don't make for great marketing.  The design in general follows the
> idea described above, in which hosts fundamentally operate unaware of

Sorry, "the idea described above" by me?

> others and one host never has any effect on another.  That's diametrically

For example, with clvmd the command "lvchange -ay VG/LV" will try to=20
activate the LV
on every hosts, but with lvmlockd, we need to perform "lvchange -asy" on=20
each host :)

> opposite to the original clvm "single system image" design in which
> everything that happens is in theory meant to be happening everywhere.

Got it. Thanks again.

Regards,
Eric
