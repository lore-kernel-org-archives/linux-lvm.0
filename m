From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] only found 0 of 5120 LEs for LV
Message-ID: <20011130140613.M15936@lynx.no>
References: <C9B993D4214AD511BC010002A537DFE30A8BD2@acsexchweb.corp.acsalaska.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C9B993D4214AD511BC010002A537DFE30A8BD2@acsexchweb.corp.acsalaska.com>; from snay@acsalaska.com on Fri, Nov 30, 2001 at 09:20:15AM -0900
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
Date: Fri Nov 30 15:04:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nay, Shawn" <snay@acsalaska.com>
Cc: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Nov 30, 2001  09:20 -0900, Nay, Shawn wrote:
> Still no go.
> I am now running 2.4.16 (linux) with 1.0.1 lvm.  pvscan finds my disks,
> vgscan finds the inactive volume group, but I still get the error:
> 
> vgscan output:
> > vgscan -- reading all physical volumes (this may take a while...)
> > vgscan -- found inactive volume group "sundogvg"
> > vgscan -- only found 0 of 5120 LEs for LV /dev/sundogvg/datalv (0)
> > vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
> > data of volume group "sundogvg" from physical volume(s)
> > vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
> > "/etc/lvmtab" and "/etc/lvmtab.d
> 
> My previous email and the response to it are below.  Any help is still
> appreciated.

Send the output of "pvdata -E /dev/whatever" for all the PVs, and we can
see if your LV even exists anymore.  If it is overwritten, I'm wondering
if this is the same bug as hit Lars.  Maybe related to the recent change
to zero out unused parts of the VGDA.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
