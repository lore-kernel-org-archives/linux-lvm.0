Received: from o.ww.redhat.com (vpn50-23.rdu.redhat.com [172.16.50.23])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i3UApuNv028610
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 12:51:56 +0200
Date: Fri, 30 Apr 2004 12:49:47 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] About extending partiton with lvm+ext3
Message-ID: <20040430104947.GA15691@redhat.com>
References: <200404261903.i3QJ3HTk030443@smtp.doruk.net.tr>
	<20040426222921.GB16292@redhat.com>
	<20040427121034.GG2990@tangerine.coulon.evette>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20040427121034.GG2990@tangerine.coulon.evette>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Apr 27, 2004 at 02:10:34PM +0200, Jean-Luc Coulon (f5ibh) wrote:
> Le 27.04.2004 00:29:21, Heinz Mauelshagen a �crit�:
> >On Mon, Apr 26, 2004 at 09:59:54PM +0300, Vahric MUHTARYAN wrote:
> >> Hi Everybody ,
> >>
> >> I'm reading lvm-how to and I wonder those any tools like e2fsadm ,
> >> ext2resize ?!! in Redhat ... Because I want to exten ext3
> >>
> >> Does command for only ext2 ?!
> >
> >Yes.
> 
> You can resize an ext3 filesystem with the resize2fs command. Both  
> enlarge or shrink it.

Well, of course. ext3 is identical metadata-wise.

> But : this is allowed only on an *offline* (umounted) filsystem,  
> resize2fs doesnt take care of the underlaying partition, you have to  
> enlarge the partition (logical volume) before an enlarge operation or  
> shrink it after a shrink operation.
> 
> man 8 resize2fs
> 
> <<
> RESIZE2FS(8)
> 
> NAME
>       resize2fs - ext2/ext3 file system resizer
> 
> [ ... ]
> >>
> 
> Do the operation as following:
> -unmount the logical volume holding the filesystem you want to enlarge
> -lvwextend to enlarge the partition
> -resize2fs to enlarge the filesystem
> -remount the logical volume
> 
> --
> 		- Jean-Luc
> >
> >>
> >> # export E2FSADM_RESIZE_CMD=ext2resize
> >> # e2fsadm /dev/ops/batch -L+500M
> >>
> >> Thanks Everybody ...
> >> Vahric
> >
> >--
> >
> >Regards,
> >Heinz    -- The LVM Guy --
> >



> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
