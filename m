References: <C28D2468-1843-4019-A503-E566A305977D@mac.com>
	<d23b94a7-b5c5-4ee2-51c7-7dfa06cca3d2@redhat.com>
	<42E7ED35-B32E-4C02-976A-7A9E5380EEA8@mac.com>
	<bb529703-849c-93ff-f40c-1de8a6f49ce6@redhat.com>
	<c1d08569-dbaf-fffc-c3e5-dfe47513fa03@redhat.com>
	<c8762bcf-4db5-973e-e5d2-4683e4076351@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56cdaa13-a10a-a545-3cb6-cb454330df3f@redhat.com>
Date: Thu, 14 Sep 2017 13:13:41 +0200
MIME-Version: 1.0
In-Reply-To: <c8762bcf-4db5-973e-e5d2-4683e4076351@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Dale Stephenson <dalestephenson@mac.com>

Dne 14.9.2017 v 12:57 Gionatan Danti napsal(a):
> On 14/09/2017 11:37, Zdenek Kabelac wrote:
>> Sorry my typo here - is NOT ;)
>>
>>
>> Zdenek
> 
> Hi Zdenek,
> as the only variable is the LVM volume type (fat/thick vs thin), why the thin 
> volume is slower than the thick one?
> 
> I mean: all other things being equal, what is holding back the thin volume?



So few more question:

What is '/dev/sdb4'  ? - is it also some fast SSD ?

([thinpool_tmeta] volgr0 ewi-ao----  16.00g  1     0  /dev/sdb4:0-4095
  - just checking to be sure your metadata device is not placed on rotational 
storage device)...

What is your thin-pool chunk size - is it 64K ?
- if your raise thin-pool chunk size up - is it getting any better ?


Regards

Zdenek
