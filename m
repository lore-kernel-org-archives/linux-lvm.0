From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM problems after 2.6.0-test1
Message-ID: <20030811173328.B22513@uk.sistina.com>
References: <wxxptjd83jl.fsf@nommo.uio.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wxxptjd83jl.fsf@nommo.uio.no>; from terjekv@math.uio.no on Mon, Aug 11, 2003 at 02:02:22AM +0200
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
Date: Mon Aug 11 11:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Aug 11, 2003 at 02:02:22AM +0200, Terje Kvernes wrote:
>   any suggestions are welcome, below is the output from "vgchange -ay
>   -vvv" showing the problem.

1) Check kernel message log for any device-mapper errors.

2) Confirm you are using userspace libdevmapper & LVM2 from the 
last tarballs we released.
 
3) If there are no kernel errors and you are using the latest userspace
code, then please log to file (see below, as mentioned in WHATS_NEW) and
send me the log file.  [Clear the log file, then run a 'vgscan' followed
by the troublesome 'vgchange -ay'.]

e.g. config file section:
  log {
          file="/tmp/lvm2.log"
          level=7
          activation=1
  }

Please also send the output of 'lvm version', 'ls -la /dev/mapper' and a 
copy of the current volume group backup. (e.g. generate with
'vgcfgbackup').

Alasdair
