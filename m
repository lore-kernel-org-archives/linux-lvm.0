Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n4BHOaFZ003856
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 13:24:36 -0400
Subject: Re: [linux-lvm] removing a missing vg
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <f4f537b50905111017p4edc87ccl1d0eb2d71c834a58@mail.gmail.com>
References: <f4f537b50905111017p4edc87ccl1d0eb2d71c834a58@mail.gmail.com>
Date: Mon, 11 May 2009 18:27:54 +0100
Message-Id: <1242062874.13505.387.camel@breeves.fab.redhat.com>
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

On Mon, 2009-05-11 at 12:17 -0500, Eugene Vilensky wrote:
> Hi folk,
> 
> I tried to remove some NetApp LUNs from a RHEL 4.6 system, and
> originally stale mappings remained in multipath -ll which I was not
> able to flush.  In production instance, I am unable to remove the
> multipath mappings because the vg is missing.  How can I deactivate a
> missing vg?

dmsetup remove <device name>

In the future you probably want to unmount file systems, deactivate
volume groups, delete kpartx mappings etc. and flush the multipath
devices from the host before you delete the LUNs from the storage.

This way everything on the Linux side can finish up cleanly and you
aren't left with stale devices lying around.

> However, the four paths remain in my /dev/ heirarchy, and vgscan
>  returns this for each of the devices that are no longer really there:
> 
> /dev/sdf: read failed after 0 of 4096 at 0: Input/output error

Once you've made sure nothing's left that's using these you should be
able to remove the SCSI device using sysfs:

echo 1 > /sys/block/<dev>/device/delete

For each SCSI device that you have removed.

Regards,
Bryn.
