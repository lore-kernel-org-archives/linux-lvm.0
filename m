From: Ed Tomlinson <tomlins@CAM.ORG>
Date: Wed, 10 Oct 2001 20:37:31 -0400
References: <20011003230330.508E91104F@oscar.casa.dyndns.org> <20011010212821.D540EB630@oscar.casa.dyndns.org> <1114900000.1002756114@tiny>
In-Reply-To: <1114900000.1002756114@tiny>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20011011003731.A9ADE160A8@oscar.casa.dyndns.org>
Subject: [linux-lvm] Re: [OOPS] full snapshot (with test vfs locking patch for reiserfs snapshots in 11-pre)
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
To: Chris Mason <mason@suse.com>
Cc: linux-lvm@sistina.com

On October 10, 2001 07:21 pm, Chris Mason wrote:
> On Wednesday, October 10, 2001 05:28:21 PM -0400 Ed Tomlinson <tomlins@CAM.ORG> wrote:
> > Chris, with 2.4.11, your test vfs locking patch (manually fixing a
> > reject) plus the second snapshot full patch with the addon from this
> > message I have not been able to break things.
> >
> > If you are happy too, suggest you post the patches.
>
> Good to hear Ed, many thanks.  Would you mind running one extra
> set of tests?  I'm having problems with the system crashing/deadlocking
> under high snapshot COW load.  10 concurrent writers onto the source
> volume triggers it within 10-20 minutes.  I'm using stress.sh,
> but dbench should work too...I'm seeing this on pure rc4 (2.4.1[01],
> and with my fixes).
>
> Once this is worked out, I'll send everything in.

I just finished running about 40 mins of debench filling 3 1G snapshots.
No stalls/opps.  I am creating the snapshot with

lvcreate -L1G -s -n snap /dev/lv/root /dev/hda3

/dev/lv/root lives on hde.  Does your snapshot live on the same physical
disk as its source disk?

Can you please send me the version of stress.sh you are using?  I'll see
if that triggers anything here.

Ed
