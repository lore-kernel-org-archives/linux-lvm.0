From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] [Q] LVM snapshot volume extendable?
Message-ID: <20030112130953.A13785@uk.sistina.com>
References: <010901c2ba33$d3e5daf0$0f00a8c0@COMPAQ>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <010901c2ba33$d3e5daf0$0f00a8c0@COMPAQ>; from oh@storageone.co.kr on Sun, Jan 12, 2003 at 09:12:07PM +0900
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
Date: Sun Jan 12 07:09:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jan 12, 2003 at 09:12:07PM +0900, Sean Oh wrote:
> What I did in the shell scripts are 'lvextend -L+256M /dev/vg01/lv01_snap'
> with/without 'xfs_growfs /snap'.
The snapshot volume does not hold a filesystem - it is just a storage
area for deltas that enable the system to reconstruct a filesystem. 
So you don't need to run xfs utilities on it to make more space.  [But
of course some people might want to run them on writeable snapshots 
(needs kernel patch) for testing the effect of utilities.]

Alasdair
-- 
agk@uk.sistina.com
