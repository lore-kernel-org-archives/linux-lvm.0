From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] extending a logical volume
Message-Id: <20020122120317.Z4014@lynx.turbolabs.com>
References: <E16Syml-0004V1-00@arwen.dev33.cvf>
    <Pine.LNX.4.10.10201221211580.24040-100000@pzat.meep.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.10.10201221211580.24040-100000@pzat.meep.org>;
    from oolon@ankh.org on Tue, Jan 22, 2002 at 12:16:27PM +0000
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
Date: Tue Jan 22 13:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Jan 22, 2002  12:16 +0000, James Hawtin wrote:
> I really which the filesystem people would add support for lvm,
> partitulary when "shrinking". At the moment you have to strink then FS,
> then strink the LVM, it scares the hell out of me that I will get the
> sizes wrong and badness would happen, ie part of the resized fs becomes
> unaddressable. (all it needs is someone to take a different definition of
> MB for example).

Please see "e2fsadm".  It will resize the LV and the ext2 fs properly.
Note also, that if it happens that you resize the LV smaller than the
fs, it is possible to just resize the LV larger again to get the end
of the fs back.  In some cases, LVM will not assign the same PE to the
LV, so you will need to restore the LVM config from backup.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
