From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] FW: LVM
Message-ID: <20020625153633.C16529@uk.sistina.com>
References: <Pine.LNX.4.44.0206251009190.13871-100000@dragon.inside.ntisys.com> <Pine.LNX.4.44.0206251408300.962-100000@pzat.meep.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0206251408300.962-100000@pzat.meep.org>; from oolon@ankh.org on Tue, Jun 25, 2002 at 02:11:39PM +0000
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
Date: Tue Jun 25 09:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jun 25, 2002 at 02:11:39PM +0000, James Hawtin wrote:
> I thought changes were planned or done so that if a PV failed the vg could
> be force mounted and only the lvs on the unavailable PV would not be
> available....
Indeed, this is the plan for LVM2; and the parts of any LVs that are 
on the unavailable PV can be replaced temporarily with something else 
(e.g. IO Errors or a file containing zeros) with the LV mounted read-only.
 
Alasdair
-- 
agk@uk.sistina.com
