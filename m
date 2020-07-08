Date: Wed, 8 Jul 2020 11:05:19 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200708160519.GA23533@redhat.com>
References: <HE1PR0402MB3514D6153AB2978268A015BDCF670@HE1PR0402MB3514.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <HE1PR0402MB3514D6153AB2978268A015BDCF670@HE1PR0402MB3514.eurprd04.prod.outlook.com>
Subject: Re: [linux-lvm] About online pvmove/lvresize on shared VG
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
To: Gang He <GHe@suse.com>
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

On Wed, Jul 08, 2020 at 03:55:55AM +0000, Gang He wrote:
> but I cannot do online LV reduce from one node, 
> the workaround is to switch VG activation_mode to exclusive, run lvreduce command on the node where VG is activated.
> Does this behaviour is by-design? or a bug?

It was intentional since shrinking the cluster fs and LV isn't very common
(not supported for gfs2).

> For pvmove command, I cannot do online pvmove from one node,
> The workaround is to switch VG activation_mode to exclusive, run pvmove command on the node where VG is activated.
> Does this behaviour is by-design? do we do some enhancements in the furture?
> or any workaround to run pvmove under shared  activation_mode? e.g. --lockopt option can help this situation?

pvmove is implemented with mirroring, so that mirroring would need to be
replaced with something that works with concurrent access, e.g. cluster md
raid1.  I suspect there are better approaches than pvmove to solve the
broader problem.

Dave
