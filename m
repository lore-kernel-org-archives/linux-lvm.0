Date: Mon, 2 Oct 2000 10:29:45 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: [linux-lvm] Re: vgdisplay -D bug (?)
Message-ID: <20001002102945.C7806@srv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <133E81B9B327D41191950090275415B7CA7099@xjp02.jpn.hp.com>
Mime-Version: 1.0
In-Reply-To: <133E81B9B327D41191950090275415B7CA7099@xjp02.jpn.hp.com>; from masanari_iida@hp.com on Mon, Oct 02, 2000 at 04:52:22PM +0900
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "IIDA,MASANARI (HP-Japan,ex2)" <masanari_iida@hp.com>
Cc: linux-lvm@msede.com

On Mon, Oct 02, 2000 at 04:52:22PM +0900, IIDA,MASANARI (HP-Japan,ex2) wrote:
> Hello 
> 
> I found something wrong with vgdisplay status output.
> If I put -D option, vgdisplay ALWAYS report the VG is "NOT available"

This is a known behaviour, because the "-D" options of several LVM commands
are ment to display the on disk metadata rather than the in core one.

On disk the metatdata contains the information that the volume group
is inactive.
That's why it is displayed as inactive.

-- 

Regards,
Heinz      -- The LVM guy --

> 
> Distribution RH7(beta)
> Linux Kernel 2.4.0-test6
> LVM commands  0.8 final
> 
> (problem detail)
> 
> (A)  VG is NOT active.
> use "vgdisplay -D" ===> VG status    NOT available / resizable
> 
> (B)  VG is active
> use "vgdisplay -D" ===> VG status    NOT available / resizable
> 
> (C)  VG is active 
> use "vgdisplay" ===>  VG status   available  /  resizable
> 
> (A) and (C) are OK.
> But I think the output of the case (B) should be 
> VG status available / resizable , or the vgdisplay command would
> like to add some messages like "The VG is active. you don't need to add -D"
> .
> 
> I am not sure if you can duplicate the problem.
> But this test should be very easy for you.
> 
> ==========
> And when I compile the LVM commands on the RH7, I need to change
> Man path in the Makefile. As you know, RH7 has been changed to FHS.
> 
> Regards,
> 
> MASA (masanari Iida@hp.com)

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
