Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p6UIFonR031356
	for <linux-lvm@redhat.com>; Sat, 30 Jul 2011 14:15:50 -0400
Received: from Vail.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6UIFmXQ032477
	for <linux-lvm@redhat.com>; Sat, 30 Jul 2011 14:15:48 -0400
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by Vail.esri.com (8.13.7+Sun/8.13.7) with ESMTP id p6UIFmtt024701
	for <linux-lvm@redhat.com>; Sat, 30 Jul 2011 11:15:48 -0700 (PDT)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.4/8.14.3) with ESMTP id p6UIFmTk032080
	for <linux-lvm@redhat.com>; Sat, 30 Jul 2011 11:15:48 -0700
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.4/8.14.3/Submit) id p6UIFmev032079
	for linux-lvm@redhat.com; Sat, 30 Jul 2011 11:15:48 -0700
Date: Sat, 30 Jul 2011 11:15:48 -0700
From: Ray Van Dolson <rvandolson@esri.com>
Message-ID: <20110730181547.GA31928@esri.com>
References: <97485ADD3BBC4386A165837AEB179590@Chimpanzeke>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97485ADD3BBC4386A165837AEB179590@Chimpanzeke>
Subject: Re: [linux-lvm] Please help me recover my LVM configuration
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Fri, Jul 29, 2011 at 08:30:25PM -0700, David Ziring wrote:
> Hi all,
>  
> I’m hoping I can get some help recovering my data.  A week or so back I
> accidentally overwrote the partition table on one of the two drives containing
> my data.  I luckily didn’t touch the partition itself, so I believe all the
> data is still there, but in rebuilding the partition table I (think I) nuked
> the uuid of the drive.  Now I’m not sure how to progress. 
> Please help this relative neophyte – there is a lot of nostalgia sitting on
> those drives.  Tell me what information you need and I will get it.
>  
> DZ

Was the lost partition also the one housing /etc/lvm?  If not, you can
get the UUID that way....

If it was, fortunately LVM keeps metadata information about itself.
You should able to dump it via:

     dd if=/dev/sda2 bs=512 count=255 skip=1 of=/tmp/sda2.txt

Where /dev/sda2 is your LVM partition.

You can then examine the output file with "strings" and pull out the
UUID information or even completely recreate your configuration files.

What I have done in the past is to just examine this information and
then use dmsetup to create a temporary device, mount it and copy out
the information from /etc/lvm.

Then it's the standard vgcfgrestore dance...

Dumped some instructions from a work wiki here that may be of help
(sorry it's PDF):

    http://www.bludgeon.org/~rayvd/files/LVM_Missing_Metadata.pdf

Ray
