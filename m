From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Message-Id: <20020317180920.A9996@sistina.com>
References: <20020315205256.GA743@antimony.sistina.com>
MIME-Version: 1.0
In-Reply-To: <20020315205256.GA743@antimony.sistina.com>; from
    lewis@sistina.com on Fri, Mar 15, 2002 at 02:52:57PM -0600
Subject: [linux-lvm] Re: [lvm-devel] *** ANNOUNCEMENT *** LVM 1.1-rc1 available at
 www.sistina.com
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
Date: Sun Mar 17 11:11:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lvm-devel@sistina.com, linux-lvm@sistina.com

Thanks AJ!

And I even forgot to mention writable snapshots and pvresize ;-)
Need to rework CHANGELOG later...

Regards,
Heinz    -- The LVM Guy --


On Fri, Mar 15, 2002 at 02:52:57PM -0600, AJ Lewis wrote:
> Hi all - Heinz is unavailable, so I'm sending this out for him:
> 
> LVM 1.1-rc1 release candidate supports both version 1 and 2 of the metadata.
> 
> Disclaimer:
> -----------
> This is not meant to be used on production systems!
> 
> 
> There's *no* need to run any metadata update tools.
> 
> Please test this release candidate and feed back results to the linux-lvm
> list in order to help us to release 1.1 ASAP.
> 
> A tarball is available now at
> 
>    <http://www.sistina.com/>
> 
> for download (Follow the "LVM 1.1-rc1" link).
> 
> 
> Changes to LVM 1.1-rc1 include:
> 
> o volume group quorum support is in enabling optional activation of volume
>   groups (vgchange -qn) in case at least one physical volume out of many is
>   still accessable enabling retrieval of data in logical volumes allocated
>   on the accessable devices
> 
> o vgimport supports importing by volume group name rather than requiring
>   a physical volume list
> 
> o creation of metadata backup files in /etc/lvmtab* and metadata archives in
>   /etc/lvmconf/ is now optional to help saving space for eg. on ram disks.
>   If vgscan is not run at all and /etc/lvmtab* are removed, no backup files
>   will be created.  If vgcfgbackup is not run at all and /etc/lvmconf/ is
>   removed, no archive files will be created.
> 
> o locations of metadata backups and archives are configurable through
>   environment varibles LVM_BACKUP_INDEX/LVM_BACKUP_DIR and LVM_ARCHIVE_DIR
>   respectively
> 
> o volume group static mode in order to avoid all configuration changes to a
>   volume group once set. This is useful to 'freeze' a volume group in order
>   to activate it in a cluster of for fail-over configurations
> 
> o the llseek cast bug has been fixed, which caused pvmove to fail beyond the
>   2GB offset
> 
> 
> o more...
> 
> 
> See the CHANGELOG file contained in the tarball for further information.
> 
> Feed back LVM related information to <linux-lvm@sistina.com>.
> 
> Thanks a lot for your support of LVM.
> 
> -- 
> AJ Lewis
> Sistina Software Inc.                  Voice:  612-638-0500
> 1313 5th St SE, Suite 111              E-Mail: lewis@sistina.com
> Minneapolis, MN 55414
> http://www.sistina.com
> 
> Current GPG fingerprint =  7792 2F3E 9D86 DA4C 9111 7837 982D 737B 9DBC 4EC9
> -----Begin Obligatory Humorous Quote----------------------------------------
> Sticks and stones may break my bones, and so would an 80 lb. carrot.
> -----End Obligatory Humorous Quote------------------------------------------

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
