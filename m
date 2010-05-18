Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4I9DlL4009280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 18 May 2010 05:13:49 -0400
Message-ID: <4BF25A40.7060304@redhat.com>
Date: Tue, 18 May 2010 10:13:36 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <AANLkTina1csDn1EAcwXOYM41r7G3TOZBSAo1lVk0tU5N@mail.gmail.com>	<20100517211459.GA7269@us.ibm.com>	<Pine.LNX.4.64.1005171721260.2347@bmsred.bmsi.com>
	<4BF225AE.3080303@gmail.com>
In-Reply-To: <4BF225AE.3080303@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] shrink VG and PV
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

On 05/18/2010 06:29 AM, kanonmatswe wrote:
> On 05/17/2010 11:30 PM, Stuart D. Gathman wrote:
> 
>> Conclusion: always use only one metadata area per PV (but on multiple PVs
>> when available).
> 
> I don't know how that second metadata area got there :)  I don't think I'm using it or will have any use for it.
> So there is no way of erasing it? If I do "backup VG, redo pvcreate with uuid&  restorefile, restore VG"
> as Alasdair said as quoted by malahal@us.ibm.com, I will erase all data, right? The solution seems to be
> roughly equivalent to backing up all data and then repartition before copying back?

No - if you carry this out correctly the data area of the drive will be
unchanged and in the final step you restore the current content of the
VG metadata to the one remaining metadata area rendering any previously
created LVs (and their contents) accessible.

You can find an example of the basic steps to re-pvcreate a PV and
restore metadata to it here:

https://www.redhat.com/archives/linux-lvm/2009-January/msg00014.html

You'll want to follow the same kind of process but make sure you add
--metadatacopies=1 to avoid recreating the PV with two copies. If you're
not sure how you ended up with this you might want to review what's in
your /etc/lvm/lvm.conf - there is a pvmetadatacopies directive in the
metadata section that can be used to set the default number of metadata
areas for new PVs:

# metadata {
 # Default number of copies of metadata to hold on each PV.  0, 1 or 2.
 # You might want to override it from the command line with 0
 # when running pvcreate on new PVs which are to be added to large VGs.
 # pvmetadatacopies = 1
[...]

Once you have done this you should be able to issue pvresize with
--physicalvolumesize as in your first post to reduce the space used by
LVM2. Once that's done you can shrink your sda2 partition (note that
this last step will likely still need a reboot - the kernel is still not
at all happy about modifying in-use partitions, even for shrinking).

Regards,
Bryn.
