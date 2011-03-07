Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p27DSU3R013073
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2011 08:28:31 -0500
Message-ID: <4D74DD7E.2060006@redhat.com>
Date: Mon, 07 Mar 2011 13:28:30 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <4D74D9AC.4060800@onet.eu>
In-Reply-To: <4D74D9AC.4060800@onet.eu>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Question about setting of UUID
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 03/07/2011 01:12 PM, sdrb wrote:
> 
> Hello,
> 
> I have got question regarding setting of UUID for PV, VG and LV.
> 
> I'd like to ask if there are any plans to add possibility of manual 
> setting and changing UUIDs?
> I mean if it could be possible to change UUID of PV just by typing:
> 
>    # pvchange -s aaaaaaaabbbbbbbbccccccccdddddddd /dev/sdb
> 
> and analogous changes in lvchange and vgchange?

The pvchange and vgchange commands can already generate a new random UUID for
PVs and VGs (man 8 pvchange/vgchange):

       -u, --uuid
              Generate new random UUID for specified Volume Groups.

And you can specify any UUID you like for PVs with pvcreate (man 8 pvcreate):

       -u, --uuid uuid
              Specify the uuid for the device.  Without this option, pvcreate
              generates a random uuid.  All of your physical volumes must have
              unique uuids.   You  need  to  use this option before restoring a
              backup of LVM metadata onto a replacement device - see
              vgcfgrestore(8).

You can also use pvcreate (with -ff/-y) to re-create an existing PV (without
modifying its data areas) with a UUID of your choosing. After doing this you can
restore VG metadata to the PV with vgcfgrestore (to ensure the newly re-created
PV is compatible with the intended VG layout you should also pass
--restorefile=/path/to/file to pvcreate when setting the UUID).

Afaik there's no --uuid option to lvchange but since all LV UUIDs are derived
from the respective VG UUID changing the VG should also change all the LVs it
contains.

Regards,
Bryn.
