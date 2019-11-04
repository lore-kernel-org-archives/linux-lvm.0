From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 4 Nov 2019 18:28:23 +0100
Message-Id: <1F8EA03C-9EC5-4006-91A0-4588756F5698@gmail.com>
References: <992d73bd-259e-a89c-f34f-60388d9e1c5b@redhat.com>
In-Reply-To: <992d73bd-259e-a89c-f34f-60388d9e1c5b@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] exposing snapshot block device
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
Content-Type: text/plain; charset="utf-8"
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

thanks, I understand that meta data blocks needs to be update, that I can understand.
how about the other questions?
like : data write will happen towards which device? cow device or after the copying has been completed to the origin disk?


Skickat från min iPhone

> 4 nov. 2019 kl. 16:04 skrev Zdenek Kabelac <zkabelac@redhat.com>:
> 
> ﻿Dne 04. 11. 19 v 15:40 Tomas Dalebjörk napsal(a):
>> Thanks for feedback.
>> 
> 
>> Scenario 2: A write comes want to write block LP 100, but lvconvert has not yet copied that LP block (yes, I do understand that origin is hidden now)
>> Will lvconvery prioritize to copy data from /dev/vg00/lv00-snap to /dev/vg00/lv00 for that block, and let the requestor write the changes directly on the origin after the copying has been performed?
>> Or will the write be blocked until lvconvert has finished the copying of the requested block, and than a write can be accepted to the origin?
>> Or where will the changes be written?
> 
> Since the COW device contains not only 'data' but also 'metadata'  blocks
> and during the 'merge' it's being updated so it 'knows' which data has
> been already merged back to origin (in other words during the merge the usage of COW is being reduced towards 0)  - I assume your 'plan' stops right here
> and there is not much point to explore how much sub-optimal the rest of merging process is  (and as said - primary aspect was robustness - so if there is crash in any moment in time - data remain correct)
> 
> Regards
> 
> Zdenek
> 
