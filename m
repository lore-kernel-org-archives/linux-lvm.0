Return-Path: <root@srv.sistina.com>
Date: Thu, 3 May 2001 11:20:54 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvcreate segfault
Message-ID: <20010503112054.B4700@sistina.com>
References: <Pine.LNX.4.30.0105020957190.11191-100000@beefcake.hdqt.valinux.com> <Pine.LNX.4.30.0105021155070.16582-100000@beefcake.hdqt.valinux.com>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.30.0105021155070.16582-100000@beefcake.hdqt.valinux.com>; from jweber@valinux.com on Wed, May 02, 2001 at 11:55:29AM -0700
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

Thanks Jay,

I integrated it.

Regards,
Heinz    -- The LVM Guy --

On Wed, May 02, 2001 at 11:55:29AM -0700, Jay Weber wrote:
> And here's a fix.
> 
> --- lvcreate.c.orig	Wed May  2 12:08:43 2001
> +++ lvcreate.c	Wed May  2 12:23:50 2001
> @@ -448,6 +448,10 @@
>        strncpy ( lv_snapshot_name, lv_name, sizeof ( lv_name) - 1);
>        dummy = argv[optind];
>        LVM_CHECK_DEFAULT_VG_NAME ( dummy, buffer, NAME_LEN);
> +      if (dummy == NULL) {
> +	fprintf(stderr, "%s -- snapshot name not present, supply -n
> option!\n\n", cmd);
> +	return LVM_EINVALID_CMD_LINE;
> +      }
>        strncpy ( lv_name, dummy, sizeof ( lv_name) - 1);
>        dummy = NULL;
>        lv_name[sizeof ( lv_name) - 1] = 0;
> 
> 
> On Wed, 2 May 2001, Jay Weber wrote:
> 
> > Date: Wed, 2 May 2001 09:58:41 -0700 (PDT)
> > From: Jay Weber <jweber@valinux.com>
> > Reply-To: linux-lvm@sistina.com
> > To: linux-lvm@sistina.com
> > Subject: [linux-lvm] lvcreate segfault
> >
> > Hi,
> >
> > Just noticed this one.
> >
> > [root@slippey /root]# lvcreate -l5 -s snap /dev/vol/foo
> > Segmentation fault (core dumped)
> >
> > Haven't looked at it much, off to a meeting now (sigh), but it appears to
> > be a simple option parsing problem when using -s.
> >
> > A proper command for that to work would be:
> > lvcreate -l5 -s -n snap /dev/vol/foo
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> >
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
