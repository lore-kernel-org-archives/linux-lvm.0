Date: Fri, 17 Feb 2012 08:56:24 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20120217135624.GA3172@redhat.com>
References: <4F3D03AE.2050502@mohawksoft.com>
	<20120216135702.GA6212@redhat.com>
	<4F3D15CC.1080901@mohawksoft.com>
	<alpine.LRH.2.00.1202161014230.3425@bmsred.bmsi.com>
	<20120216155433.GB13948@redhat.com>
	<alpine.LRH.2.00.1202162343130.9285@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.00.1202162343130.9285@bmsred.bmsi.com>
Subject: Re: [linux-lvm] Snapshots
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
Content-Transfer-Encoding: 7bit
To: "Stuart D. Gathman" <stuart@bmsi.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Feb 16 2012 at 11:46pm -0500,
Stuart D. Gathman <stuart@bmsi.com> wrote:

> Long ago, Nostradamus foresaw that on Feb 16, Mike Snitzer would write:
> 
> >>An elegant part of the LVM system is that the device mapper kernel support is
> >>very general, and new data structures can be experimented with entirely in user
> >>code - with a script language even.  Metadata for experimental structures does
> >>not have to stored with the main metadata.
> >
> >Please note that the dm-thinp code has metadata in the kernel (on-disk
> >format for btrees, etc) much like a filesystem would have.  So there is
> >both kernel and userspace (lvm2) metadata for dm-thinp.
> 
> Yes, but isn't this loaded into the kernel via userland tools like
> device-mapper?

The 'thin-pool' and 'thin' DM device tables are loaded from userspace
via DM interfaces.

The kernel metadata isn't loaded from userspace.  It is created and/or
changed by certain actions taken from userspace (via DM messages).

> So while a kernel feature would be required for a new
> type of kernel metadata, experimental uses of existing formats can
> be done in userland.

The kernel manages the kernel's metadata.  But the LVM metadata that
userspace uses to coordinate and manage the thin devices can be
changed independently.

The thin-provisioning-tools know the kernel's metadata format and can
check it (and in the future repair it).
