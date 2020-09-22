References: <4972578.pTZnC5dHRY@walnut>
	<CALm7yL3rOuRsc=Cvw4P9+o-1crU8B_9dDwgDiSwthhgBKuX5YQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <540a8738-e09d-b80d-ba1b-bd91b3d6c3d5@redhat.com>
Date: Tue, 22 Sep 2020 10:13:29 +0200
MIME-Version: 1.0
In-Reply-To: <CALm7yL3rOuRsc=Cvw4P9+o-1crU8B_9dDwgDiSwthhgBKuX5YQ@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why isn't issue_discards enabled by default?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Mark Mielke <mark.mielke@gmail.com>

Dne 21. 09. 20 v 16:26 Mark Mielke napsal(a):
> On Mon, Sep 21, 2020 at 10:14 AM nl6720 <nl6720@gmail.com 
> <mailto:nl6720@gmail.com>> wrote:
> 
>     I wanted to know why the "issue_discards" setting isn't enabled by
>     default. Are there any dangers in enabling it or if not is there a
>     chance of getting the default changed?
> 
>     Also it's not entirely clear to me if/how "issue_discards" affects thin
>     pool discard passdown.
> 
> 
> Historically, there have been dangers. Even today, there might still be 
> dangers - although, I believe Linux (and other OS) may disable the feature in 
> hardware which is known to behave improperly.
> 
> If you do research and ensure you are using a good storage drive, there should 
> not be any problems. I enable issue_discards on all systems I work with at 
> home and work, and have not encountered any problems. But, I also don't buy 
> cheap drives with questionable namebrands.
> 
> It's pretty common for settings such as these to be more conservative, to 
> ensure that the users who are willing to accept the risk (no matter how small) 
> can turn it on as an option, and the users who are unaware or might not have 
> evaluated the risk, cannot blame the software vendors for losing their data. 
> In the case of LVM - it's not LVM's fault that some drives might lose your 
> data when discard is sent. But, users of LVM might blame LVM.

Hi

So let's repeat again -  issue_discards  has nothing to do with discard 
handling of the LV itself.

If the LV is sitting on top of SSD - it will receive discard/TRIM no matter
what is set in this issue_discard setting - it could be  0 or 1 and LV will be 
discarded.

Anyone can very easily try - create some small simple LV on top SSD - or 
thinLV then create i.e.  mkfs.ext4 and use 'fstrim -v'.
With discardable device you will get nice print about discarded region -
then play with issue_discards setting - there will be no change...

Setting issue_discards only matters when you run 'lvremove' and your VG is
maybe on some 'provisioned' storage and you pay for used space - in this case 
released extents in VG will receive TRIM - so VG will eat less physical
space on such storage.

So keeping this setting 0 is perfectly fine and allows users to revert many 
lvm2 operation if they've made a mistake.

When setting is 1 - most of lvm2 commands have NO way back - once done, all 
data is gove - which can be quite fatal if you have i.e. very similar LV names...

No distribution should be setting issue_discards to '1' by default - it should 
be always changed by admin so he is aware of consequences.

Regards

Zdenek
