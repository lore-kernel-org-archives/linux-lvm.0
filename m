Received: from arthur.pjc.net (vpnuser4.surrey.redhat.com [172.16.9.4])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i1KDJGxn005265
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 13:19:20 GMT
Received: from patrick by arthur.pjc.net with local (Exim 4.30)
	id 1AuAYi-0003E3-7c
	for linux-lvm@redhat.com; Fri, 20 Feb 2004 13:19:12 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] LVM reducing.
Message-ID: <20040220131910.GC3949@tykepenguin.com>
References: <4034F710.7050106@demonlord.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4034F710.7050106@demonlord.de>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 20 08:18:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Feb 19, 2004 at 06:49:04PM +0100, Christian Reiss wrote:
> Greetings,
> 
> I am running the LVM2 version now, as LVM1 corrupted the VG.
> So i converted it to LVM2 (figured it would re-do the 
> master-data-thingy), and it works.
> 
> Now, (presumably Heinz :) how can I safely reduce the size under LVM2? 
> LVM1 had this e2fsadm jiggamagic-thingy-thing - anything LVM2 offers to 
> safely reduce the data?

There is no e2fsadm for LVM2.

What I tend to do is to reduce the filesystem by a little more than I need, then
reduce the LV by the "correct" amount, then resize the the filesystem to fill
the LV. It's a little bit of a faff  but it avoids any nasty accidents or
rounding errors:

eg: To remove 2Gig from an LV

# resize_reiserfs -s -2300M /dev/vg00/fs
# lvreduce -L -2G /dev/vg00/fs
# resize_reiserfs /dev/vg00/fs

That works for ext2/3 etc as well as reiser, just use the relevant resize
command.

patrick
