Return-Path: <dg@suse.com>
Date: Thu, 7 Dec 2000 11:55:38 -0800
From: David Gould <dg@suse.com>
Subject: Re: [linux-lvm] How do you mount a snapshot?
Message-ID: <20001207115538.B24318@archimedes.oak.suse.com>
References: <20001207033911.E7573@ultraviolet.org>
Mime-Version: 1.0
In-Reply-To: <20001207033911.E7573@ultraviolet.org>; from treed@ultraviolet.org on Thu, Dec 07, 2000 at 03:39:11AM -0800
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

On Thu, Dec 07, 2000 at 03:39:11AM -0800, Tracy R Reed wrote:
> 
> [root@computer /usr2]# mount -t reiserfs /dev/vg-sdb1/snapshot /snap/
> mount: block device /dev/vg-sdb1/snapshot is write-protected, mounting read-only
> mount: wrong fs type, bad option, bad superblock on /dev/vg-sdb1/snapshot,
>        or too many mounted file systems

Unless they have changed it (possible), reiserfs does not support ro
hardware for mounting unless the filesystem was unmounted cleanly. The
reason is that to make the FS consistant the journal has to be replayed
which necessarily _writes_ to the device. This cannot work on an ro device.

-dg

-- 
David Gould                                                 dg@suse.com
SuSE, Inc.,  580 2cd St. #210,  Oakland, CA 94607          510.628.3380
"As I've gained more experience with Perl it strikes me that it
 resembles Lisp in many ways, albeit Lisp as channeled by an awk
 script on acid."  -- Tim Moore <moore@herschel.bricoworks.com>,
                      on comp.lang.lisp
