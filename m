Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m389F8n7009347
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 05:15:08 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.235])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m389EomR025945
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 05:14:50 -0400
Received: by wx-out-0506.google.com with SMTP id t16so1763937wxc.6
	for <linux-lvm@redhat.com>; Tue, 08 Apr 2008 02:14:50 -0700 (PDT)
Message-ID: <69649d440804080214v706eedf3m50e443182a1827ae@mail.gmail.com>
Date: Tue, 8 Apr 2008 10:14:49 +0100
From: "Jess Bromley" <j.bromley@bristol.ac.uk>
Sender: jess.bromley@googlemail.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] LVM mirroring questions...
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
To: linux-lvm@redhat.com

Hi all,

I've been trying to find out about LVM mirroring, but it's hard to
find much information in the documentation.

Is mirroring considered stable/ready for production use yet?  "man
lvcreate" and "man lvconvert" suggest that the current stable versions
support creating mirrored volumes, but the HOWTO has nothing to say
about it.

On a more detailed note, what sort of size does the physical volume
for the disk log need to be in relation to the size of the logical
volume to be mirrored, and is there any way to specify which physical
volume will hold the disk log (either using lvconvert or lvcreate)?

I've got a situation where I want to mirror only a partition of a
physical disk on to that of another physical disk, not the whole disk;
so software/hardware RAID isn't an option.

Thanks for your help,
J Bromley
