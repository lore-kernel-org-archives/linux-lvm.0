Message-Id: <200202281017.LAA26141@mailgate.sara.nl>
From: Remco Post <r.post@sara.nl>
Subject: Re: [linux-lvm] Cluster LVM
In-Reply-To: Your message of
    "Wed, 27 Feb 2002 10:19:49 MST."
    <20020227101949.M12832@lynx.adilger.int>
MIME-Version: 1.0
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
Date: Thu Feb 28 04:17:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> Having a single master is a _terrible_ idea, since this would mean that
> if that node is down you are unable to change the VG until/if it is back
> working again.
> 
> Rather use a DLM (as the other poster suggested) and a client needs to
> get a lock on the VG in order to change anything.  You can start with
> a lock per VG and one per shared PV not in a VG, and then go more fine
> grained if you want (e.g. write lock on VG and specific LV being changed,
> which does not block users of other LVs).  In the end, because you are
> not changing a VG configuration very often, and it doesn't take very long
> when you do (excluding pvmove), the big lock is probably enough.
> 
> Cheers, Andreas

Agreed,

I was unclear about my ideas. Having the one big log is probably all you ever need, since all manipulations on a lv or a pv in a vg have impact on the vg.


-- 
Met vriendelijke groeten,

Remco Post

SARA - Stichting Academisch Rekencentrum Amsterdam
High Performance Computing  Tel. +31 20 592 8008    Fax. +31 20 668 3167

"I really didn't foresee the Internet. But then, neither did the computer
industry. Not that that tells us very much of course - the computer industry
didn't even foresee that the century was going to end." -- Douglas Adams
