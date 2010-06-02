Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o529G7oc022543
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 2 Jun 2010 05:16:08 -0400
Message-ID: <4C062136.6090601@redhat.com>
Date: Wed, 02 Jun 2010 10:15:34 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <AANLkTikmw8_d91zrpW9HFKz8d5XCkg-b8h_NdD3leR9u@mail.gmail.com>
In-Reply-To: <AANLkTikmw8_d91zrpW9HFKz8d5XCkg-b8h_NdD3leR9u@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Is it possible to bypass LVM and mount contained
 partition directly?
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

On 05/31/2010 08:21 PM, Romeo Theriault wrote:
> I apologize if this has been asked before but I was unable to find any
> references to it in the mailing list archives and googling around
> isn't helping much.
> 
> Is there a way to directly mount, bypassing LVM, a ext3 partition that
> resides in a LVM LV and VG? It resides on one PV.

If you know how the volume group is laid out on the PVs you can manually
construct device-mapper devices using the dmsetup command to get access
to the LVs in this VG. This is a bit fiddly (need to convert from
extents to sectors to pass as arguments to device-mapper) but it is
possible.

> The problem is that I have read-only copies of VM's that are backed up
> via a SAN based snapshot/backup tool. I'm trying to create a method to
> allow the VM admins to restore their files from the snapshot backed up
> VM's. I'm at the point where I can access the partitions and can mount
> the ext3 partitions fine but I'm having trouble with the LVM volumes
> because I can't import the pv/vg because they have the same name/uuid
> as the existing VG (it's really the same system) and I can't change
> them with something like vgimportclone because the backed up vm image
> files are read-only.

If you're not able to use vgimportclone then another alternative would
be to create a new copy of /etc/lvm somewhere and modify the
etc/lvm/lvm.conf that it contains so that it has a filter that excludes
everything apart from the devices containing this VG. Then you can set
LVM_SYSTEM_DIR to point to this directory and have a "sandbox" that is
restricted to just seeing the "clone" devices.

You will probably still run into problems activating LVs this way since
e.g. the device names and the VG directory in /dev will collide with the
ones used by the system VG but at least you can run the tools verbosely
this way and see the maps that would be generated for device-mapper
without having to work them out by hand.

Regards,
Bryn.
