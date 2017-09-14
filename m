References: <C28D2468-1843-4019-A503-E566A305977D@mac.com>
	<d23b94a7-b5c5-4ee2-51c7-7dfa06cca3d2@redhat.com>
	<42E7ED35-B32E-4C02-976A-7A9E5380EEA8@mac.com>
	<bb529703-849c-93ff-f40c-1de8a6f49ce6@redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c1d08569-dbaf-fffc-c3e5-dfe47513fa03@redhat.com>
Date: Thu, 14 Sep 2017 11:37:21 +0200
MIME-Version: 1.0
In-Reply-To: <bb529703-849c-93ff-f40c-1de8a6f49ce6@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Performance penalty for 4k requests on thin
	provisioned volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Dale Stephenson <dalestephenson@mac.com>

Dne 14.9.2017 v 11:00 Zdenek Kabelac napsal(a):
> Dne 14.9.2017 v 00:39 Dale Stephenson napsal(a):
>>
>>> On Sep 13, 2017, at 4:19 PM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
>>>
>>
>> md127 is an 8-drive RAID 0
>>
>> As you can see, there’s no lvm striping; I rely on the software RAID 
>> underneath for that.  Both thick and thin lvols are on the same PV.
>>>
>>> SSD typically do needs ideally write 512K chunks.
>>
>> I could create the md to use 512k chunks for RAID 0, but I wouldn’t expect 
>> that to have any impact on a single threaded test using 4k request size.  Is 
>> there a hidden relationship that I’m unaware of?
> 
> 
> Yep - it seems the setup in this case is the best fit.

Sorry my typo here - is NOT ;)


Zdenek
