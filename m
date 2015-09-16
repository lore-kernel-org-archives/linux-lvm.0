References: <55F70C58.5010205@windriver.com> <55F8A3BB.2020408@windriver.com>
	<55F927FE.2040801@redhat.com> <55F98B17.8030504@windriver.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <55F9DD55.2050806@redhat.com>
Date: Wed, 16 Sep 2015 23:21:25 +0200
MIME-Version: 1.0
In-Reply-To: <55F98B17.8030504@windriver.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Any way to speed up activation of volumes with
	snapshots?
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
To: Chris Friesen <chris.friesen@windriver.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 16.9.2015 v 17:30 Chris Friesen napsal(a):
> On 09/16/2015 02:27 AM, Zdenek Kabelac wrote:
>> Dne 16.9.2015 v 01:03 Chris Friesen napsal(a):
>
>>> As a side question, currently we have a script which runs "vgchange -ay <vg>",
>>> which will activate the VG.
>>>
>>> This script appears to activate the LVs within the VG serially rather than in
>>> parallel.  Does it do any processing to determine in which order to activate
>>> the LVs?
>
>> What you can do with recent versions of lvm2 -  you could 'mark' (with lvchange
>> --setskipactivation) some LVs to be skipped from normal activation.
>> Then you could activate such skipped LVs with  'lvchange -ay -K'.
>>
>> As said lvm2 has not been designed for this case.
>> (btw during whole activation - your access to VG is actually limited only for
>> 'read-only')
>
> Right...we're planning on testing out thin provisioning but I have to figure
> out a band-aid solution for products already in use.
>
> Just to clarify...what does your "access to VG is actually limited only for
> 'read-only'" mean exactly?
>
> Does it mean:
>
> 1) I only have read-only access to the LVs within the VG until all LVs in the
> VG are activated?
>
> or
>
> 2) I only have readonly access to the VG (so I can't add/remove/modify LVs)
> but I have read/write access to the LVs within the VG.

2. is correct - you will not be able to modify VG content (as read-lock is 
held for VG - and you need write-lock for updates)

Zdenek
