From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Broken Harddisk in LVM
Message-ID: <20030122121446.A25896@sistina.com>
References: <000101c2c19c$83a6f090$0300a8c0@quaiky>
Mime-Version: 1.0
In-Reply-To: <000101c2c19c$83a6f090$0300a8c0@quaiky>; from kai@stella.at on Tue, Jan 21, 2003 at 11:29:08PM +0100
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
Date: Wed Jan 22 05:15:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Install device-mapper + LVM2 tools _additionally_ in a seperate
location and run "vgscan ; vgchange -a y -P".

That might still leave you with unusable LVs in case their beginning
is gone with the failed disk.

If you decide to do that get back to us in case you've got installation
related questions.

Regards,
Heinz    -- The LVM Guy --

On Tue, Jan 21, 2003 at 11:29:08PM +0100, Kai Iskratsch wrote:
> One hard disk of my lvm System is completely broken, so that even the
> controller cannot find it.
> Is there a possibility to get the lvm running again without the data of
> this disk.
> 
> Kai Iskratsch 
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
