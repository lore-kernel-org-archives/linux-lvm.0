From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] HELP: vgscan segfaults
Message-ID: <20030130103301.C26745@sistina.com>
References: <20030129151209.GB2200@elrond.lohmann-services.de> <20030129151819.GE802@tykepenguin.com> <20030129153229.GC2200@elrond.lohmann-services.de> <20030129154207.GF802@tykepenguin.com> <20030129155936.GA2428@elrond.lohmann-services.de> <20030129160958.GG802@tykepenguin.com>
Mime-Version: 1.0
In-Reply-To: <20030129160958.GG802@tykepenguin.com>; from caulfield@sistina.com on Wed, Jan 29, 2003 at 04:09:58PM +0000
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
Date: Thu Jan 30 03:35:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 29, 2003 at 04:09:58PM +0000, Patrick Caulfield wrote:
> On Wed, Jan 29, 2003 at 04:59:36PM +0100, Peter Lohmann wrote:
> > > 
> > > If your metadata backups are up-to-date then "vgchange -ay" should activate the
> > > volumes regardless. Something must have changed, programs don't just work one
> > > day and segv the next without good reason.
> > 
> > I know... but still:
> > 
> > --> vgchange -ay myvg
> > vgchange -- volume group "myvg" does not exist
> > 
> > Same with vgchange -ay
> > 
> > :-(
> 
> Looks like the segfaulting vgscan started to write the metadata backups. See of
> you can find valid ones in /etc/lvmtab and restore them using vgcfgrestore.
> 
> OR it might be as easy as creating a new /etc/lvmtab with "myvg\0" in it and
> retrying vgchange.

...plus "mkdir /etc/lvmtab.d;cp /etc/lvmconf/myvg.conf /etc/lvmtab.d/myvg"
before the "vgchange -ay".

Additionally you need to change the LVM config (i.e. by running
"lvchange -pr .." or something) so that the ondisk metadata gets written
back to the PVs.

> -- 
> 
> patrick
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
