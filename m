From: Nathan Hunsperger <linux-lvm@hunsperger.com>
Subject: Re: [linux-lvm] System lockups when snapshoting
Message-ID: <20030717050715.GC23833@munchnet.com>
References: <20030716230227.GB23833@munchnet.com> <20030717023628.GF9860@questra.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030717023628.GF9860@questra.com>
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
Date: Thu Jul 17 00:08:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> Lastly, I will receive a "raid 5 sync complete" message on console for
> the md lvm is ontop of, an hour after I cannot issue any more fs-using
> commands, so the block device the lvm volume group is on should be fine.

Yes.  The PV is a software raid5 MD.  Have you seen this problem before?

- Nathan

On Wed, Jul 16, 2003 at 10:36:28PM -0400, Scott Mcdermott wrote:
> Nathan Hunsperger on Wed 16/07 16:02 -0700:
> > I'm experiencing severe issues when creating snapshots,
> > and would appreciate some advice.  These problems are
> > occuring on 2.4.21 with LVM 1.0.7.  Without snapshots, I
> > am not experiencing any problems.
> 
> it's not on a RAID5 PV by any chance?
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
