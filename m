From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM and HD-crash
Message-ID: <20011109102024.B19131@sistina.com>
References: <200111081420.fA8EKcu06482@mailgate5.cinetic.de>
Mime-Version: 1.0
In-Reply-To: <200111081420.fA8EKcu06482@mailgate5.cinetic.de>; from mnospers@web.de on Thu, Nov 08, 2001 at 03:20:38PM +0100
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
Date: Fri Nov  9 03:24:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Markus,

you need to replace the failed drive, set up the same partition table
you had on the gone one and vgcfgrestore(8) LVMs metadata to it.
See the manual page of vgcfgrestore for details.
vgscan + "vgchange -ay" should then bring your VG back to life.

Getting data back makes only sense, if you've got LVs, which *don't* have any
extents allocated on the gone drive. Otherwise your filesystem
stored in there will complain loudly cause of missing data and metadata.

If you need more redundancy, please think of soft/hard RAID.

Regards,
Heinz    -- The LVM Guy --

On Thu, Nov 08, 2001 at 03:20:38PM +0100, mnospers@web.de wrote:
> Hi
> 
> I've a little question... I know, it could be answered in the past,
> but I didn't found it :( 
> What about Crashes of Harddisks in a LVM ?
> I have 3 HDs in it, and one seemes to be crashed.
> All the 3 where together in one big LV.
> Is there any possibilitie to get some of the data back ?
> I mean, the data of the 2 working HDs ? 
> Or doI have to accept, that all data on the 3 disks is lost?
> 
> thx
> Markus
> 
> ______________________________________________________________________________
> Keine verlorenen Lotto-Quittungen, keine vergessenen Gewinne mehr!
> Beim WEB.DE Lottoservice: http://tippen2.web.de/?x=7
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
