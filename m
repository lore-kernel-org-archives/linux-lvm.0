Return-Path: <Jean-Eric.Cuendet@linkvest.com>
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF683959@mailsrv.linkvest.ch>
From: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Subject: RE: [linux-lvm] LVM don't work anymore (wrong version?)
Date: Wed, 14 Feb 2001 17:45:04 +0100
MIME-Version: 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> > pvcreate -- ERROR: VGDA in kernel and lvmtab are NOT 
> consistent; please run
> > vgscan
> > What's that?
> 
> You shouldn't be able to get that message with LVM 0.9.1 beta3 at all.
> Are you by accident using an older version?

No, I'm sure it's beta3 and after beta4 (I tried it, just in case)

> If vgscan still complains and you have your 
> /etc/lvmconf/vg.conf (assuming
> that your VG is named vg :) VGDA backup file you can reactivate your
> VG with:
> 
> rm -rf /etc/lvmtab*
> mkdir /etc/lvmtab.d
> echo -ne "vg\0" > /etc/lvmtab
> cp /etc/lvmconf/vg.conf /etc/lvmtab.d/vg
> vgchange -ay

It works! Thanks.
The problem is that vgscan creates a file /etc/lvmtab without the VG name.
The file had only \0 in it!
I think that there is a bug. Would you like that I try somethng else?
I'll reboot the server this evening, so I'll have beta4 for tools AND
kernel.
Thanks for your help.
-jec
