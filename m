From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Thank you...
Message-ID: <20030414112914.B27553@sistina.com>
References: <200304102047.h3AKlVOq015150@disgustapated.emc.usi.net>
Mime-Version: 1.0
In-Reply-To: <200304102047.h3AKlVOq015150@disgustapated.emc.usi.net>; from travis@usi.net on Thu, Apr 10, 2003 at 04:47:31PM -0400
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
Date: Mon Apr 14 04:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Apr 10, 2003 at 04:47:31PM -0400, travis@usi.net wrote:
> Hello All,
> 
> 	Just wanted to give a special thanks to Anders Widman
> and Heinz Mauelshagen for their help in resolving the error
> condition I was receiving with my disk devices while trying to
> run vgexport.  It was, in fact, duplicate PV entries in the
> directory /etc/lvmconf  Apparently, the devices were used
> previously as part of another volume group and the entries were
> never cleaned up!  I am back up and running now so thanks!
> 
> 	I have a quick question on the ability of LVM with 
> respect to redudant paths.  With my HP servers we are able
> to run vgextend after vgcreate has created a volume group to
> indicate an alternate path.  Like so:
> 
> 	# pvcreate /dev/rdsk/c2t0d1
> 	# pvcreate /dev/rdsk/c2t1d1
> 	# mkdir /dev/vgoradata
> 	# mknod <truncated>
> 	# vgcreate /dev/vgoradata /dev/dsk/c2t0d1
> 	<Now, here is what I would like to do with 
> 	LVM on Linux>
> 	# vgextend /dev/vgoradata /dev/dsk/c2t1d1
> 	# lvcreate -l 4000 -n oradata /dev/vgoradata
> 	# lvextend -m 1 /dev/vgoradata/oradata
> 
> Now, I am using 1.0.3 and before I tear my current setup down
> I was wondering if there is a way to do the same thing with
> LVM for Linux (maybe 2.0 supports this???).  Okay, again, thank
> you for your time!!!

Travis,

IBM Germany coded a multipath extension for LVM1 which got included
in the SuSE distribution (not supported by Sistina).
You should be able to get patches from them.

Because Sistina offers LVM2/device-mapper (L)GPLed which gets all new
features added, we discontinued to add any new features to LVM1 about
a year ago. We _do_ support LVM1 (bug fixes, user support).

We are close to the LVM2.0 release which will be LVM1 feature compatible.

Multipathing (or redundant paths) is a planned 2.2 feature.

> 
> Cheers,
> Travis
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
