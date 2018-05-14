Date: Mon, 14 May 2018 12:13:12 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20180514161312.GA14685@redhat.com>
References: <CAHJ=Ofm_j2B6TeNZR_1GZk40L_fiAqMT=umehupKSnNd+ZHY2A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHJ=Ofm_j2B6TeNZR_1GZk40L_fiAqMT=umehupKSnNd+ZHY2A@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pankaj Agarwal <pankaj@releasemanager.in>
Cc: linux-lvm@redhat.com

On Sun, May 13 2018 at  8:47pm -0400,
Pankaj Agarwal <pankaj@releasemanager.in> wrote:

>    Hi,
>    How do i set the nr_request value for LV's as it's not writable like other
>    drives on a linux system.
>    LV's are set as dm-0 and dm-1 on my system.
>     #cat /sys/block/dm-0/queue/nr_requests
>    128
>    # echo 256 > /sys/block/dm-0/queue/nr_requests
>    -bash: echo: write error: Invalid argument

In the block layer, bio-based devices cannot have their nr_requests
changed, see: block/blk-sysfs.c:queue_requests_store()

So any bio-based DM device (e.g. linear target) won't be allowed to
change nr_requests.

The only way to change this would be from the bottom up:
1) change the underlying request-based device(s) (e.g. /dev/sda)
2) dmsetup suspend + dmsetup resume any bio-based DM device(s) that are
   stacked ontop of the request-based device(s) you changed in 1)
   -- this will restack the queue_limits from the bottom up; so the DM
   device will then reflect the underlying devices' limits.

Mike
