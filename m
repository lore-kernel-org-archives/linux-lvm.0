From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Just for information ....
Message-ID: <20011120125632.Z1308@lynx.no>
References: <3BFAA389.24AAB2A1@LTUtech.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3BFAA389.24AAB2A1@LTUtech.com>; from Igor.Dumaire@LTUtech.com on Tue, Nov 20, 2001 at 07:40:09PM +0100
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
Date: Tue Nov 20 13:55:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Igor Dumaire <Igor.Dumaire@LTUtech.com>
Cc: list LVM <linux-lvm@sistina.com>

On Nov 20, 2001  19:40 +0100, Igor Dumaire wrote:
> I have 4 disks : 1 for system and 3 for data with LVM (only 1 vg).
> 
> If my system drive burn, Can I read my datas with an other system compiled
> with LVM ?

Yes.  You will need to do a vgscan to find the new disks.  Hopefully they
will not have the same VG name as another VG on that system.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
