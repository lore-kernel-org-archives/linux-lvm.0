From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgchange -- ERROR "parameter error"
Message-ID: <20021105150300.C27825@sistina.com>
References: <20021101201601.61173.qmail@web14005.mail.yahoo.com>
Mime-Version: 1.0
In-Reply-To: <20021101201601.61173.qmail@web14005.mail.yahoo.com>; from gayatri_prabhu@yahoo.com on Fri, Nov 01, 2002 at 12:16:01PM -0800
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
Date: Tue Nov  5 08:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Gayatri,

this looks like a bad snapshot exception table.
Install LVM 1.0.6 which is able to drop the bad snapshot.

On Fri, Nov 01, 2002 at 12:16:01PM -0800, Gayatri Prabhu wrote:
> Hi,
> 
> I read a few emails on this mailing list with the same
> problem. I'm using LVM version 1.0.1-rc4, kernel
> 2.4.7, Redhat 7.2. I've been unable to activate a VG
> since yesterday. I've been trying to recover data from
> the VG using  the "pvcreate, vgcfgrestore, vgscan,
> vgchange" procedure given as a solution to this
> problem. I still get the following error:
> vgchange -- ERROR "parameter error" setting up
> snapshot copy on write exception table for
> "/dev/vgtest/snap.02"
> 
> I've tried using all the old config files for this VG
> in /etc/lvmconf, but even the oldest file has the
> "messy" snapshot since the snapshot creation was being
> done as part of an hourly cron job. 
> 
> I would appreciate it if you could let me know whether
> there is any other way to still recover the data on
> the disk ? Also, is there a later version of LVM in
> which this problem has been fixed ?
> 
> Thanks,
> Gayatri
> 
> 
> __________________________________________________
> Do you Yahoo!?
> HotJobs - Search new jobs daily now
> http://hotjobs.yahoo.com/
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
