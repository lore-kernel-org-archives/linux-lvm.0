Received: from lacrosse.corp.redhat.com (lacrosse.corp.redhat.com
	[172.16.52.154])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1QEhEZq024834
	for <linux-lvm@redhat.com>; Mon, 26 Feb 2007 09:43:14 -0500
Received: from vpn-14-248.rdu.redhat.com (vpn-14-248.rdu.redhat.com
	[10.11.14.248])
	by lacrosse.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	l1QEhDsM005312
	for <linux-lvm@redhat.com>; Mon, 26 Feb 2007 09:43:13 -0500
Subject: Re: [linux-lvm] Restoring LVM configuration
From: Dave Wysochanski <dwysocha@redhat.com>
In-Reply-To: <200702201824.l1KIO73V001649@www-webmail1.magma.ca>
References: <200702201824.l1KIO73V001649@www-webmail1.magma.ca>
Date: Mon, 26 Feb 2007 09:43:13 -0500
Message-Id: <1172500994.4170.6.camel@linux-cxyg.rtp.netapp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2007-02-20 at 13:24 -0500, Reid wrote:
> Hi,
> 
> Through a number of steps in an attempt to upgrade my server I ended up losing the
> lvm.conf configuration file and my backup of it.
> 
> Part of the problem occured when I moved the disks from one controller to another on my
> server.  For some reason the partition information was lost.  This was recovered without
> too many troubles leaving me with a boot (ext2) and lvm2 partitions on one drive and a
> lvm2 partition on the other.
> 
> I noticed on the LVM how-to that you might be able to recreate the configuration using
> pvcreate after looking at /etc/lvm/archive/VolumeGroupName_XXXXX.vg but I am unable to in
> this case because the root file system was part of the LVM itself.  (If I could mount it
> to find out the configuration then I wouldn't be having such a problem!)
> 
> Ideally I would like to be able to create a configuration using Knoppix so that I could
> mount the drives and write it onto them.  
> 
> The next best thing for me would be to find some way to get the files off of the drives
> and onto a spare drive (basically recreate my backup) without losing file names/directory
> structure.
> 

Are you still in need of help?

If so, do you know the details of your original setup that created the
LVM2 configuration (kernel version, lvm version, etc)?

I am working on a LVM command/enhancement that will read the LVM
information off the drives and allow recreation of the lvm
configuration.

Let me see if I can get something together for you to try recovery in
your situation.
