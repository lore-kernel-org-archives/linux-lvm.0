From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm cannot vgchange -a y _pv_get_number failed
    for rdev = 65535
Message-Id: <20020211192222.B31248@sistina.com>
References: <Pine.GSO.4.30.0202111056330.13668-100000@persius.rz.uni-potsdam.de>
MIME-Version: 1.0
In-Reply-To: <Pine.GSO.4.30.0202111056330.13668-100000@persius.rz.uni-potsdam.de>;
    from lglnberg@rz.uni-potsdam.de on Mon, Feb 11, 2002 at 11:17:15AM +0100
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
Date: Mon Feb 11 12:24:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Well, this means that your copy on write exception table got toasted :-(

Check out top of LVM CVS at www.sistina.com (follow guidelines for CVS access
provided there) which contains a "-r" (or --remove_snapshots) option for
vgscan. That option removes *all* snapshots of all or a particular VG
at VG activation time so that vgchange can activate VGs afterwards.

For eg. "vgscan -r vg00" would try to activate all VGs and
remove all snapshots in the VG named "vg00".


On Mon, Feb 11, 2002 at 11:17:15AM +0100, Lars-Gunnar Ellenberg wrote:
> 
> hi,
> I found only three matches, two postings, for this, and no solution. may
> be you solved this problem back then, and can tell me about it.
> 
> I cannot vgchange -a y :
> _pv_get_number_failed for rdev = 65535
> _lvm_snapshot_fill_COW_page failed
> 
> (I once toyed around with a snapshot, but never used it actually, and
> obviously never removed it again)
> 
> so is there an "easy" solution except recreating the whole thing and
> hoping for some recent backup (which I doubt...)
> 
> if theres no solution, is there a way to dd the data somewhere
>  and mount -o loop it to get the data back?
> 
> 
> --                                                       ,,,
> 
>  -- Lars                                                (o o)
>                                                   ---o00-(_)-00o----
> 
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
