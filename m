From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Config files
Message-Id: <20020218100130.B28465@sistina.com>
References: <BC9564600E40C541983FCD6BEAF814FE03C94E8F@xch-knt-15.nw.nos.boeing.com>
MIME-Version: 1.0
In-Reply-To: <BC9564600E40C541983FCD6BEAF814FE03C94E8F@xch-knt-15.nw.nos.boeing.com>;
    from gordon.w.wolfe@boeing.com on Fri, Feb 15, 2002 at 02:31:10PM -0800
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
Date: Mon Feb 18 03:03:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Feb 15, 2002 at 02:31:10PM -0800, Wolfe, Gordon W wrote:
> I'm upgrading from SuSE Linux for s/390 2.2.16 kernel to 2.4.7 kernel.
> There is no direct upgrade path so I have to reinstall all of SuSE.
> 
> I have some servers using LVM.  What files (config files, etc) do I need to
> keep from the old system so that all my information on the LVM volumes will
> be there when I'm done?

You need to keep no LVM config files.
All what you need to have is a running LVM (1.0.2 recommended) with your
2.4.7 upgrade. The you run "vgscan;vgchange -ay" which will scan all disks
for LVM metadata, recreate the cache files /etc/lvmtab* and activate your VG(s).
"vgscan;vgchange -ay" should run automatically if you keep the SuSE startup
files and the LVM driver is loaded/linked in.

Please remember to have full backups of your system before upgrade in case
something (not necessarily with LVM ;-) goes wrong.


> 
> "Never trust any computer you can lift."
> Gordon Wolfe, Ph.D. (425)865-5940
> VM Technical Services, The Boeing Company
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
