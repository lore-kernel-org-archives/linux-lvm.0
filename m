Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n19Hjhw0003440
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 12:45:49 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n19HjUAK016251
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 12:45:30 -0500
Message-ID: <49906BCA.9070904@redhat.com>
Date: Mon, 09 Feb 2009 17:45:46 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Dead device and cleaning up LVM
References: <20090209173514.GA1244@esri.com>
In-Reply-To: <20090209173514.GA1244@esri.com>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Ray Van Dolson wrote:
> Anyone know how I can remove this device both from the system and from
> LVM safely?  I can reboot, but saving that as a last resort if
> possible.

You don't mention the name of your VG/LV but you should be able to 
remove the active lvm devices with "dmsetup remove", e.g.:

dmsetup remove $VG-$LV

For each LV in each VG that was using the iSCSI devices.

> Also, any best practices or suggestions for using iSCSI backed block
> devices as volgroup members would be appreciated.  I'm worried about
> LVM not recognizing the volume group of physical volumes correctly on
> reboots...

You might need to label any file system mounts in /etc/fstab with 
"_netdev" and enable the netfs service to have the VGs automatically 
activated/mounted at boot time.

Regards,
Bryn.
