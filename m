From: Nathan Scott <nathans@sgi.com>
Subject: Re: [linux-lvm] xfs quota on lvm
Message-Id: <20020116181545.E30220@wobbly.melbourne.sgi.com>
References: <1011111148.3294.8.camel@fry.sysctl-office.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1011111148.3294.8.camel@fry.sysctl-office.de>;
    from czwecker@sysctl.de on Tue, Jan 15, 2002 at 05:12:28PM +0100
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
Date: Wed Jan 16 01:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jan 15, 2002 at 05:12:28PM +0100, Christophe Zwecker wrote:
> Hi,
> 
> Ive got alle volumes on linux RH with xfs and all except /  "lvmed".
> 
> I got quota enabled in kernel, xfs quota support too. Quota is enabled
> at mount. However when I do eduota -u user, I get only to change numbers
> on the nonlvm partition.
> 
> Is quota nonfunctional on lvm partitions ?
> 

Should work fine.  What does "repquota -vug /dev/XXX" give you
on the LVM devices when the filesystems are mounted?  (this'll
tell you whether quota is enabled at all on these devices).
If they are indeed enabled ("Accounting: ON; Enforcement: ON"
will be in the output) then try "strace setquota ..." to try
to diagnose further (look for quotactl syscalls).  setquota is
better than edquota for diagnosis because its not interactive,
but it interacts with the kernel in much the same way.

cheers.

-- 
Nathan
