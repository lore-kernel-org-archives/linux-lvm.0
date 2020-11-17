Date: Tue, 17 Nov 2020 10:17:25 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20201117161725.GB18257@redhat.com>
References: <3e4cbb06-6428-45f2-0b42-d7dc5abdfc81@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e4cbb06-6428-45f2-0b42-d7dc5abdfc81@suse.com>
Subject: Re: [linux-lvm] discussion about
	activation/auto_activation_volume_list
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
To: "heming.zhao@suse.com" <heming.zhao@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, agk@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>

On Tue, Nov 17, 2020 at 04:00:10PM +0800, heming.zhao@suse.com wrote:
> Hello LVM-maintainers,
> 
> Currently activation/auto_activation_volume_list is not enable and it does the default behavior:
>   pvscan will activate all the devices on booting.
> 
> This rule will trigger a clumsy process in HA (corosync+pacemaker stack) env.
> 
> ## let me show the scenario:
> 
> 2 nodes (A & B) share a disk, and using systemid to manage vg/lv on this shared disk.
> (keep the activation/auto_activation_volume_list default style: comment out this cfg item)
> 
> (below steps come from resource-agent LVM-active script)
> 1. Node A own & active shared vg/lv, node B standby status.
> 2. A reboot, B detect & wait for A rejoined cluster.
> 3. because systemid doesn't be changed, lvm2-pvscan@.service will active the vg/lv on A during booting.
> 4. A finishes reboot, B starts to switch systemid & active shared vg/lv.
> 5. on B, pacemaker detects lvm resource is running on both nodes.
> 6. on B, pacemaker restarts lvm resource and enable it on single node.
> 
> ## rootcause:
> 
> we can see step 3,4,5 is useless if step 3 is non-existent. 
> So the rootcause is step <3>: node A auto activate shared vg/lv.

I believe there's an assumption that the system or a user will not
activate LVs that are managed by the cluster, i.e. only LVM-activate will
activate LVs managed by the cluster.  Perhaps we could make some attempt
to enforce that, or at least make sure the instructions for LVM-activate
make it clear what to do.

> ## discussion (how to fix):
> 
> Could activation/auto_activation_volume_list support a new symbol/function like "!".
> e.g.
> auto_activation_volume_list = [ "!vg1", "!vg2/lvol1" ]
> the '!' means lvm absolutely doesn't active this vg1 & vg2/lvol1 automatically.
> 
> my question:
> Does it acceptable for LVM2 adding this new function?

auto_activation_volume_list is difficult to use IMO, and I don't think
many people use it.  Your suggestion sounds reasonable, but I've wondered
if autoactivation should be a property set on the VG or LV itself (i.e.
in the metadata)?  The "activationskip" flag is a possible way to handle
the unwanted autoactivation, and also seems to justify the idea of making
autoactivation a similar flag.

Dave
