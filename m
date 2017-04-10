References: <CAC=a5kw1oa1w-6OmHe5tuVwtok_qd=tr26pYTk-FK-_+6zf2Zg@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5e89719c-2e67-fb6b-50c3-2e4a544a31af@redhat.com>
Date: Mon, 10 Apr 2017 12:54:25 +0200
MIME-Version: 1.0
In-Reply-To: <CAC=a5kw1oa1w-6OmHe5tuVwtok_qd=tr26pYTk-FK-_+6zf2Zg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] root: Failed query for merging percentage. Aborting
	merge
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
To: LVM general discussion and development <linux-lvm@redhat.com>, ttguy1@gmail.com

Dne 9.4.2017 v 09:17 Roger Morton napsal(a):
> I wanted to merge a old snap shot (root_snap10) of my root file system back
> into root.
>
>
>     LV          VG         Attr       LSize    Pool Origin Data%  Meta%  Move
> Log Cpy%Sync Convert
>   home_lv     kubuntu-vg rwi-aor--- 1000.00g
>  100.00
>   root        kubuntu-vg owi-aor---   50.00g
>  100.00
>   root_snap10 kubuntu-vg swi-a-s---   50.00g      root   28.42
>   root_snap14 kubuntu-vg swi-a-s---   50.00g      root   0.00
>

In genernal -


Once the merge IS started -  you see immediately 'the merged state' and  the
blocks are moved in background (they are moved back from COW to origin -
while you already see a device in 'merged-state').

While the merge IS happening you can't merge another LV.

So you need to wait till merge of snap10 is finished (0%).

>
> sudo lvcreate -s -n root_snap10b -L 50G /dev/kubuntu-vg/root
>   Snapshots of an origin that has a merging snapshot is not supported
>
> So the system still thinks   /dev/kubuntu-vg/root is in the middle of merging.
> Which worries me - my root file system might be in some half and half state
> between two different snapshots


As said there is never 'half and half state' - this would clearly never work 
;) you can't see  old & new data mixed at the same time.


Regards


Zdenek
