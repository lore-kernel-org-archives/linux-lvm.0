Date: Tue, 26 May 2020 16:30:48 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200526213048.GA9994@redhat.com>
References: <7a26b791-9739-d6dc-1744-7471f3c00af8@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a26b791-9739-d6dc-1744-7471f3c00af8@suse.com>
Subject: Re: [linux-lvm] issue (or bug): when vgremove does removing lvmcache
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
Cc: linux-lvm@redhat.com

On Sat, May 23, 2020 at 10:03:50PM +0800, heming.zhao@suse.com wrote:
> # vgremove test --force
>   Logical volume "main" successfully removed
>   Assertion failed: can't _pv_write non-orphan PV (in VG )
>   Failed to remove physical volume "/dev/sdb" from volume group "test"
>   Volume group "test" not properly removed

That has been fixed, looks like 56aadd7fe2a1d24043ea9d06543c29317ac1cc58,
although that may have changed since.
Dave
