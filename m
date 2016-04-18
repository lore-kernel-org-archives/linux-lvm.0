Date: Mon, 18 Apr 2016 19:16:51 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20160418181651.GC11116@agk-dp.fab.redhat.com>
References: <CAPD1+aPkA54SDUFf=OPzLwjE2p3QpcQgx8_Uh4dRYB+xmHX1rw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPD1+aPkA54SDUFf=OPzLwjE2p3QpcQgx8_Uh4dRYB+xmHX1rw@mail.gmail.com>
Subject: Re: [linux-lvm] lvm2-2.02.150: error running autotools
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
To: Timo Gurr <timo.gurr@gmail.com>
Cc: linux-lvm@redhat.com

On Thu, Apr 14, 2016 at 12:24:26PM +0200, Timo Gurr wrote:
> configure.in:1527: error: possibly undefined macro: AC_PYTHON_MODULE

If you have a genuine need to run autoconf, then you need this (or a package
that includes it):
  http://www.gnu.org/software/autoconf-archive/ax_python_module.html

Alasdair
