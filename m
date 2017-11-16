References: <6cfeccb2-b3f6-dbd0-f5b8-b5e79a25baf8@strike.wu.ac.at>
	<bb7da243-13bd-cb2c-1e83-258a463af38d@redhat.com>
	<64e349d5-51b1-4704-8c2d-ac038929d7e4@strike.wu.ac.at>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <4244902f-0dd8-ea1d-2bfe-5432bff473eb@redhat.com>
Date: Thu, 16 Nov 2017 12:47:42 +0100
MIME-Version: 1.0
In-Reply-To: <64e349d5-51b1-4704-8c2d-ac038929d7e4@strike.wu.ac.at>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM hangs
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
To: Alexander 'Leo' Bergolth <leo@strike.wu.ac.at>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 16.11.2017 v 12:02 Alexander 'Leo' Bergolth napsal(a):
> On 2017-11-13 15:51, Zdenek Kabelac wrote:
>> Dne 13.11.2017 v 14:41 Alexander 'Leo' Bergolth napsal(a):
>>> I have a EL7 desktop box with two sata harddisks and two ssds in a
>>> LVM raid1 - thin pool - cache configuration. (Just migrated to this
>>> setup a few weeks ago.)
>>>
>>> After some days, individual processes start to block in disk wait.
>>> I don't know if the problem resides in the cache-, thin- or raid1-layer
>>> but the underlying block-devices are fully responsive.
>>>
>> It would be probably nice to see the result of 'dmsetup status'
>>
>> I'd have guessed you are probably hitting  'frozen' raid state
>> which is unfortunate existing upstream bug.
> 
> As it just happened again, I have collected some additional info like
> dmsetup status
> dmsetup info -c (do the event counts look suspicious?)
> 
> https://leo.kloburg.at/tmp/lvm-blocks/2017-11-16/
> 
> I don't see any volume in "frozen" state.
> 
> I haven't rebooted the box yet. Maybe I provide some more info?
> 


 From the plain look over those file - it doesn't even seem there is anything 
wrong with dm devices as such.

So it looks like  possibly XFS got into some unhappy moment.

I'd probably recommend to open regular  Bugzilla case  and attach files from 
your directory.

You can try if individual devices in the  'stack' are blocked.

i.e. try 'dd' read from every 'dm'  if there is something blocked.


 From status all device looks fully operational and also process stack trace 
do look reasonable idle.


I'm not sure how 'afs' is involved here - can you reproduce without afs ?


Zdenek
