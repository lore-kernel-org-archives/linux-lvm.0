From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Lost Disk, System Recovery
Message-ID: <20030620111419.B29306@sistina.com>
References: <002501c335f4$089c9e00$6601a8c0@ajf>
Mime-Version: 1.0
In-Reply-To: <002501c335f4$089c9e00$6601a8c0@ajf>; from afabian@anjero.com on Wed, Jun 18, 2003 at 07:47:49PM -0400
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
Date: Fri Jun 20 04:28:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andrew,

see my mail (Subject: PV and disk recovery) dated May 27 on this list.

On Wed, Jun 18, 2003 at 07:47:49PM -0400, Andrew Fabian wrote:
> I'm having a problem that sounds similar to the one described in http://lists.sistina.com/pipermail/linux-lvm/2003-February/013420.html.  I lost one disk out of a four-disk VG.  I'm 99% sure the disk was empty at the time.  Now I can't get vgscan to recognize the VG.  pvscan displays:
> 
> pvscan -- inactive PV "/dev/hdg1" is associated to unknown VG "vg" (run vgscan)
> pvscan -- inactive PV "/dev/hdh1" is associated to unknown VG "vg" (run vgscan)
> pvscan -- inactive PV "/dev/hdc2" is associated to unknown VG "vg" (run vgscan)
> pvscan -- total: 3 [69.92 GB] / in use: 3 [69.92 GB] / in no VG: 0 [0]
> 
> and vgscan displays:
> 
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "vg" from physical volume(s)
> 
> I tried running vgcfgrestore -f /mnt/etc/lvmconf/vg.conf /dev/hdg1 (I'm running knoppix off of a CD at the moment, with my root partition mounted on /mnt) and got the response:
> 
> vgcfgrestore -- this is a backup of volume group "vg"
> vgcfgrestore -- physical volume "/dev/hdg1" doesn't belong to volume group "vg"
> 
> Same result for each other disk.  Any ideas how to get the three remaining disks up and running?  Thanks.
> 
> Andrew Fabian
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
