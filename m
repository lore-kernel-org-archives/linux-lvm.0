From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] "umount" LVM stuff
Message-ID: <20030228180716.A9839@sistina.com>
References: <3E58E03E.3020401@machturtle.com> <20030223181304.V14285@zealot.blacknet.de> <3E5919A3.2010404@machturtle.com> <20030224021555.Y14285@zealot.blacknet.de> <20030224022433.Z14285@zealot.blacknet.de> <3E5A0961.80905@machturtle.com> <20030225162138.C832@sistina.com> <3E5CA74E.4030105@machturtle.com> <20030228122051.A9155@sistina.com> <3E5F5A85.4010903@machturtle.com>
Mime-Version: 1.0
In-Reply-To: <3E5F5A85.4010903@machturtle.com>; from dcorbin@machturtle.com on Fri, Feb 28, 2003 at 07:48:05AM -0500
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
Date: Fri Feb 28 11:13:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

David,

try vgscan then which should bring your device node back.

Regards,
Heinz    -- The LVM Guy --


On Fri, Feb 28, 2003 at 07:48:05AM -0500, David Corbin wrote:
> >
> >
> >This all looks ok.
> >
> >Doesn't "vgchange -a y" bring your VG back ?
> >If not so, try "vgscan ; vgchange -ay".
> >  
> >
> piano:/home/dcorbin# vgchange -ay
> vgchange -- volume group "vg0" already active
> 
> So, it appears that the VG IS there.
> ----
>  piano:/home/dcorbin# mount -t reiserfs /dev/vg0/data /data
> mount: special device /dev/vg0/data does not exist
> 
> /dev/vg0/data is the device I used to use to mount it, and the error 
> message is correct if I look at my filesystem (it doesn't exist).
> ----
> piano:/home/dcorbin# mount -t reiserfs /dev/vg0/group  /data
> mount: /dev/vg0/group is not a block device
> 
> I tried this command because /dev/vg0/group is the only device in /dev/vg0
> ----
> Here are some other commands that I tried that may or may not tell you 
> something...
> 
> piano:/home/dcorbin# 
> lvscan                                                                                                                
> lvscan -- no logical volumes found
> piano:/home/dcorbin# ls -ltar /dev/vg0
> total 28
> crw-r-----    1 root     disk     109,   0 Feb 24 06:53 group
> drwxr-xr-x   10 root     root        24576 Feb 24 06:53 ..
> dr-xr-xr-x    2 root     root         4096 Feb 24 06:53 .
> 
> >Regards,
> >Heinz    -- The LVM Guy --
> >  
> >
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
