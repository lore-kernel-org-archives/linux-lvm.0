Return-Path: <root@srv.sistina.com>
Date: Fri, 2 Feb 2001 11:46:35 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] startup stuff
Message-ID: <20010202114635.A1039@srv.sistina.com>
References: <Pine.LNX.4.21.0102020959490.426-100000@munster.noc.fr.clara.net>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0102020959490.426-100000@munster.noc.fr.clara.net>; from james@fr.clara.net on Fri, Feb 02, 2001 at 10:02:17AM +0100
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

On Fri, Feb 02, 2001 at 10:02:17AM +0100, JAmes wrote:
> 
> Hello
> 
> I am using debian Linux, and have farely successfully installed LVM. I
> have just to do the lvcreate -ay at startup. I assume that thi smust go in

You surely mean "vgchange -ay".

> 
> /etc/rc2.d 
> 
> but using what S??

It must run after boot in order to activate VGs before any accesses to
LVs (for eg. containing filesystems) take place and after modules were loaded.

Use one of the /etc/init.d/ scripts as a template to create
/etc/init.d/lvm containing "vgscan;vgchange -ay".

Create a symlink /etc/rcS.d/S25lvm pointing to this file please.

> 
> Any help extremely apreciated...
> 
> James
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
