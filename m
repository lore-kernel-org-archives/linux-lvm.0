From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Moving disks
Message-ID: <20030910120141.I2618@sistina.com>
References: <Pine.LNX.4.21.0309090835570.2466-100000@rife.strakt.com>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0309090835570.2466-100000@rife.strakt.com>; from erik@strakt.com on Tue, Sep 09, 2003 at 08:41:53AM +0200
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
Date: Wed Sep 10 05:11:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Sep 09, 2003 at 08:41:53AM +0200, Erik Rask wrote:
> Hello all! I am running LVM (1.0.7-5 according to the Debian package
> list) on two Debian/Sid machines, that act as servers. I have now set up
> an intermediate backup system, with external SCSI disks in separate
> cabinets mirrored each night, to have a quick access backup in case of
> disk failure. These external disks, as well as the internal ones (apart
> from the root partition) are LVM. My question now is this: 
> Would it be possible to take one of those drives and connect it to another
> LVM capable host, and have it recognize the LV's on the disk? I am not
> sure of how much of the VG/LV information is stored on the disk, so I have
> not tried this. 

Erik,

if you mirror all PVs of the VG(s) while all LVs got quiesced,
you can simply attach the mirrors to another system and run
"vgscan ; vgcghange -ay" there to access the duplicated VG(s).

> RTFM's are fine, if you could include pointers to the FM's, since I have
> had problems digging this up. 
> TIA
> /Erik.
> -- 
> Erik Rask, systems administrator @ AB Strakt
> "There is no normal life. There's just life. So get on with it."
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
