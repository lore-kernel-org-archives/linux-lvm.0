From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] still problems with removing "non existant" dead snapshots :/
Message-ID: <20021024132538.A30725@sistina.com>
References: <3DB7C2FD.9C70E084@silicide.dk>
Mime-Version: 1.0
In-Reply-To: <3DB7C2FD.9C70E084@silicide.dk>; from jon+lvm@silicide.dk on Thu, Oct 24, 2002 at 11:53:01AM +0200
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
Date: Thu Oct 24 06:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Jon,

which LVM version are you using?
If the driver it is older than 1.0.5 it can be a lockking bug fixed in
the recent LVM1 version.

Regards,
Heinz    -- The LVM Guy --


On Thu, Oct 24, 2002 at 11:53:01AM +0200, Jon Bendtsen wrote:
> I take a snapshot every hour, every 8 hour, eveyr day, and every week.
> I've got 4 "equal" scripts to do the work, the only difference is the
> snapshot name and the mountpoint.
> 
> However, when i try to remove the old and unmounted snapshot, i
> sometimes
> get an error message. Like one in every 10 times.
> 
> I get messages like:
> --------------------
> lvremove -- can't remove open snapshot logical volume
> "/dev/optVG/1hour_snapshot_opt_1035237601"
> 
> And:
> ----
> lvremove -- ERROR "lv_release(): LV number" releasing logical volume
> "/dev/optVG/1hour_snapshot_opt_1035324001"
> 
> 
> If i use lvdisplay on them, i get a message like
> ------------------------------------------------
> ve:/dev/optVG# lvdisplay /dev/optVG/1hour_snapshot_opt_1035*
> lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035324001"
> doesn't exist
> 
> lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035345601"
> doesn't exist
> 
> lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035352801"
> doesn't exist
> 
> lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035381601"
> doesn't exist
> 
> lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035410401"
> doesn't exist
> 
> lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035432001"
> doesn't exist
> 
> lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035439201"
> doesn't exist
> 
> 
> 
> The problem is that these snapshots take up space. Most take 1GB, since
> thats what they
> are created with, but some take more, since i run some scripts to ensure
> that they dont
> reach 100% so they are always readable.
> I can remove the "files" from /dev/optVG/, but the space is not released
> until i
> restart the VG. Even restarting the VG doesnt remove the "dead"
> snapshots (the files
> in /dev/optVG/)
> 
> 
> 
> JonB
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
