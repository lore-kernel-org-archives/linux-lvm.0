From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Insufficient space in params[] to write target parameters.
Message-ID: <20030820000450.M29420@uk.sistina.com>
References: <200308192223.h7JMN6o06498@mail.osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200308192223.h7JMN6o06498@mail.osdl.org>; from markw@osdl.org on Tue, Aug 19, 2003 at 03:23:03PM -0700
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
Date: Tue Aug 19 18:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Aug 19, 2003 at 03:23:03PM -0700, markw@osdl.org wrote:
>   Insufficient space in params[] to write target parameters.

You *are* stressing the hard-coded items that we didn't
have time to make dynamic:-)

This one is in userspace, and it is safe to make it
a few times bigger - e.g. 4096 instead of 1024?

lib/activate/dev_manager.c line 771


(then just re-make the LVM2 userspace code)


Alasdair
-- 
agk@uk.sistina.com
