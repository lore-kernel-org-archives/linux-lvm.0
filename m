From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] cannot extend lv
Message-ID: <20030119193214.B14313@uk.sistina.com>
References: <3E2A7AE4.8080801@informatik.uni-erlangen.de> <20030119180753.GA15083@mitethe.eudyptes>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030119180753.GA15083@mitethe.eudyptes>; from idsfa@visi.com on Sun, Jan 19, 2003 at 12:07:53PM -0600
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
Date: Sun Jan 19 13:31:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jan 19, 2003 at 12:07:53PM -0600, idsfa@visi.com wrote:
> The only
> way to do what you want would have been to use kernel RAID to combine
> the physical devices into a single logical device before creating the
> stripe set.

Or try out LVM2 which no longer imposes these restrictions when
extending striped volumes.  (You can vary the number of stripes and the
stripesize.)

Alasdair
-- 
agk@uk.sistina.com
