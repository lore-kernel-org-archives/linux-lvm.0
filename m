Date: Tue, 2 Oct 2001 00:53:04 -0400
Subject: Re: [linux-lvm] how to upgrade from rh70 to rh71
Message-ID: <20011002005304.N3600@pc.ilinx>
References: <3BB94405.AA906FBD@americasm01.nt.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3BB94405.AA906FBD@americasm01.nt.com>
From: "Brian J. Murrell" <lvm@interlinx.bc.ca>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 01, 2001 at 11:35:17PM -0500, Joe Harvell wrote:
> Hmm:
> 
> I never really thought about this when I decided to put all my
> filesystems on LVM logical volumes; but how am I going to be able to
> upgrade to RedHat 7.1?

:-)

> If I remember correctly, the installer has its
> own custom kernel and root filesystem to boot into for the upgrade.

Which probably does support LVM in as much as the 0.9.whatever beta
that is in the Linus kernel does.  Your problems will likely be more
with the installer code than the kernel.

> So the redhat upgrade kernel will need to have support for RAID and
> LVM.  And it will need to run vgscan, and vgchange -ay.

Yup.

> And it will
> need to have devfs support or it will need to use mknod to make the
> directories enumerated above.

Yup.

> Does anyone know if it does all these
> things?

I doubt it.

> Am I going to have to use my own rescue disk as the platform from which
> to manually do the upgrade (by issuing the appropriate rpm commands?

That or upgrade (and it is an upgrade from redhat IMHO -- not to start
any religious wars) to Mandrake 8.1.  Mandrake's installer has had
support for LVM volumes (recognizing them, activating them, and even
creating them!) for a couple of releases now.

They appear in their "disk druid" (disk partitioner) as additional
"partitions" that can be assigned mount points, have filesystems
mounted on, etc.  The only thing they don't do yet is support root on
an LV -- I am working on that problem when time permits.  Since they
just released 8.1 I hope to have root on LVs in their next release.

By speaking up, maybe I am about to be proven that Red Hat has all of
this too, but I have never noticed it in their installer.

b.

-- 
Brian J. Murrell
