From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Can't find LVM partition
Message-ID: <20020626122427.A18125@sistina.com>
References: <C394073E4521D411ABF10006293838D605158A70@cmh0401mai01.amr.stercomm.com>
Mime-Version: 1.0
In-Reply-To: <C394073E4521D411ABF10006293838D605158A70@cmh0401mai01.amr.stercomm.com>; from Darryl_Stauffer@stercomm.com on Tue, Jun 25, 2002 at 11:33:42AM -0400
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
Date: Wed Jun 26 05:32:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jun 25, 2002 at 11:33:42AM -0400, Stauffer, Darryl wrote:
> Heinz,
> 
> When I type in pvdata /dev/sda5 I get the following output.
> 
> --- NEW Physical volume ---
> PV Name               /dev/sda5
> VG Name
> PV Size               0 [0 secs]
> PV#                   0
> PV Status             NOT available
> Allocatable           NO
> Cur LV                0
> PE Size (KByte)       0
> Total PE              0
> Free PE               0
> Allocated PE          0
> PV UUID               none
> 
> --- Volume group ---
> VG Name
> VG Access             error
> VG Status             NOT available/NOT resizable
> VG #                  0
> MAX LV                0
> Cur LV                0
> Open LV               0
> MAX LV Size           0
> Max PV                0
> Cur PV                0
> Act PV                0
> VG Size               0
> PE Size               0
> Total PE              0
> Alloc PE / Size       0 / 0
> Free  PE / Size       0 / 0
> VG UUID               none
> 
> --- List of logical volumes ---
> 
> --- List of physical volume UUIDs ---

Well, this looks like a whole lot of zeroes at the beginning of /dev/sda5 :(
Not really recoverable.

> 
> I'm assuming that it cannot find the LVM partition information.
> Unfortunately I do not have a backup copy of the /etc/lvmconf/* files.  If
> you know of anything else I could try it would be greatly appreciated.

Nope, sorry.
At least you need LVM metadata archive backups (/etc/lvmconf/*) or backups
of your data.
Both would have been better though...

Regards,
Heinz    -- The LVM Guy --


> 
> Thanks,
> Darryl
> 
> 
> -----Original Message-----
> From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]
> Sent: Tuesday, June 18, 2002 6:32 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Can't find LVM partition
> 
> 
> 
> Darryl,
> 
> as Patrick said, vgscan should find your LVM partition fine unless it got
> written over.
> 
> In case just the LVM metadata at the beginning of that partition (~ < 1MB)
> got overwritten during install, backups of /etc/lvmconf/* and
> vgcfgrestore(8)
> are your friends as Sander metioned. If more is gone you probably wont't get
> back a whole lot of useful data.
> 
> Any progress so far?
> 
> 
> On Thu, Jun 13, 2002 at 11:36:38AM -0400, Stauffer, Darryl wrote:
> > Hello,
> > 
> > I just got done upgrading from Redhat 7.2 to Redhat 7.3.  My home
> directory
> > was setup on its own partition using LVM and reiserFS.  The upgrade was
> done
> > by formatting the original root partition and reinstalling OS which means
> > that all the LVM info is gone.  Is there any way to recover my LVM
> > partition?
> > 
> > Thanks,
> > Darryl
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> -- 
> 

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
