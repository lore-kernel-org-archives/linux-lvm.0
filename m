From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] OK...interesting dilemma...
Message-ID: <20011101212119.S16554@lynx.no>
References: <20011102022256.536AC182DE@skuld.wookimus.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011102022256.536AC182DE@skuld.wookimus.net>; from chewie@wookimus.net on Thu, Nov 01, 2001 at 08:22:56PM -0600
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
Date: Thu Nov  1 22:22:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Chad C. Walstrom" <chewie@wookimus.net>
Cc: linux-lvm@sistina.com

On Nov 01, 2001  20:22 -0600, Chad C. Walstrom wrote:
> workstation system.  The active volume group is correctly using the SCSI
> drive with a name of vg01.  The inactive IDE harddrive also has a volume
> group named vg01.  Herein lies my question.  Can I use vgrename to
> rename the inactive volume?
> 
>     e.g. vgrename vg01 /dev/vg02

Did you vgexport that VG?  If so, when you vgimport it you can give it
a new name.

> Will it correctly choose the inactive volume?

Probably not if you use vgrename.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
