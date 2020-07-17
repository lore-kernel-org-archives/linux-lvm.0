Date: Fri, 17 Jul 2020 11:20:32 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200717162032.GA12965@redhat.com>
References: <0B6E7FBE-CE2B-4A2F-8560-A47218C0B511@exonet.nl>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0B6E7FBE-CE2B-4A2F-8560-A47218C0B511@exonet.nl>
Subject: Re: [linux-lvm] Failed to update old PV extension headers in VG
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
Content-Type: text/plain; charset="utf-8"
To: Henk Kraal <h.kraal@exonet.nl>
Cc: linux-lvm@redhat.com

On Fri, Jul 17, 2020 at 09:04:32AM +0200, Henk Kraal wrote:
> Hi all,
> 

> I’ve run into an issue when trying to activate an LV which resides on a
> read-only loop device. When I run lvchange -a y <LV Path> I get the
> following error:
> 
>   Error writing device /dev/loop0p5 at 4096 length 512.
>   bcache_invalidate: block (4, 0) still dirty
>   Failed to write mda header to /dev/loop0p5 fd -1
>   Failed to update old PV extension headers in VG recursor02-01-vg.
>   Volume group "recursor02-01-vg" not found
>   Cannot process volume group recursor02-01-vg
> 
> I’ve observed this issue when using LVM version 2.03.02

> Is there a way I can prevent the update of the extension headers when
> activating the LV?

I don't think there's a way to tell that version to skip the header
update.  A more recent verson of lvm should work, and let you use the PV
without updating the header.  It will not attempt updates from commands
which are not otherwise updating lvm metadata.
Dave
