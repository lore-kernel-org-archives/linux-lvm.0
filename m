From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems restoring the vg metadata
Message-ID: <20020523192459.D13788@sistina.com>
References: <6D51028899FFD111A95500805FA7465708B5395B@sbkmxsmb04>
Mime-Version: 1.0
In-Reply-To: <6D51028899FFD111A95500805FA7465708B5395B@sbkmxsmb04>; from Diana.Caballero@dowjones.com on Wed, May 22, 2002 at 05:57:24PM -0400
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
Date: Thu May 23 12:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Diana,

because you overwrote the LVM metadata on the 'fragged' disk, you
need to run pvcreate on it before vgcfgrestore.

Depending on which version of the LVM tools you are running, you might
have a physical volume uuid flaw preventing vgscan from finding your
volume group too :-(

If you still have problems after that, please send the error output
of "vgscan -d" to me directly (mge@sistina.com) for further help.

Regards,
Heinz    -- The LVM Guy --


On Wed, May 22, 2002 at 05:57:24PM -0400, Caballero, Diana wrote:
> Hi,
> 
> I'm running SuSe Linux 7 (Server Edition for an S/390) kernel 2.4.7 as an
> image on an IBM Mainframe. I was provided additional disks (dasd) to
> configure into LVM. I added these new disks into LVM but I did not create a
> file system on them. While trying to add other disks from the mainframe into
> Linux, I accidentally fragged one of the new disks (with no file system) in
> one of my volume groups which caused all of the volume group to become
> corrupted and go down. I was able to restore the volume group metadata once
> and then when I rebooted, I got an error stating that group no longer
> existed. Is there a step I am missing?
> 
> This is what I did the first time when it worked:
> 
> vgcfgrestore -f /etc/lvmconf/oradg.conf -n oradg /dev/dasdg1
> vgck oradg
> vgscan (I can't remember the error it gave back)
> fsck -t ext2 /dev/oradg/ora01 (Repeated this for the other mounted file
> systems)
> mount /dev/oradg/ora01 (Repeated this for the other mounted file systems and
> I verified the data in there and that I could create/delete data)
> 
> I rebooted and it stated it could not find oradg in the /etc/lvmtab
> 
> I checked the lvmtab and it no longer had the entry for this oradg group. 
> 
> I was able to boot up the system without the oradg group and then I
> proceeded to do the following:
> 
> vgcfgrestore -f /etc/lvmconf/oradg.conf -n oradg /dev/dasdg1
> vgck oradg
> vgscan (An error reported lvmtab and the kernel do not match)
> vgchange -a oradg
> vgscan (An error reported lvmtab and the kernel do not match)
> 
> I rebooted the image without this group to start fresh and then I did:
> 
> vgcfgrestore -f /etc/lvmconf/oradg.conf -n oradg /dev/dasdg1
> vgck oradg
> 
> Am I missing a step or doing something incorrectly?
> 
> Please advise.
> 
> Diana G. Caballero
> Systems Administration Consultant
> DJ Interactive/Factiva.com
> http://djinteractive.com
> http://global.factiva.com
> email:  diana.caballero@dowjones.com
> Phone:  609-520-7882
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
