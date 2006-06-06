Date: Tue, 6 Jun 2006 21:26:03 +0200
From: Joris van Rantwijk <jvrantwijk@xs4all.nl>
Subject: Re: [linux-lvm] lvremove hangs on removing snapshot
Message-ID: <20060606192603.GA25146@xs4all.nl>
References: <20060604190107.GA60385@xs4all.nl>
	<20060605200416.GZ10603@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060605200416.GZ10603@agk.surrey.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: agk@redhat.com
Cc: linux-lvm@redhat.com

On Mon, Jun 05, 2006 at 09:04:16PM +0100, Alasdair G Kergon wrote:
> > My system is Debian 3.1, linux 2.6.16.16, lvm2 2.01.04.
> Upgrade userspace:
>   2.6.16+ requires 2.02.*

Yep, this seems to fix the problem. Thanks for your help.

Bye,
  Joris.
