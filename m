Date: Tue, 5 Oct 2010 14:44:10 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTim9VZQ2Ki4EDWnGAM3GbGz7CacmBf8y=2MnLhy3@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1010051439470.1511@bmsred.bmsi.com>
References: <AANLkTikNhZrMa91CCBC9MSLfyaWdO+1O=TGt_1bowwvf@mail.gmail.com>
	<4CAB14C9.7040707@redhat.com> <4CAB480A.8050906@cfl.rr.com>
	<AANLkTim9VZQ2Ki4EDWnGAM3GbGz7CacmBf8y=2MnLhy3@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] moving an LVM as an ISO can be moved
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: sugupta@redhat.com

On Tue, 5 Oct 2010, Tapas Mishra wrote:

> You mean to say
> dd if=/some/iso of=/temp/location bs=1024
> similarly
> dd if=/dev/lvm/in/question of=/nfs/location/to/store bs=1024
> this type of thing.

Yes.

> And then boot from that.

Not sure what you mean by "boot from that".  Since you are playing
with virtual machines, perhaps you mean something like:

losetup /dev/loop0 /nfs/location/to/store
... pass /dev/loop0 to a Virtual machine
(likely to be slow - you probably want a SAN instead)

Or perhaps you mean that "location/to/store" is an LV on another host,
and the other host will boot a virtual machine from store.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
