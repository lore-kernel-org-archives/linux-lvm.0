From: GCS <gcs@lsc.hu>
Subject: Re: [linux-lvm] Patching Kernel 2.4.13 (with LVM patch 1.0.1.rc4 and XFS 1.0.1)
Message-ID: <20011031134156.A8104@lsc.hu>
References: <20011031112833.A6615@sky.net> <NEBBKOJLIGMCKNCJJACPCEPHGHAA.joost@e-cube.nl> <20011031113810.C634@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011031113810.C634@tykepenguin.com>; from caulfield@sistina.com on Wed, Oct 31, 2001 at 11:38:10AM +0000
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
Date: Wed Oct 31 06:27:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Oct 31, 2001 at 11:38:10AM +0000, Patrick Caulfield <caulfield@sistina.com> wrote:
> Incidentally I used the xfs-2001-10-27 patch rather than 1.0.1 because I
> couldn't get it to patch cleanly onto 2.4.13, but that's an XFS (or my) problem
> rather than an LVM one.
 If I am right, the XFS tree and the patches also are updated to 2.4.14pre3.
Anyway, you may try ftp://c64.rulez.org/users/gcs/patch-2.4.13/ It has LVM
1.0.1rc4, XFS 10-26, JFS 1.0.7. There is only one LVM issue I think: if
you mount an LVM partition, and try to issue the mount again, then it will
hang in a D state.

GCS
