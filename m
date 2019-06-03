Date: Mon, 3 Jun 2019 09:08:40 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20190603140840.GA21189@redhat.com>
References: <CAJBJ56LoBQF_cqfXwKdHVqhJfRHioBN9BJCy_fiqDRW36pCPuA@mail.gmail.com>
	<3ebc32f0-963e-9d18-baf7-03a762ec12f5@redhat.com>
	<20190531144747.GA6502@X250>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190531144747.GA6502@X250>
Subject: Re: [linux-lvm] A couple of questions on locking library
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shawn Guo <shawn.gsc@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, May 31, 2019 at 10:47:49PM +0800, Shawn Guo wrote:
> it's not possible to use an external locking extension any more, right? 

right

> lvmlockd becomes the only clustering locking solution.

right

> While it supports sanlock and dlm locking library, there is no extension
> support for plugging an external locking library in.

right

Dave
