From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM2 lvextend lockup
Message-ID: <20030211130234.A4547@uk.sistina.com>
References: <200302081935.18450.jhs@openenterprise.biz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200302081935.18450.jhs@openenterprise.biz>; from jhs@openenterprise.biz on Sat, Feb 08, 2003 at 07:35:16PM +0700
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
Date: Tue Feb 11 07:03:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Feb 08, 2003 at 07:35:16PM +0700, Jason Smith wrote:
> root@tester:~# lvmdiskscan --version # BTW lvm --version doesn't work
'lvm' doesn't take cmdline flags yet.
'lvm version' works (in recent releases)

>   LVM version:     1.95.10 (2002-05-31)
>   Library version: 0.96.07-ioctl-cvs (2002-11-21)
>   Driver version:  1.0.6
I suggest updating the userland LVM2 tools, then turning on debugging
output e.g. log { file="/tmp/lvm2.log" level=7 } 
and looking to see how far the lvextend gets before locking up.
 
Alasdair
-- 
agk@uk.sistina.com
