Date: Wed, 22 Aug 2001 09:02:15 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] restoring lvm cinfiguration
Message-ID: <20010822090215.B7109@sistina.com>
References: <20010821125350.B402@sky.net> <4438.998393026@www26.gmx.net> <20010821145329.A763@sky.net>
Mime-Version: 1.0
In-Reply-To: <20010821145329.A763@sky.net>; from U.Wiederhold@gmx.net on Tue, Aug 21, 2001 at 02:53:29PM +0200
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

On Tue, Aug 21, 2001 at 02:53:29PM +0200, Ulrich Wiederhold wrote:
> Hi,
> * Lars Grobe <grobe@gmx.net> [010821 13:23]:
> > My question is concerning the naming conventions of the files. So is vg01
> > the name of your vg?
> Yes.
> 
> > I did a vgcfgrestore -l with the different files in /etc/lvmconf, and while
> > the <vgname>.conf gives me the current config (that is after resize, and I
> > want to get the config before resizing), I have a file <vgname>.conf.1.old that
> > seams to hold the data before resizing.
> > 
> > So I would like where lvm will store the data if I resize a lv - is .conf
> > the new (current after resizing) and .conf.1.old the old (before resizing)
> > configuration? So if I want to undo resizing, should I restore from .conf.1.old?
> 
> I think you should use .conf.1.old then. The newest file is .conf, the
> oldest one .conf.9.old (at my system, "ls -l" shows you this).
> You can use the -t option to test the command.

Yes, that's correct.

You can even have deaper backup histories setting the environment variable
LVM_VG_MAX_BACKUPS to a higher value than 9 (max is 999).

> 
> Uli
> 
> -- 
> 'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
