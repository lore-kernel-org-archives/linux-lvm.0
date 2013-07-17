Date: Wed, 17 Jul 2013 11:04:22 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130717100422.GF7067@agk-dp.fab.redhat.com>
References: <2368A3FCF9F7214298E53C823B0A48EC038179@LONPEX01CL02.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2368A3FCF9F7214298E53C823B0A48EC038179@LONPEX01CL02.citrite.net>
Subject: Re: [linux-lvm] Potential concurrent metadata recovery issues
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
To: Thanos Makatos <thanos.makatos@citrix.com>
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

On Wed, Jul 17, 2013 at 09:16:04AM +0000, Thanos Makatos wrote:
> One of the problems we believe there are by using LVM in such a way is metadata consistency: if two hosts are concurrently performing operations on the same VG they may corrupt the VG's metadata because if, say, host A is in the process of updating the metadata, host B may find partially-written metadata, assume they're corrupted, and attempt to perform metadata recovery.
 
Supporting concurrent metadata updates on different nodes without locking isn't
reasonable with the current metadata.

But there is already a setting to prevent metadata recovery interfering:

  global/metadata_read_only

    # If set to 1, no operations that change on-disk metadata will be permitted.
    # Additionally, read-only commands that encounter metadata in need of repair
    # will still be allowed to proceed exactly as if the repair had been 
    # performed (except for the unchanged vg_seqno).
    # Inappropriate use could mess up your system, so seek advice first!

Alasdair
