Subject: Re: [linux-lvm] RAID 5?
Message-ID: <20020531073720.GA1121@fib011235813.fsnet.co.uk>
References: <20020531032820.55790.qmail@web20609.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020531032820.55790.qmail@web20609.mail.yahoo.com>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Fri May 31 02:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 30, 2002 at 08:28:20PM -0700, Iffy Islam wrote:
> Is there RAID 5 support in addition to the LVM? If
> there is how do I go on about using RAID 5? If not
> will your company support RAID 5 in the future.

If you want to use raid 5 please layer the md driver (software raid)
under LVM.  We would like to provide RAID 5 functionality, but ATM it
is low priority.

- Joe
