From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM in Dual Path SAN Environment
Message-ID: <20020911122321.B26854@sistina.com>
References: <3D7F0F54.86F71021@az1.de>
Mime-Version: 1.0
In-Reply-To: <3D7F0F54.86F71021@az1.de>; from schindler@az1.de on Wed, Sep 11, 2002 at 11:39:32AM +0200
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
Date: Wed Sep 11 05:47:06 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 11, 2002 at 11:39:32AM +0200, Andreas G. Schindler wrote:
> A Question to the LVM Guy(s):
> 
> We would like to use Linux LVM to overcome the fact, Linux doesn't 
> currently support Dual-Path access to SAN (Fibre-Channel) units.
> 
> Rumors are, LVM is able to detect multiple paths to a PV (in my case
> a SAN SCSI LUN) and will rearrange it to one single PV.

Correct.

> 
> As far as i see, this should solve the problem during regular operation
> (i.e. both paths to the SAN active). But what about the really interesting
> case of failure on one link? If this is the currently 'active' link (that
> one, still in t LVM's PV list), we need a failover and rearrangement
> of the PV list on the fly.
> 
> Does this work ??

Not so far. We want to have multipathing with failover support
in LVM2 this year.

> 
> Many thanks in advance
> 
> Regards, Andreas
> 
> -- 
> 
> Dr. Andreas G. Schindler        c/o Alpha Zero One Computersysteme GmbH
> schindler@az1.de                Frankfurter Str. 141, D-63303 Dreieich
> Tel +49 6103 57187 21           Germany
> 
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
