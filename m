References: <6cfeccb2-b3f6-dbd0-f5b8-b5e79a25baf8@strike.wu.ac.at>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <bb7da243-13bd-cb2c-1e83-258a463af38d@redhat.com>
Date: Mon, 13 Nov 2017 15:51:21 +0100
MIME-Version: 1.0
In-Reply-To: <6cfeccb2-b3f6-dbd0-f5b8-b5e79a25baf8@strike.wu.ac.at>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Alexander 'Leo' Bergolth <leo@strike.wu.ac.at>

Dne 13.11.2017 v 14:41 Alexander 'Leo' Bergolth napsal(a):
> Hi!
> 
> I have a EL7 desktop box with two sata harddisks and two ssds in a
> LVM raid1 - thin pool - cache configuration. (Just migrated to this
> setup a few weeks ago.)
> 
> After some days, individual processes start to block in disk wait.
> I don't know if the problem resides in the cache-, thin- or raid1-layer
> but the underlying block-devices are fully responsive.
> 
> I have prepared some info at:
>    http://leo.kloburg.at/tmp/lvm-blocks/
> 
> Do the stack backtraces provide enough information to locate the source
> of the blocks?
> 
> I'd be happy to provide additional info, if necessary.
> Meanwhile I'll disable the LVM cache layer to eliminate this potential
> candidate.
> 

Hi


It would be probably nice to see the result of 'dmsetup status'

I'd have guessed you are probably hitting  'frozen' raid state
which is unfortunate existing upstream bug.


Regards


Zdenek
