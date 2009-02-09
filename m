Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n19I12SD011532
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 13:01:27 -0500
Received: from esri3.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n19HwVJ4023372
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 12:59:22 -0500
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by esri3.esri.com (8.11.7p3+Sun/8.11.6) with ESMTP id n19Hw4T02975
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 09:58:04 -0800 (PST)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.1) with ESMTP id n19Hw5fa001521
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 09:58:05 -0800
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id n19Hw4Nr001519
	for linux-lvm@redhat.com; Mon, 9 Feb 2009 09:58:04 -0800
Date: Mon, 9 Feb 2009 09:58:04 -0800
From: Ray Van Dolson <rvandolson@esri.com>
Subject: Re: [linux-lvm] Dead device and cleaning up LVM
Message-ID: <20090209175804.GA1501@esri.com>
References: <20090209173514.GA1244@esri.com> <49906BCA.9070904@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49906BCA.9070904@redhat.com>
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

On Mon, Feb 09, 2009 at 09:45:46AM -0800, Bryn M. Reeves wrote:
> Ray Van Dolson wrote:
> > Anyone know how I can remove this device both from the system and from
> > LVM safely?  I can reboot, but saving that as a last resort if
> > possible.
> 
> You don't mention the name of your VG/LV but you should be able to 
> remove the active lvm devices with "dmsetup remove", e.g.:
> 
> dmsetup remove $VG-$LV
> 
> For each LV in each VG that was using the iSCSI devices.

Beautiful.  This did the trick!  I can now also unload the iSCSI kernel
modules correctly on the initiator.

Thanks,
Ray
