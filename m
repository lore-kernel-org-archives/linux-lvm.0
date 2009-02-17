Date: Tue, 17 Feb 2009 12:26:05 +0100
From: Lupe Christoph <lupe@lupe-christoph.de>
Subject: Re: [linux-lvm] File system size difference betwen lvdisplay & df -h
Message-ID: <20090217112605.GM10238@lupe-christoph.de>
References: <9d1973c20902170225m7e0f87d2ydda7622a2c0dccf7@mail.gmail.com>
	<499A96CD.20808@redhat.com>
	<9d1973c20902170305h14bfb304h84f839f5ac301b03@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d1973c20902170305h14bfb304h84f839f5ac301b03@mail.gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tuesday, 2009-02-17 at 16:35:53 +0530, Dayanand Math wrote:

> The following df -h & lvdisplay shows the discrpancy..What could be the
> reson?

Get a spelin cheker :-P

> I am referring to the discrepancy between LV Size in lvdisplay &  total
> size df -h output of the corresponding file system.

>  df -h /test
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/mapper/vg00-lv_test
>                       124M   11M  107M   9% /test

Please use df -k to get exact figures.

> # lvdisplay -v /dev/vg00/lv_test
>   LV Size                128.00 MB

Depending on the filesystem type, which we don't know, the filesystem
may not use all available space because of its structure, i.e. because
you don't get an integral number of cylinder groups out of the available
space. This is less obvious with large (i.e. multi-Gigabyte)
filesystems.

Please do not top-post and remove all fluff in your answers.

> On 2/17/09, Bryn M. Reeves <bmr@redhat.com> wrote:

> > Dayanand Math wrote:

HTH,
Lupe Christoph
-- 
| There is no substitute for bad design except worse design.                   |
| /me                                                                          |
