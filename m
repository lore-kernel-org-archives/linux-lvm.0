From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] Extending stripped volumes
Message-ID: <20030430080459.GA433@fib011235813.fsnet.co.uk>
References: <3EAF786A.1060504@free.fr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3EAF786A.1060504@free.fr>
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
Date: Wed Apr 30 03:04:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 30, 2003 at 09:16:58AM +0200, Emmanuel Varagnat wrote:
> 
> I would like to know if it is possible to extend stripped volumes with 
> newer versions of LVM1 or even with LVM2.
> It looks like it was possible only with linear volumes and specific 
> allocation policy.

With LVM2 to can extend any volume with a striped segment, so, for
example, you could have a volume that is made up of 10G linear, 20G
stripe 2 ways, 40G stripe 3 ways.  You will need to use 'format 2'
metadata to do this.

- Joe
