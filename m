References: <574CB690.5030401@partidopirata.com.ar>
	<dc632a53-2e8a-651e-5c95-fcf467d6628d@redhat.com>
	<574D8EE6.8020903@partidopirata.com.ar>
	<fadf6004-73b7-ebd6-035f-9167764ff7a8@redhat.com>
	<5750371C.2070201@partidopirata.com.ar>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <603e0110-8de8-3c03-bf93-db0c19c2d4e0@redhat.com>
Date: Thu, 2 Jun 2016 16:50:55 +0200
MIME-Version: 1.0
In-Reply-To: <5750371C.2070201@partidopirata.com.ar>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [dm-crypt] LVM on LUKS: volumes missing
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
To: linux-lvm@redhat.com, fauno@partidopirata.com.ar

Dne 2.6.2016 v 15:39 fauno napsal(a):
> On 02/06/16 10:22, Ondrej Kozina wrote:
>
>> This is very strange pvscan -vvvv output. Reading upstream lvm2 code, it
>> doesn't make much sense to me. Most notably I can't see full error path.
>> Could it be that pvscan -vvvv output was cut off somehow?
>>
>> Regards
>> O.
>
> that's exactly as it was printed
>

Hi

This was not a full lvm2 -vvvv trace output - unless you would be using
a modified lvm2 source code base.

'pvscan -vvvv --cache device  &>out'


Also please provide full lvm2 package version eventually reference to package
with sources (and extra patches) (link).

Regards


Zdenek
