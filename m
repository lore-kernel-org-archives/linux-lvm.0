Return-Path: <root@srv.sistina.com>
Date: Thu, 17 May 2001 15:44:23 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] main drive fail
Message-ID: <20010517154423.A19998@sistina.com>
References: <31470A1D25F5D311940A0020182B88D319F973@mail.n-ary.com> <3B03D3B6.71BF4AD8@loria.fr>
Mime-Version: 1.0
In-Reply-To: <3B03D3B6.71BF4AD8@loria.fr>; from Dominique.Larchey-Wendling@loria.fr on Thu, May 17, 2001 at 03:35:50PM +0200
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

On Thu, May 17, 2001 at 03:35:50PM +0200, Dominique LARCHEY-WENDLING wrote:
> Thomas Inglis wrote:
> > 
> > Thomas, Did you restore the lvm related entries in /etc ?
> > Well, using
> >    vgcfgrestore -nlvmGroup /dev/hdb1         (thx Dominque)
> > says that /etc/lvmconf/lvmGroup.conf doesnt exists, backup not available.
> 
> You are not supposed to loose these files .... aie ;-(

Correct :-(

Do you have a backup on tape or somewhere?


> As I understand, there is a copy of this info. on every phys. volume.

A lot of parts are redundantly stored on every physical volume.
*But* you need the PV structure *and* the PE mapping table (that's the one
which translates between LV and PV addresses) which is in
/etc/lvmconf/VGName.conf or deaper in the history (default depth 10) kept there.

> But it seems no utility exist for restoring this info. into
> /etc/lvmconf/...

It wouldn't help because the above unique information isn't on any of
the other physical volumes.

> 
> What does pvscan give you ?

Likely all but the crahed one PV.

In case you have a recent backup of /etc/lvmconf/*, you can make use of
that to vgcfgrestore your PV and run vgscan.

> 
> And I did not understand if you also want to recover the
> data in the volume group lvmGroup ? (it would be simpler if not ...)
> 
> DL
> 
> -- 
> Dominique Larchey
> LORIA, Nancy, France
> Tel. (Work) +33 (0) 3 83 59 20 13
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

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
