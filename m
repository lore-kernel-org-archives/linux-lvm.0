Date: Mon, 24 Jul 2017 11:58:29 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20170724165829.GA13847@redhat.com>
References: <1500440226.7068.4.camel@nokia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1500440226.7068.4.camel@nokia.com>
Subject: Re: [linux-lvm]
 =?utf-8?q?lvmetad_crashes_with_=E2=80=9Cmemory_smash?=
 =?utf-8?q?=E2=80=9D_during_lvm_parallel_operations?=
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
To: linux-lvm@redhat.com
Cc: hemraj.s@nokia.com, prateek.2.saxena@nokia.com

On Wed, Jul 19, 2017 at 04:57:12AM +0000, Shivarama Krishnan, Gururaj (Nokia - IN/Bangalore) wrote:
> Hi ,
> 
> Greetings.
> 
> We are facing an issue with LVMETAD crashing during the parallel lvm operations
> (vgscan/pvscan/lvscan/lvs/vgs)
> 
> PKG_NAME=LVM2
> PKG_VERSION=2.02.168
> PKG_URL=LVM2.2.02.168.tgz
> PKG_MD5=00209bdd6befe9a7330f162909313ae8
> PKG_DATE=2016-12-01
> 
> This issue is also seen in LVM2-2.02.171.

Please check if this fix is applied to your version:
https://sourceware.org/git/?p=lvm2.git;a=commit;h=c459f23565e86eb9a8a116995cda7dcaed858b9f

AFAICT all the problems you sent are the fault of the memory debugging
code, not the original problem.  You need to compile lvmetad with
debugging, but not memory debugging.  Then gdb should give relevant
backtraces.

Dave
