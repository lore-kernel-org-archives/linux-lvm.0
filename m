From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] newbie question
Message-ID: <20020626123400.C18125@sistina.com>
References: <20020625192848.60087.qmail@web13802.mail.yahoo.com>
Mime-Version: 1.0
In-Reply-To: <20020625192848.60087.qmail@web13802.mail.yahoo.com>; from shri_krishnan@yahoo.com on Tue, Jun 25, 2002 at 12:28:48PM -0700
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
Date: Wed Jun 26 05:41:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jun 25, 2002 at 12:28:48PM -0700, shri krishnan wrote:
> Hi,
> 
> I was wondering if linux-lvm ever requires unpartitioned space at the end
> of a disk for storing volume metadata, similar to Windows dynamic disk.
> I've skimmed the source code a bit, and from what I can tell, it seems
> that metadata is always stored at the start of each disk partition, but
> I wasn't sure if this is always the case. 

The ondisk metadata in LVM1 is *always* stored at the very start
of each block device used as a physical volume. Depending on the extent size
(see "vgchange -s") and the size of the physical volume the metadata uses
aproximatly between some 100KB and a couple of MB. You can check this
with "pvdata -PP /dev/PVDev" which will display the various parts of the
LVM1 metadata or so called VGDA (Volume Group Descriptor Area) with their
offsets and sizes.

LVM2 enhances this by supporting multiple ondisk formats and therefore
this could eventually change things in the future ie. putting metadata
redundantly at the beginning and the end of a physical volume.

> 
> Thanks, 
> 
> --shri
> 
> 
> __________________________________________________
> Do You Yahoo!?
> Yahoo! - Official partner of 2002 FIFA World Cup
> http://fifaworldcup.yahoo.com
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
