From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] dma_timer_expiry and pvmove problem
Message-ID: <20031107162055.GA1441@trip.muon.local>
References: <20031105012047.A1152@wagener.nu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031105012047.A1152@wagener.nu>
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
Date: Fri Nov  7 10:23:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, 05.11.03, Tobias Wagener <tobias-lvm@tobias.wagener.nu> wrote:

> The last messages in kernel-log are:
>    Nov  5 00:46:43 go kernel: hde: dma_timer_expiry: dma status == 0x61
>    Nov  5 00:46:53 go kernel: hde: error waiting for DMA
>    Nov  5 00:46:53 go kernel: hde: dma timeout retry: status=0x51 { DriveReady SeekComplete Error }
>    Nov  5 00:46:53 go kernel: hde: dma timeout retry: error=0x40 { UncorrectableError }, LBAsect=111599988, high=6, low=1093
>    Nov  5 00:46:53 go kernel: end_request: I/O error, dev 21:01 (hde), sector 111599922

I dont think this is LVM related. It looks like a bad disk. You might want
to install smartmontools or any other package capable of reading SMART
information from the Harddisk.

Are you sure the system freezes completely? Perhaps it is just running very
slow, trying to read the sector again and again. Does the above error
message repeat in your logs?

> The question is (I don't try it, but I think this will happend): 
> "pvmove" read this special file also, and the system will freezes, too. Is there
> a way to tell pvmove to leave some sectors/inodes away? Because I think there is
> a defect sector on this harddrive and that is the reason for the fatal error.
> Or, does someone think, if I switch off the use of DMA, this problem will be fixed?
> I'm not that kind of expert, so please be patient with me ;)

It might be easier to rescue the data by copying the logical volume onto
another one with dd_rescue ( a special version of dd that handles broken
disks very good). Create a new lv on a good disk and dd_rescue the whole lv
there, lvremove bad lv, pvremove bad disk, fsck rescued filesystem.

> My Question now is: The new lvm will be "/dev/hdg" and "/dev/hdh", but after this
> action I want that this lvm is build out of "hde" and "hdf". Is there a way to
> tell the lvm to use for an existing vg other partitions than the ones defined at
> build time?

I think LVM finds its PVs on its own. It should just work (if you run vgscan
at startup).

good luck

Nils

-- 
Nils Juergens  | nils@muon.de | icq 7090774
Having problems sending big files over the net?
Try out Efisto (http://efisto.rnbhq.org).
