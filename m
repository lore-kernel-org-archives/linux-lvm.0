Subject: Re: [linux-lvm] LVM2 and XFS/your patched-in FS of choice
Message-ID: <1044486710.3e419a3677597@secure.st-peter.stw.uni-erlangen.de>
From: shsp0058@st-peter.stw.uni-erlangen.de
References: <NDBBJIIIAKLGEPBFEKBGOENMFPAA.afrancke@cisco.com>
In-Reply-To: <NDBBJIIIAKLGEPBFEKBGOENMFPAA.afrancke@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Wed Feb  5 17:12:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: afrancke@cisco.com

Quoting Andy Francke <afrancke@cisco.com>:

> Perhaps this has been answered already, but I can't seem to find it.
> Has
> anybody successfully used LVM2 *and* XFS with kernel 2.4.20?The patches
> are
> mutually exclusive, it would seem (both touch fs.h, but as a newbie I
> didn't
> want to try to merge the changes manually and end up with a bogus
> device
> data structure).

not realy successfully :(
(see post [linux-lvm] 2.4.20 + xfs +lvm2 = raid0_make_reque...
on linux-xfs,linux-lvm, dev-mapper archives)

but i didn't have troubles with patching
i got vanila 2.4.20 from kernel.org
split xfs patches and the dm backport patches.

try the split xfs patches and see which one gives you troubles,
eventualy you can skip it :)

svetljo   .
