Date: Fri, 6 Jan 2017 13:04:32 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20170106190432.GA22165@redhat.com>
References: <ea995d2fb8e2be94ab44e870c88a5be8@xenhideout.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea995d2fb8e2be94ab44e870c88a5be8@xenhideout.nl>
Subject: Re: [linux-lvm] duplicate pv change uuid
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
To: Xen <list@xenhideout.nl>
Cc: Linux lvm <linux-lvm@redhat.com>

On Fri, Jan 06, 2017 at 07:55:53PM +0100, Xen wrote:
> I want to ask again,
> 
> How can I change the UUID of a duplicated PV?
> 
> I mirrored a partition to another disk and tried to change its UUID with
> pvchange -u.
> 
> But I think LVM had already decided to replace the reference to the PV
> (partition) on the old disk by the reference to the new disk, or something.
> 
> For some reason it always prefers the wrong one.
> 
> Now I booted with just one disk but I cannot change the UUID of the running
> system, but if I connect the other disk I am afraid I won't be able to
> change it also.
> 
> How does one do this, again?

vgimportclone is meant to do this.  It strategically uses filters to
isolate and modify the intended devs.
