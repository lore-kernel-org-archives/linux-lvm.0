Date: Tue, 16 Oct 2001 02:37:55 +0200
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] added a physical volume but df reports no joy
Message-ID: <20011016023755.E28004@jadzia.josv.com>
References: <20011015173154.E24088@transvirtual.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011015173154.E24088@transvirtual.com>; from mark@transvirtual.com on Mon, Oct 15, 2001 at 05:31:54PM -0700
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Mark,

After doing an lvxtend, you must also resize the filesystem that resides
in the LV. With an ext2fs, this can be achieved using the resize2fs tool
that is part of the latest ext2fs tools. Be sure to read the manual page
carefully, and maybe even backup your valuable data first!

++Jos

And thus it came to pass that Mark wrote:
(on Mon, Oct 15, 2001 at 05:31:54PM -0700 to be exact)

> hi all.
> 
> so when my first logical volume filled up i added a third
> physical volume with 'pvcreate /dev/hdx' then 
> 'vgextend vol_group_name /dev/hdx' then 'lvextend -L 53000 /dev/vol_group/log_vol /dev/hdx'.
> i had 35GB and added another 20GB disk for a possible 55GB but after the lvextend
> the kernel isn't seeing the new volume size - that is i still only have 35GB of usable
> storage ( including some PEs that when allocated will have a neglible impact on the 
> total volume size needed ).
> 
> is this because set the logical volume size as opposed to extending it? 
> 
> the logical volume is now at almost %100 and won't take any more data ( sans those extra PEs )
> 
> here's a verbose vgdisplay:
> 
> glimmung:~# vgdisplay foo -v
> --- Volume group ---
> VG Name               foo
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                1
> Open LV               1
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                3
> Act PV                3
> VG Size               54.16 GB
> PE Size               4 MB
> Total PE              13866
> Alloc PE / Size       13250 / 51.76 GB
> Free  PE / Size       616 / 2.41 GB
> VG UUID               oBe1zH-ifW2-1Lhx-nAGe-UP5t-0Maw-WryAw7
> 
> --- Logical volume ---
> LV Name                /dev/foo/lvol1
> VG Name                foo
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 1
> LV Size                51.76 GB
> Current LE             13250
> Allocated LE           13250
> Allocation             next free
> Read ahead sectors     120
> Block device           58:0
> 
> 
> --- Physical volumes ---
> PV Name (#)           /dev/hda7 (1)
> PV Status             available / allocatable
> Total PE / Free PE    4076 / 0
> 
> PV Name (#)           /dev/hdb1 (2)
> PV Status             available / allocatable
> Total PE / Free PE    4885 / 179
> 
> PV Name (#)           /dev/hdc1 (3)
> PV Status             available / allocatable
> Total PE / Free PE    4905 / 437
> 
> 
> thanks!
> 
> -- 
>   Mark Garey                            Tel:     (415) 243-4055 x1023
>   Transvirtual Technologies, Inc.,      Fax:     (415) 243-4056
>   San Francisco, CA. USA                Email:   mark@transvirtual.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
Nothing can be reasonable or beautiful unless it's been made by one 
central idea.
