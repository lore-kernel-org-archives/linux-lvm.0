References: <20181223185731.ddtmh3wqsrvx5kug@shell.thinkmo.de>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <77607f5c-1909-f062-2c38-23872e91c89f@redhat.com>
Date: Thu, 3 Jan 2019 12:42:08 +0100
MIME-Version: 1.0
In-Reply-To: <20181223185731.ddtmh3wqsrvx5kug@shell.thinkmo.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] systemd generator fails if lvmconfig does not find
 a value
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
To: waldi@debian.org
Cc: linux-lvm@redhat.com

On 12/23/18 7:57 PM, Bastian Blank wrote:
> Moin
> 
> The systemd generator in 2.03.01 fails if the config does not yet
> contain the variables it tries to read via lvmconfig.  It aborts as
> lvmconfig exits with exit value 5.
> 
> | % /sbin/lvmconfig config/checks te/t 2>/dev/null; echo $? 
> | checks=1
> | 5
> 
> As generators should not fail, ignoring lvmconfig problems might be the
> best option.  The fallback of just generating services is safe.

We could probably use "lvmconfig --type full" here instead. The "--type
full" will get the actual setting if it exists and if not, it'll take
the default value. And yes, even if that one fails, we should still
generate the services... Thanks for noticing! I'll patch this.

-- 
Peter
