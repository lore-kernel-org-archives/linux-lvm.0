From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Adding to vg broke it :-(
Message-ID: <20021111113311.A23857@sistina.com>
References: <20021110213716.spltd+lvmlist@force9>
Mime-Version: 1.0
In-Reply-To: <20021110213716.spltd+lvmlist@force9>; from lvmlist@spltd.f9.co.uk on Sun, Nov 10, 2002 at 09:37:16PM -0000
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
Date: Mon Nov 11 04:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Mark,

what's in your syslog WRT your problem?
What does "vgscan" say?
Does "pvscan" 'see' all your physical volumes making up the volume group?


On Sun, Nov 10, 2002 at 09:37:16PM -0000, lvmlist@spltd.f9.co.uk wrote:
> 
> Hi all,
> 
> It seems I'm up to my neck in it again :-(
> 
> Briefly, I ran out of space on my LVM mounted /home partition but as I
> have 1.5GB space free on another disk I thought I'd add that to my
> volume group and increase the size of /home. All seemed to go OK until
> reboot upon which my system can only mount / (which is independent of
> LVM). It appears that /etc/lvmtab /etc/lvmtab.d have all been deleted
> hence why it can't find LVG "system".
> /etc/lvmtab exists but is empty.
> /etc/lvmtab.d/ exists but is empty.
> /etc/lvmconf/ exists & contains system.conf.1.old and system.conf
> (newest).
> 
> System is SuSE 8.0 Pro. on i386
> Harddisks: 2 scsi mounted as
> 
> /dev/sdb1        swap
> /dev/sdb2        /
> /dev/sdb3        LVM
> 
> /dev/system/home /home
> /dev/system/usr  /usr
> /dev/system/var  /var
> 
> sda had an old installation of SuSE on it is
>  presently unused (and half the size of sdb).
> 
> Any guidance as to where to go from here would
> be appreciated pls.
> 
> Thanks,
> 
> Mark Pearson.  
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
