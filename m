MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1010051439470.1511@bmsred.bmsi.com>
References: <AANLkTikNhZrMa91CCBC9MSLfyaWdO+1O=TGt_1bowwvf@mail.gmail.com>
	<4CAB14C9.7040707@redhat.com> <4CAB480A.8050906@cfl.rr.com>
	<AANLkTim9VZQ2Ki4EDWnGAM3GbGz7CacmBf8y=2MnLhy3@mail.gmail.com>
	<Pine.LNX.4.64.1010051439470.1511@bmsred.bmsi.com>
Date: Wed, 6 Oct 2010 00:53:14 +0530
Message-ID: <AANLkTi=qEQ31PqyXJBzLtNR04NrZ1exgk+pYYpOw=bo4@mail.gmail.com>
From: Tapas Mishra <mightydreams@gmail.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: sugupta@redhat.com

On Wed, Oct 6, 2010 at 12:14 AM, Stuart D. Gathman <stuart@bmsi.com> wrote:
>
> Not sure what you mean by "boot from that". =EF=BF=BDSince you are playing
> with virtual machines, perhaps you mean something like:
>
> losetup /dev/loop0 /nfs/location/to/store
> ... pass /dev/loop0 to a Virtual machine
Yes
> (likely to be slow - you probably want a SAN instead)
Hmm I do not have a SAN,
> Or perhaps you mean that "location/to/store" is an LV on another host,
> and the other host will boot a virtual machine from store.
>
