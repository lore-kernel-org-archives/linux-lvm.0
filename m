Return-Path: <jmoser@erc.wisc.edu>
From: "John Moser" <jmoser@erc.wisc.edu>
Subject: RE: [linux-lvm] LVM vgscan problems
Date: Fri, 11 May 2001 07:11:36 -0500
Message-ID: <MPEBLKGAGHMJAPMMNPGGGEAJCAAA.jmoser@erc.wisc.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <wvr8xwdr70.fsf@freeze.oslo.dnmi.no>
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
To: linux-lvm@sistina.com

1) Nothing else in my logs.

2) 2.4.0 kernel

3) I tried using 0.9.1beta6 when I was initially trying to get things to
work, but I kept getting an error (don't remember what).  So I moved to 0.9
and it worked.  Now, 0.9 doesn't work.  On a hunch, I installed the
0.9.1beta7 tools, and things work now!  Weird.  I wonder what the difference
was.

-John

> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Adrian Phillips
> Sent: Friday, May 11, 2001 7:08 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] LVM vgscan problems
>
>
> >>>>> "John" == John Moser <jmoser@erc.wisc.edu> writes:
>
>     John> After having a bit of success with LVM under Linux (kernel
>     John> 2.4, LVM version 0.9) over the past couple of months, I've
>     John> encountered this problem on a reboot of my LVM-enabled
>     John> machine:
>
>     John> root@computer:/etc# vgscan -v vgscan -- removing
>     John> "/etc/lvmtab" and "/etc/lvmtab.d" vgscan -- reading all
>     John> physical volumes (this may take a while...)  vgscan --
>     John> scanning for all active volume group(s) first vgscan --
>     John> found inactive volume group "test " vgscan -- reading data
>     John> of volume group "test" from physical volume(s) vgscan --
>     John> ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't
>     John> get data of volume group "test" from physical volume(s)
>     John> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of
>     John> LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"
>
>     John> Does anyone know how to fix this?  Or what might cause it?
>     John> There's critical data on the filesystem, and I'd like to get
>     John> it back up and running asap.
>
> Note I'm a LVM newbie so possibly may be of little help, but some
> standard questions :-
>
> - anything else in your logs, hardware, SCSI problems
>
> - which 2.4, from what I gather, anything before 2.2.4 has problems in
>   various places (not LVM)
>
> Sincerely,
>
> Adrian Phillips
>
> --
> Your mouse has moved.
> Windows NT must be restarted for the change to take effect.
> Reboot now?  [OK]
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
