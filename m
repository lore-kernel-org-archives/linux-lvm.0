From: Ed Tomlinson <tomlins@CAM.ORG>
Date: Wed, 10 Oct 2001 17:28:21 -0400
References: <20011003230330.508E91104F@oscar.casa.dyndns.org> <20011009015759.BF5E472AE3@oscar.casa.dyndns.org> <175160000.1002594564@tiny>
In-Reply-To: <175160000.1002594564@tiny>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20011010212821.D540EB630@oscar.casa.dyndns.org>
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

On October 8, 2001 10:29 pm, Chris Mason wrote:
> On Monday, October 08, 2001 09:57:59 PM -0400 Ed Tomlinson <tomlins@CAM.ORG> wrote:
> > Hi Chris
> >
> >> Ok, that first patch won't quite fix it, as we can still oops
> >> in lvm_snapshot_COW.  This one works better for me:
> >
> > Looks like this one has problems too.  Here is the oops I get with it:
> >>> EIP; d680b178 <[lvm-mod]_disable_snapshot+10/44>   <=====
> >
> > Trace; d680a50a <[lvm-mod]lvm_drop_snapshot+22/94>
> > Trace; d680aafc <[lvm-mod]lvm_snapshot_COW+3b4/3f4>
> > Trace; d680d3ca <[lvm-mod]lvm_name+8c2/e76>
>
> Hmmm, this should be the same as the bug fixed by the second patch.  We
> know the snapshot hasn't been released yet when lvm_snapshot_COW is called,
> so _disable_snapshot should not oops.

Chris, with 2.4.11, your test vfs locking patch (manually fixing a reject) plus
the second snapshot full patch with the addon from this message I have not been
able to break things.  

If you are happy too, suggest you post the patches.

Thanks
Ed Tomlinson
