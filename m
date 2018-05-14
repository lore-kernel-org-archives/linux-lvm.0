Date: Mon, 14 May 2018 13:53:54 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20180514175354.GA15053@redhat.com>
References: <CAHJ=Ofm_j2B6TeNZR_1GZk40L_fiAqMT=umehupKSnNd+ZHY2A@mail.gmail.com>
	<20180514161312.GA14685@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180514161312.GA14685@redhat.com>
Subject: Re: [linux-lvm] how to set higher then 128 nr_requests on LV's
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
To: Pankaj Agarwal <pankaj@releasemanager.in>
Cc: Hannes Reinecke <hare@suse.com>, dm-devel@redhat.com, linux-lvm@redhat.com

On Mon, May 14 2018 at 12:13pm -0400,
Mike Snitzer <snitzer@redhat.com> wrote:

> On Sun, May 13 2018 at  8:47pm -0400,
> Pankaj Agarwal <pankaj@releasemanager.in> wrote:
> 
> >    Hi,
> >    How do i set the nr_request value for LV's as it's not writable like other
> >    drives on a linux system.
> >    LV's are set as dm-0 and dm-1 on my system.
> >     #cat /sys/block/dm-0/queue/nr_requests
> >    128
> >    # echo 256 > /sys/block/dm-0/queue/nr_requests
> >    -bash: echo: write error: Invalid argument
> 
> In the block layer, bio-based devices cannot have their nr_requests
> changed, see: block/blk-sysfs.c:queue_requests_store()
> 
> So any bio-based DM device (e.g. linear target) won't be allowed to
> change nr_requests.
> 
> The only way to change this would be from the bottom up:
> 1) change the underlying request-based device(s) (e.g. /dev/sda)
> 2) dmsetup suspend + dmsetup resume any bio-based DM device(s) that are
>    stacked ontop of the request-based device(s) you changed in 1)
>    -- this will restack the queue_limits from the bottom up; so the DM
>    device will then reflect the underlying devices' limits.

I was mistaken.  DM core (in the kernel) will only restack the
queue_limits (nr_requests included) if a new DM table is loaded.

So a simple suspend+resume will _not_ change the bio-based DM device's
queue_limits:

[root@thegoat ~]# lsblk /dev/nullb0
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
nullb0 253:0    0  250G  0 disk
└─foo  252:0    0  250G  0 dm
[root@thegoat ~]# cat /sys/block/nullb0/queue/nr_requests
128
[root@thegoat ~]# cat /sys/block/dm-0/queue/nr_requests
128
[root@thegoat ~]# echo 64 > /sys/block/nullb0/queue/nr_requests
[root@thegoat ~]# cat /sys/block/nullb0/queue/nr_requests
64
[root@thegoat ~]# cat /sys/block/dm-0/queue/nr_requests
128
[root@thegoat ~]# dmsetup suspend foo
[root@thegoat ~]# dmsetup resume foo
[root@thegoat ~]# cat /sys/block/dm-0/queue/nr_requests
128

There was some related work started in this area by Hannes (now cc'd)
during LSF last month.  He added a chain-notifier to DM devices so that
if any underlying devices (devices referenced in a DM device's table)
were changed then the enture device stack would have its limits
reloaded.

Not sure where Hannes ended up with that.  Would love to get it polished
now and staged for 4.18 inclusion.

Hannes?
