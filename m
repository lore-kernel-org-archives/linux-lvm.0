From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM2 related OOPS in 2.4.22 (kernel BUG at kcopyd.c:130!)
Message-ID: <20031203132630.O16901@uk.sistina.com>
References: <1070130848.15958.6.camel@dom>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1070130848.15958.6.camel@dom>; from stefan@x-cellent.com on Sat, Nov 29, 2003 at 07:34:08PM +0100
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
Date: Wed Dec  3 07:28:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: linux-kernel@vger.kernel.org

On Sat, Nov 29, 2003 at 07:34:08PM +0100, Stefan Majer wrote:
> First i created a logical volume and the about 5 snapshots.
> Then i wanted to create a filesystem on the source LV with
> mkreiserfs.
 
>   Driver version:  4.0.1
 
Please try a newer kernel driver (4.0.5) included in the
device-mapper tarball.

Alasdair
-- 
agk@uk.sistina.com
