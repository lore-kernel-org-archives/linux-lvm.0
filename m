Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n19IrId5017437
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 13:53:18 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n19IrFtJ022418
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 13:53:15 -0500
Message-ID: <49907BAB.7000204@redhat.com>
Date: Mon, 09 Feb 2009 18:53:31 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Dead device and cleaning up LVM
References: <20090209173514.GA1244@esri.com>
	<49906BCA.9070904@redhat.com>	<20090209175804.GA1501@esri.com>
	<20090209182657.GA1797@esri.com>
In-Reply-To: <20090209182657.GA1797@esri.com>
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
> On Mon, Feb 09, 2009 at 09:58:04AM -0800, Ray Van Dolson wrote:
>> On Mon, Feb 09, 2009 at 09:45:46AM -0800, Bryn M. Reeves wrote:
>>> Ray Van Dolson wrote:
>>>> Anyone know how I can remove this device both from the system and from
>>>> LVM safely?  I can reboot, but saving that as a last resort if
>>>> possible.
>>> You don't mention the name of your VG/LV but you should be able to 
>>> remove the active lvm devices with "dmsetup remove", e.g.:
>>>
>>> dmsetup remove $VG-$LV
>>>
>>> For each LV in each VG that was using the iSCSI devices.
>> Beautiful.  This did the trick!  I can now also unload the iSCSI kernel
>> modules correctly on the initiator.
>>
> 
> Also, just an FYI in case anyone else runs across this thread... to get
> my filesystem back (pvscan didn't detect the LVM at all):
> 
>   # pvcreate --uuid 3HpAVg-fRz0-HWXp-EFxK-khVO-IvN6-J4a6w1 /dev/sdb

If you also specify "--restorefile=" and the path to the current 
metadata backup in /etc/lvm, pvcreate will ensure that the new PV can 
accommodate the VG you want to restore to it. It'll almost certainly 
always work without this if you always use the default options but by 
specifying --restorefile you can be completely sure.

>   (Found the old UUID by examining the /etc/lvm/backup directory)
>   # vgcfgrestore FTP1
>   # vgchange -ay FTP1
>   # fsck.ext3 /dev/FTP1/LogVol00
>   # mount -a
> 
> Back in action!

Glad to hear it!

Regards,
Bryn.
