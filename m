From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] JFS or XFS
Message-ID: <20040117004206.O18942@uk.sistina.com>
References: <20040116110810.GD2837@redhat.com> <20040116225419.11044.qmail@web41507.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040116225419.11044.qmail@web41507.mail.yahoo.com>; from rs_404@yahoo.ca on Fri, Jan 16, 2004 at 05:54:19PM -0500
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
Date: Fri Jan 16 19:43:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 16, 2004 at 05:54:19PM -0500, Rajesh Saxena wrote:
> I was under impression that LVM2 and device-mapper are dependant on
> kernel 2.6 which I don't feel comfortable using for server. 

There are device-mapper patches for 2.4 kernels for use with LVM2 tools.

Note that LVM1 snapshots are implemented differently from LVM2 snapshots
so you should drop any LVM1 snapshots before switching to LVM2.

(And Linus's 2.6 tree does not include snapshot support, as this is
still being tested.)

Alasdair
-- 
agk@uk.sistina.com
