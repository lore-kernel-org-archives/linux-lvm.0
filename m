Message-ID: <5202164B.5010302@redhat.com>
Date: Wed, 07 Aug 2013 11:41:31 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20130806173719.GB15184@mail.waldi.eu.org>
	<520211BB.2040301@pse-consulting.de>
In-Reply-To: <520211BB.2040301@pse-consulting.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Missing error handling in lv_snapshot_remove
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Andreas Pflug <pgadmin@pse-consulting.de>

Dne 7.8.2013 11:22, Andreas Pflug napsal(a):
> Am 06.08.13 19:37, schrieb Bastian Blank:
>> Hi
>>
>> I tried to tackle a particular bug that shows up in Debian for some time
>> now. Some blamed the udev rules and I still can't completely rule them
>> out. But this triggers a much worse bug in the error cleanup of the
>> snapshot remove. I reproduced this with Debian/Linux 3.2.46/LVM 2.02.99
>> without udevd running and Fedora 19/LVM 2.02.98-10.fc19.
>>
>> On snapshot removal, LVM first converts the device into a regular LV
>> (lv_remove_snapshot) and in a second step removes this LV
>> (lv_remove_single). Is there a reason for this two step removal? An
>> error during removal leaves a non-snapshot LV behind.
> Ah, this explains why sometimes my backup stops: I take a snapshot,
> rsync the stuff and remove the snapshot with a daily cron job, but I
> observed twice that a non-snapshot volume named like a backup snapshot
> was lingering around, preventing the script to work. So this is no
> exotic corner case, but happens in real life.
>
> I observe this since I dist-upgraded to wheezy.
>

Because Debian is using non-upstream udev rules.

With upstream udev rules with standard real-life use, this situation
cannot happen - since these rules are constructed to play better with
udev WATCH rule.

Zdenek
