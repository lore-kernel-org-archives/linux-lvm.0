Message-ID: <4C19DB6C.2030905@redhat.com>
Date: Thu, 17 Jun 2010 10:23:08 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4C179B03.2000102@cfl.rr.com>	<20100615164709.GG15698@agk-dp.fab.redhat.com>	<4C17BC76.7090506@cfl.rr.com>	<4C17D1BF.9010103@redhat.com>	<4C17E16B.8000708@cfl.rr.com>	<4C17E56D.5010808@redhat.com>
	<4C181C07.9080001@cfl.rr.com> <4C18999F.9000903@redhat.com>
	<4C19259F.2040706@redhat.com>
In-Reply-To: <4C19259F.2040706@redhat.com>
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
To: Takahiro Yasui <tyasui@redhat.com>
Cc: linux-lvm@redhat.com

Dne 16.6.2010 21:27, Takahiro Yasui napsal(a):
> On 06/16/10 05:30, Zdenek Kabelac wrote:
>> Dne 16.6.2010 02:34, Phillip Susi napsal(a):
>>> On 06/15/2010 04:41 PM, Takahiro Yasui wrote:
> ...
>>> What if I don't want ANY devices to be scanned every time an lvm command
>>> is run?  Shouldn't they be scanned once when udev first detects they
>>> have been attached, and no more?  I thought removing /dev from the scan=
>>> line would do that, but it didn't.
>>>
>>
>> I'd have say - this is work-in-progress for now - yes, udev should handle all
>> this for lvm - but we are not yet there...
> 
> Hi Zdenek,
> 
> Sorry I passed over your post.
> 
> May I ask you how you are going to handle this issue by udev? The problem
> is *not* a scan of devices to update dev-cache but a scan of devices to
> update lvm metadata cache in memory by lvm command. Currently lvm does
> not have a kind of metadata cache on a device (e.g. /etc/lvm) and lvm
> command has to get metadata information stored on each PV whenever it is
> executed.
> 
> It is helpful if udev can handle this issue, but I'm wondering how it can
> do it.

I'm not working on this part, but AFAIK, once we could start 'trust' udev, we
can keep persistent cache aware of any changes that might have happened to
devices listed in metadata. Implementation details are still 'moving topic'.

Obviously you can not skip write/update access to metadata areas, but it
should be possible to avoid scanning for 'read-only' data access.

Also there is another thing in progress - metadata-balance code - where you
essentially do not need to read/write metadata from/to every PV in VG - but
just on reasonable safe amount of them - i.e. 5 from 100 of PVs - the rest of
them is marked invisible (different from pvcreate --metadatasize 0)

Zdenek
