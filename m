From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] setting VG UUID
Message-ID: <20040108212542.GF23918@homer.msp.redhat.com>
References: <20040107065801.A27995@cs.mcgill.ca> <20040107092415.A28215@cs.mcgill.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040107092415.A28215@cs.mcgill.ca>
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
Date: Thu Jan  8 16:27:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 07, 2004 at 09:24:15AM -0500, Navindra Umanee wrote:
> For the record, I'm absolutely crazy, but I fixed this by doing:
> 
> echo "deadbeefdeadbeefdeadbeefdeadbeef"|dd of=/dev/hda6 obs=1 seek=4096 count=32

> So much for universal uniqueness...
The VG UUIDs *are* meant to all be the same on devices that are part of the
same VG.  It's the PV UUIDs that differ.
 
> For the record, I created my LVM1 partitions with Linux Mandrake 9.2.
Could /dev/urandom have been missing when pvcreate was run?
We think that would explain the symptoms.

> Should "vgchange -a n" maybe clean up these symlinks?
It's supposed to do.
 
Alasdair
-- 
agk@redhat.com
