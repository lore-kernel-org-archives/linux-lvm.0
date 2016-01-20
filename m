Date: Wed, 20 Jan 2016 19:16:26 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20160120191626.GE2125@agk-dp.fab.redhat.com>
References: <CAJbEnTyXh8t6o5de6dFfWqSBLuemHE3rkJkA5StQR27f1NOvkA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJbEnTyXh8t6o5de6dFfWqSBLuemHE3rkJkA5StQR27f1NOvkA@mail.gmail.com>
Subject: Re: [linux-lvm] -l 100%FREE doesn't work with RAID1
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
To: Bryan Larsen <bryan@larsen.st>
Cc: linux-lvm@redhat.com

On Wed, Jan 20, 2016 at 12:19:13PM +0000, Bryan Larsen wrote:
> I'm setting up some provisioning scripts, so I don't know the actual sizes
> of the hard drives
> $ sudo lvcreate --type raid1 -m 1 -l 100%FREE -n backups hdd_vg
>   Insufficient free space: 781320 extents needed, but only 390658 available
> $ sudo lvcreate --type raid1 -m 1 -l 50%FREE -n backups hdd_vg
>   Insufficient free space: 390662 extents needed, but only 390658 available

Works for me here.

Perhaps you're using an old version?
When run with -vvvv, the key line for me is this one
metadata/lv_manip.c:3036   Found fewer allocatable extents for logical volume lvol1 than requested: using 48 extents (reduced by 142).
 
Alasdair
