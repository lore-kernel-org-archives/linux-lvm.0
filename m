From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Locking error with LVM2
Message-ID: <20020717161450.B27689@uk.sistina.com>
References: <OF6E8EDB48.F77BF8AC-ON85256BF9.00510385@pok.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF6E8EDB48.F77BF8AC-ON85256BF9.00510385@pok.ibm.com>; from slpratt@us.ibm.com on Wed, Jul 17, 2002 at 09:46:44AM -0500
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
Date: Wed Jul 17 10:14:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jul 17, 2002 at 09:46:44AM -0500, Steve Pratt wrote:
> lvm> lvcreate -L296M -c8k -n snap g1/org
>   /var/lock/lvm/V_g1/org: open failed: No such file or directory

This needed "-s" to create a snapshot.

We'll refine the command line argument checking & error messages here:-)

Alasdair
-- 
agk@uk.sistina.com
