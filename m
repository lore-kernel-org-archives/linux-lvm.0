Return-Path: <root@srv.sistina.com>
Date: Mon, 30 Apr 2001 16:13:49 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] VG does not activate at boot
Message-ID: <20010430161349.L19810@sistina.com>
Mime-Version: 1.0
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

On Sun, Apr 29, 2001 at 07:20:41PM -0500, Tom Otake wrote:
> Hi,
> 
> I 'm having a slight problem/inconvenience with LVM and need some
> assistance.  Everytime I boot the system, the VG's do not come up active
> and subsequently, some fs don't mount.  The error I get  indicates the
> underlying device for the fs is not a valid device.  'vgdisplay' says
> the the VG is  not active, which running 'vgdisplay -D' confirms.
> Running 'vgchange -a y swvg' resolves the problem, activates the VG and
> I can mount the fs.  LVM support is compiled into the kernel.  I'm
> running kernel 2.4.3 and lvm_0.9.1_beta7.  Right now, I'm using it
> mainly for testing and no essential fs are using LVM so it is not a
> critical issue, still, I'd like to know how to resolv this.

Tom,
You need to add "vgchange -ay" to your init script in order to activate
all VGs at every boot.

Please see the file named INSTALL in the LVM tarball for these instructions.

Regards,
Heinz    -- The LVM Guy --

> 
> Thanks
> 
> --
> _______________
> Anything that happens, happens.
>    Anything that, in happening, causes something else to happen, causes
>    something else to happen.
>    Anything that, in happening, causes itself to happen again, happens again
>    It doesn't necessarily do it in chronological order, though.
>          -- Douglas Adams
> 
> -- Tom Otake
> -- totake66_nospam@home.com
> -- #550
> 
> 
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
