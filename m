Return-Path: <root@srv.sistina.com>
Date: Wed, 14 Feb 2001 17:26:10 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM don't work anymore (wrong version?)
Message-ID: <20010214172610.G2960@srv.sistina.com>
References: <B45465FD9C23D21193E90000F8D0F3DF683953@mailsrv.linkvest.ch>
Mime-Version: 1.0
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF683953@mailsrv.linkvest.ch>; from Jean-Eric.Cuendet@linkvest.com on Wed, Feb 14, 2001 at 11:15:53AM +0100
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

On Wed, Feb 14, 2001 at 11:15:53AM +0100, Jean-Eric Cuendet wrote:
> 
> Hi,
> I'm using LVM 0.9.1_beta3 since 2 weeks now without any problem.
> I'm having a problem now.
> I have one VG and one LV in it.
> I need to create another VG made of 3 PVs.
> I issue:
> [root@fatboy hosts]# pvcreate -f /dev/md7
> pvcreate -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> vgscan
> What's that?

You shouldn't be able to get that message with LVM 0.9.1 beta3 at all.
Are you by accident using an older version?

> 
> When running vgscan:
> [root@fatboy hosts]# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- no volume groups found
> 
> What can I do with that?
> Thanks
> -jec
> 
> PS: I already tried to upgrade to beta4 (only the tools). If you want me to
> upgrade the kernel to beta4, wait this evening :-) (prod machine)

Yes, please try that.

If vgscan still complains and you have your /etc/lvmconf/vg.conf (assuming
that your VG is named vg :) VGDA backup file you can reactivate your
VG with:

rm -rf /etc/lvmtab*
mkdir /etc/lvmtab.d
echo -ne "vg\0" > /etc/lvmtab
cp /etc/lvmconf/vg.conf /etc/lvmtab.d/vg
vgchange -ay

> 
> _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
> Jean-Eric Cuendet
> Linkvest SA
> Av des Baumettes 19, 1020 Renens Switzerland
> Tel +41 21 632 9043  Fax +41 21 632 9090
> http://www.linkvest.com  E-mail: jean-eric.cuendet@linkvest.com
> _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
> 
> 
> 
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
