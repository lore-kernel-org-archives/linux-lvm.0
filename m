Return-Path: <root@srv.sistina.com>
Date: Wed, 14 Feb 2001 17:56:02 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM don't work anymore (wrong version?)
Message-ID: <20010214175602.I2960@srv.sistina.com>
References: <B45465FD9C23D21193E90000F8D0F3DF683959@mailsrv.linkvest.ch>
Mime-Version: 1.0
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF683959@mailsrv.linkvest.ch>; from Jean-Eric.Cuendet@linkvest.com on Wed, Feb 14, 2001 at 05:45:04PM +0100
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

On Wed, Feb 14, 2001 at 05:45:04PM +0100, Jean-Eric Cuendet wrote:
> 
> > > pvcreate -- ERROR: VGDA in kernel and lvmtab are NOT 
> > consistent; please run
> > > vgscan
> > > What's that?
> > 
> > You shouldn't be able to get that message with LVM 0.9.1 beta3 at all.
> > Are you by accident using an older version?
> 
> No, I'm sure it's beta3 and after beta4 (I tried it, just in case)
> 
> > If vgscan still complains and you have your 
> > /etc/lvmconf/vg.conf (assuming
> > that your VG is named vg :) VGDA backup file you can reactivate your
> > VG with:
> > 
> > rm -rf /etc/lvmtab*
> > mkdir /etc/lvmtab.d
> > echo -ne "vg\0" > /etc/lvmtab
> > cp /etc/lvmconf/vg.conf /etc/lvmtab.d/vg
> > vgchange -ay
> 
> It works! Thanks.

You're welcome.

> The problem is that vgscan creates a file /etc/lvmtab without the VG name.
> The file had only \0 in it!
> I think that there is a bug. Would you like that I try somethng else?

The problem you are facing is probably related to a PV UUID bug we
recently fixed.
Send me the output of:

pvscan
pvscan -u

before changing anything in your VG.

> I'll reboot the server this evening, so I'll have beta4 for tools AND
> kernel.
> Thanks for your help.
> -jec
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
