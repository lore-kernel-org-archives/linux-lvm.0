References: <5CDD277F020000F90006616F@prv1-mh.provo.novell.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <bb83e565-f831-9bf3-a077-cbef40ea4338@redhat.com>
Date: Thu, 16 May 2019 12:55:14 +0200
MIME-Version: 1.0
In-Reply-To: <5CDD277F020000F90006616F@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] "lvconvert --mirrors 1 --stripes 3 vgtest/lvtest"
 command succeeds, but no stripes
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <ghe@suse.com>

Dne 16. 05. 19 v 11:03 Gang He napsal(a):
> Hello Guys,
> 
> I found lvconvert command (in lvm lvm2-2.02.120) did not handle "--stripes" option correctly.
> The reproduce steps are as below,
> # vgcreate vgtest /dev/vdb /dev/vdc /dev/vdd /dev/vde /dev/vdf /dev/vdg
> # lvcreate -n lvtest -L 8G vgtest
> # lvconvert --mirrors 1 --stripes 3 vgtest/lvtest
> # lvs -o+stripes
>    LV     VG     Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert #Str
>    lvtest vgtest rwi-a-r--- 8.00g                                    12.21               2
> 
> But if you create LV using lvcreate command directly, the command succeeds with stripes.
> e.g.
> # lvcreate --mirrors 1 --stripes 3 -L 4G vgtest
> # lvs -o+stripes
>    LV     VG     Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert #Str
>    lvol0  vgtest rwi-a-r--- 4.01g                                    8.67                6
> 
> I also use lvm2-2.02.180 to reproduce this issue, the lvconvert command works like before,
> but the command will print out a message, like that,
> # lvconvert --mirrors 1 --stripes 3 vgtest/lvtest
>    Command does not accept option: --stripes 3.
> 
> Why do we can not use lvconvert to do like that, design issue? but lvcreate can do that.
> What limitations are there between mirrors and stripes?

Layout of disks with raid target is:

1st. + 2nd.     are paired into raid1

3rd. + 4th.     are paired into raid1

5th. + 6th.     are making 3rd. raid1

then with your --stripe option - above raid1-like-devices are combined into 
one big raid0 array   (aka raid10) (all happens within single device target)

So converting ordinary LV into such beast is not trivial.
Although I believe you should look at reshaping possibilities, but I'm not 
quite sure there is already support for raid10.

In past with old --type mirror target the logic was different - you had 
'individual' mirror legs striped - and then from them it's been mirrored/raid1 
(aka raid01). Clearly old mechanism (where you only say you add new 'striped' 
leg) is way more easier for implementation - you just allocate striped LV and 
add as a new leg to mirror.

Regards

Zdenek
