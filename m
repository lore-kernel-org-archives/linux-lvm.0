Message-ID: <C9B993D4214AD511BC010002A537DFE30A8BD5@acsexchweb.corp.acsalaska.com>
From: "Nay, Shawn" <snay@acsalaska.com>
Subject: RE: [linux-lvm] only found 0 of 5120 LEs for LV
MIME-Version: 1.0
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
Date: Fri Nov 30 16:28:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Andreas Dilger' <adilger@turbolabs.com>
Cc: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Well the pvdata -E output for my drives was empty, no LV's listed.

This is kind of disappointing.  I have been using LVM under AIX for some
time and am familiar with the concepts and it's not that complicated.  I
have been able to import, export, and manipulate disks as I please under the
linux.  Once I rebuild my OS though, using the same version of LVM and its
tools, I am out of luck performing an import.  The only thing that I am not
doing that I should be is performing a proper export before the rebuild.  I
have been using vgimport -f to force the import of my VG.  

I have not seen any posts in regards to this same problem which would lead
me to believe that it is something that I am doing wrong.  Am I just missing
a step that is obvious to everyone else?  Is there something that I need to
manually do in /etc concerning my disks and LVM?

Thanks for the help,
Shawn


-----Original Message-----
From: Andreas Dilger [mailto:adilger@turbolabs.com]
Sent: Friday, November 30, 2001 12:06 PM
To: Nay, Shawn
Cc: 'linux-lvm@sistina.com'
Subject: Re: [linux-lvm] only found 0 of 5120 LEs for LV


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


This transmittal may contain confidential information intended solely for
the addressee. If you are not the intended recipient, you are hereby
notified that you have received this transmittal in error; any review,
dissemination, distribution or copying of this transmittal is strictly
prohibited. If you have received this communication in error, please notify
us immediately by reply or by telephone (collect at 907-564-1000) and ask to
speak with the message sender. In addition, please immediately delete this
message and all attachments. Thank you.
