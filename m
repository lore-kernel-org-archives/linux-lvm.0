Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id i1KFaVa5019067
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 16:36:31 +0100
From: Heinz Mauelshagen <Mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Lost free PV  -> error reading VG
Message-ID: <20040220153630.GD25086@redhat.com>
References: <15173.1077120428@www19.gmx.net> <20040219121317.GB32407@redhat.com> <4034F7F3.2040006@demonlord.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4034F7F3.2040006@demonlord.de>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 20 10:35:06 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Christian,

never "rm -r /etc/lvm*" !!!

o vgscan deletes and creates /etc/lvmtab and volume group 
  backup files in /etc/lvmtab.d/ new

o /etc/lvmconf/ archive files get updated by _any_ configuration changing
  command or by explicitely running vgcfgbackup

Of course you might want to remove certain archive files from /etc/lvmconf/
after many configuration changes because archives of removed VGs don't get
deleted automatically for obvious reasons.

But yuu *never* *ever* want to do that without having an actual backup
of /etc/lvmconf/*.

FYI: LVM2 keeps metadata backups and archives uin different locations
     (see /etc/lvm/lvm.conf there)

Regards,
Heinz    -- The LVM Guy --




On Thu, Feb 19, 2004 at 06:52:51PM +0100, Christian Reiss wrote:
> Heinz Mauelshagen wrote:
> 
> >
> >/me wonders how often we mentioned to take backups of /etc/lvmconf/* yet 
> >:->
> >
> 
> From a Users point of view:
> If you run vgscan, and it even mentions something about
> 
> a) REBuilding /etc/lvmwhatever
> and
> b) it fails for *any* reason,
> 
> people, me included, delete /etc/lvm* to start "clean",
> and give vgscan the opportunity to start fresh, without
> any "corrupted" data.
> 
> I dont know how often I nuked the backups, even after i
> knew that deleting /etc/lvm* is not a good idea. Its like
> a reflex.
> 
> -Christian
> 
> 
> 
> 
> -- 
> Christian Reiss <email@demonlord.de>
> demonserver.de
> 
> Key fingerprint = 2999 B7CD A218 06DF D658  5BE3 18B6 B232 02FF 71B2
> Public Key can be obtained here: http://www.demonlord.de/pgp.txt
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
