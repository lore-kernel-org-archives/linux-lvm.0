Date: Wed, 10 Oct 2001 19:21:54 -0400
From: Chris Mason <mason@suse.com>
Message-ID: <1114900000.1002756114@tiny>
In-Reply-To: <20011010212821.D540EB630@oscar.casa.dyndns.org>
References: <20011003230330.508E91104F@oscar.casa.dyndns.org> <20011009015759.BF5E472AE3@oscar.casa.dyndns.org> <175160000.1002594564@tiny> <20011010212821.D540EB630@oscar.casa.dyndns.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: Ed Tomlinson <tomlins@CAM.ORG>
Cc: linux-lvm@sistina.com


On Wednesday, October 10, 2001 05:28:21 PM -0400 Ed Tomlinson <tomlins@CAM.ORG> wrote:

> Chris, with 2.4.11, your test vfs locking patch (manually fixing a reject) plus
> the second snapshot full patch with the addon from this message I have not been
> able to break things.  
> 
> If you are happy too, suggest you post the patches.

Good to hear Ed, many thanks.  Would you mind running one extra
set of tests?  I'm having problems with the system crashing/deadlocking
under high snapshot COW load.  10 concurrent writers onto the source
volume triggers it within 10-20 minutes.  I'm using stress.sh, 
but dbench should work too...I'm seeing this on pure rc4 (2.4.1[01],
and with my^zes).

Once this is worked out, I'll send everything in.

-chris
