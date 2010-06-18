Message-ID: <4C1B87C1.3090303@redhat.com>
Date: Fri, 18 Jun 2010 10:50:41 -0400
From: Takahiro Yasui <tyasui@redhat.com>
MIME-Version: 1.0
References: <4C179B03.2000102@cfl.rr.com>	<20100615164709.GG15698@agk-dp.fab.redhat.com>	<4C17BC76.7090506@cfl.rr.com>	<4C17D1BF.9010103@redhat.com>	<4C17E16B.8000708@cfl.rr.com>	<4C17E56D.5010808@redhat.com>
	<4C181C07.9080001@cfl.rr.com> <4C18999F.9000903@redhat.com>
	<4C19259F.2040706@redhat.com> <4C19DB6C.2030905@redhat.com>
	<4C1A28DE.4040605@redhat.com> <4C1B826B.1010200@redhat.com>
In-Reply-To: <4C1B826B.1010200@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why does every lvm command insist on touching every
 pv?
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: linux-lvm@redhat.com

On 06/18/10 10:27, Zdenek Kabelac wrote:
> Dne 17.6.2010 15:53, Takahiro Yasui napsal(a):
>> On 06/17/10 04:23, Zdenek Kabelac wrote:
>>> Dne 16.6.2010 21:27, Takahiro Yasui napsal(a):
>>>> On 06/16/10 05:30, Zdenek Kabelac wrote:
>>>>> Dne 16.6.2010 02:34, Phillip Susi napsal(a):
>>>>>> On 06/15/2010 04:41 PM, Takahiro Yasui wrote:
>>>> ...
>>>>>> What if I don't want ANY devices to be scanned every time an lvm command
>>>>>> is run?  Shouldn't they be scanned once when udev first detects they
>>>>>> have been attached, and no more?  I thought removing /dev from the scan=
>>>>>> line would do that, but it didn't.
>>>>>>
>> ...
>>>> It is helpful if udev can handle this issue, but I'm wondering how it can
>>>> do it.
>>>
>>> I'm not working on this part, but AFAIK, once we could start 'trust' udev, we
>>> can keep persistent cache aware of any changes that might have happened to
>>> devices listed in metadata. Implementation details are still 'moving topic'.
>>>
>>> Obviously you can not skip write/update access to metadata areas, but it
>>> should be possible to avoid scanning for 'read-only' data access.
>>
>> Thank you for your explanation. Yes, I agree that it is possible to avoid
>> scanning for 'read-only' data access, but I also believe it is possible for
>> 'write' adata access.
> 
> 
> With current LVM logic - you can't proceed with usage of LVM metadata unless
> they are properly committed to PVs.  i.e. there is no chance you could use
> partially stored metadata to just some cached devices. Either you update all
> metadata or you fail - there is nothing between these 2 states.

I agree with you comment in terms that every metadata stored on PVs in the
same VG which are being manipulated should be committed, but I don't think
metadata stored on PVs which belong to *different* VGs need to be committed.

For example, there are six PVs and two VGs as below:

  VG1: PV1, PV2, PV3
  VG2: PV4, PV5, PV6

If we create a new LV or delete VG1, then metadatas on only PV1, PV2, PV3
need to be updated but not for PV4, PV5, PV6.

>>> Also there is another thing in progress - metadata-balance code - where you
>>> essentially do not need to read/write metadata from/to every PV in VG - but
>>> just on reasonable safe amount of them - i.e. 5 from 100 of PVs - the rest of
>>> them is marked invisible (different from pvcreate --metadatasize 0)
>>
>> AFAIK, metadata-balance feature would reduce the number of disk accesses,
>> but I believe that the goal is to access PVs related to the VG which lvm
>> command is going to manipulate. Introducing metadata cache feature on disk
>> or a kind of daemon managing all metadatas, or using /etc/lvm/backup could
>> be solution.
>>
>> I hope we could continue discussing this topic on lvm-devel?
> 
> Sure. Daemon is also planned, but for reduction of write access metadata
> balancing should greatly help.  Another step here could be to parallelize all
> disk operations on different devices. Also udev handling has some perfomance
> optimalization still.
> 
> With properly working udev we shouldn't need to do any device scanning as we
> will have all 'interesting' devices stored in some cache storage - it could be
> file, daemon, udev DB entry....

I agree that these approach improve performance, but I don't think
accesses to devices which don't belong to a VG being handled are not
welcomed.

Thanks,
Taka
