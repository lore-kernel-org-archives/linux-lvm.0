Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Fri, 20 Apr 2001 11:29:23 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Removal of PV
Message-ID: <20010420112923.A569@tykepenguin.com>
References: <F29e4wk2UfxhUIBSIeS000025b8@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F29e4wk2UfxhUIBSIeS000025b8@hotmail.com>; from gene_yee@hotmail.com on Mon, Apr 16, 2001 at 02:50:07PM -0700
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Apr 16, 2001 at 02:50:07PM -0700, hail narcissus wrote:
> 
> I know this has been asked before and I browsed the archives for the info.  
> But I want to be sure since I am dealing with 500+GB of data.
> 
> Here is my configuration:
> hda-h (80Gig IDE's)
> sda-n (9Gig SCSI's)
> 652.81 GB VG
> 505GB Used 140GB Free
> 
> I want to remove the SCSI drives since I am having some SCSI bus problems 
> and they are just old and I am not feeling comfortable with it's 
> reliability.
> 
> I believe this would be the proper steps:
> 
> resize2fs /dev/lv/vg 520G  <-- Is 520G correct, particularly the G.
> pvmove /dev/sda /dev/hdh   <-- Assuming /dev/hdh has free space
> pvmove /dev/sdb /dev/hdh
> pvmove /dev/sdc /dev/hdh
> ...
> lvreduce -L 520G /dev/lv/vg
> vgreduce vg /dev/sda
> vgreduce vg /dev/sdb
> vgreduce vg /dev/sdc
> 
> I saw in the mailing list where someone suggested:
> 
> ext2resize/resize2fs
> lvreduce
> pvmove
> vgreduce
> 
> But I would think you would want to do pvmove before the lvreduce.  
> Otherwise you might truncate data?

Either way round should be fine. If you're using <beta7 then, due to bugs, you
should take the volume offline before moving it though.

patrick
