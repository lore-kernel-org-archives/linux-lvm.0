References: <6cfeccb2-b3f6-dbd0-f5b8-b5e79a25baf8@strike.wu.ac.at>
	<bb7da243-13bd-cb2c-1e83-258a463af38d@redhat.com>
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
Message-ID: <64e349d5-51b1-4704-8c2d-ac038929d7e4@strike.wu.ac.at>
Date: Thu, 16 Nov 2017 12:02:58 +0100
MIME-Version: 1.0
In-Reply-To: <bb7da243-13bd-cb2c-1e83-258a463af38d@redhat.com>
Content-Language: de-AT
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
Content-Type: text/plain; charset="us-ascii"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 2017-11-13 15:51, Zdenek Kabelac wrote:
> Dne 13.11.2017 v 14:41 Alexander 'Leo' Bergolth napsal(a):
>> I have a EL7 desktop box with two sata harddisks and two ssds in a
>> LVM raid1 - thin pool - cache configuration. (Just migrated to this
>> setup a few weeks ago.)
>>
>> After some days, individual processes start to block in disk wait.
>> I don't know if the problem resides in the cache-, thin- or raid1-layer
>> but the underlying block-devices are fully responsive.
>>
> It would be probably nice to see the result of 'dmsetup status'
> 
> I'd have guessed you are probably hitting  'frozen' raid state
> which is unfortunate existing upstream bug.

As it just happened again, I have collected some additional info like
dmsetup status
dmsetup info -c (do the event counts look suspicious?)

https://leo.kloburg.at/tmp/lvm-blocks/2017-11-16/

I don't see any volume in "frozen" state.

I haven't rebooted the box yet. Maybe I provide some more info?

Cheers,
--leo
-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
