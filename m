From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Fixing corrupted LVM PV headers?
Message-Id: <20020105170323.M12868@lynx.no>
References: <3C352FFF.1946.1910201@localhost>
    <3C352FFF.1946.1910201@localhost> <20020103142740.A12868@lynx.no>
    <5.1.0.14.0.20020106044723.00b14150@pop.ihug.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5.1.0.14.0.20020106044723.00b14150@pop.ihug.com.au>;
    from timshel@pobox.com on Sun, Jan 06, 2002 at 04:55:33AM +1100
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
Date: Sat Jan  5 18:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timshel Knoll <timshel@pobox.com>
Cc: linux-lvm@sistina.com

On Jan 06, 2002  04:55 +1100, Timshel Knoll wrote:
> I still don't know what lv_cur should be - probably just 2?

Well, if you do "pvdata -E /dev/foo" it will tell you all of the PEs
on the disk, and you just count the number of different LVs shown.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
