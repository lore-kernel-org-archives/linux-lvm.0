From: lembark@wrkhors.com
Subject: Re: [linux-lvm] Does LVM detect drive failures?
Message-ID: <320450000.1005068617@duke.wrkhors.com>
In-Reply-To: <20011106172021.75477.qmail@web20003.mail.yahoo.com>
References: <20011106172021.75477.qmail@web20003.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Tue Nov  6 11:43:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Quentin Arce <qarce@yahoo.com>


-- Quentin Arce <qarce@yahoo.com> on 11/06/01 09:20:21 -0800

> Hello,
> 
>  I'm not on the mailing list so please reply to all. 
> Thanks.
> My question is does LVM detect drive failures?  I am
> thinking about building two small logical volumes of 2
> drives each then mirroring them using md.  I know md
> will detect that the array contains a failed drive
> under normal conditions, but I would think that in
> this case an entire logical volume would have to fail
> in order for it to be detected.  That is unless I can
> watch my logs for LVM giving me an error like I do for
> md errors.
> 
>  One other question... I'll search the md info if no
> one knows this off the top...  does the md layer store
> info about the size of the drive on the drive?  I'm
> worried about adding more dives to a logical volume
> which is a part of a md stripe.

LVM is going to have more problems with hardware failures
than RAID. You are better off building VG's out of mirrored
PV's (or, if you have 2+ drives w/tih 4+ partitions use
RAID5). The RAID will keep PV's available for LVM.

--
Steven Lembark                              2930 W. Palmer
Workhorse Computing                      Chicago, IL 60647
                                           +1 800 762 1582
