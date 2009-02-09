Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n19IRGDX031182
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 13:27:16 -0500
Received: from esri3.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n19IQw4w007342
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 13:26:58 -0500
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by esri3.esri.com (8.11.7p3+Sun/8.11.6) with ESMTP id n19IQvT07213
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 10:26:57 -0800 (PST)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.1) with ESMTP id n19IQv8G001814
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 10:26:57 -0800
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id n19IQvii001812
	for linux-lvm@redhat.com; Mon, 9 Feb 2009 10:26:57 -0800
Date: Mon, 9 Feb 2009 10:26:57 -0800
From: Ray Van Dolson <rvandolson@esri.com>
Subject: Re: [linux-lvm] Dead device and cleaning up LVM
Message-ID: <20090209182657.GA1797@esri.com>
References: <20090209173514.GA1244@esri.com> <49906BCA.9070904@redhat.com>
	<20090209175804.GA1501@esri.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20090209175804.GA1501@esri.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Feb 09, 2009 at 09:58:04AM -0800, Ray Van Dolson wrote:
> On Mon, Feb 09, 2009 at 09:45:46AM -0800, Bryn M. Reeves wrote:
> > Ray Van Dolson wrote:
> > > Anyone know how I can remove this device both from the system and from
> > > LVM safely?  I can reboot, but saving that as a last resort if
> > > possible.
> > 
> > You don't mention the name of your VG/LV but you should be able to 
> > remove the active lvm devices with "dmsetup remove", e.g.:
> > 
> > dmsetup remove $VG-$LV
> > 
> > For each LV in each VG that was using the iSCSI devices.
> 
> Beautiful.  This did the trick!  I can now also unload the iSCSI kernel
> modules correctly on the initiator.
> 

Also, just an FYI in case anyone else runs across this thread... to get
my filesystem back (pvscan didn't detect the LVM at all):

  # pvcreate --uuid 3HpAVg-fRz0-HWXp-EFxK-khVO-IvN6-J4a6w1 /dev/sdb
  (Found the old UUID by examining the /etc/lvm/backup directory)
  # vgcfgrestore FTP1
  # vgchange -ay FTP1
  # fsck.ext3 /dev/FTP1/LogVol00
  # mount -a

Back in action!

Ray
