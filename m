From: Herbert =?iso-8859-1?Q?P=F6tzl?= <herbert@13thfloor.at>
Subject: Re: [linux-lvm] Kernel 2.4.22, LVM 1.0.7 and VFS patch for 2.4.20
Message-ID: <20030827120617.GF23955@www.13thfloor.at>
References: <Pine.LNX.4.52.0308262328280.23305@junior.lunanet.biz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.52.0308262328280.23305@junior.lunanet.biz>
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
Date: Wed Aug 27 07:59:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Donald Thompson <dlt@lunanet.biz>
Cc: linux-lvm@sistina.com

On Tue, Aug 26, 2003 at 11:37:42PM -0600, Donald Thompson wrote:
> 2.4.22 kernel builds fail for me with 'undefined reference to `DQUOT_SYNC''
> when it attempts to link to produce vmlinux . Looks like the definition
> for DQUOT_SYNC in include/linux/quotaops.h changed from:
> 
> #define DQUOT_SYNC(dev) sync_dquots(dev, -1)
> 
> To:
> 
> #define DQUOT_SYNC_DEV(dev)     sync_dquots_dev(dev, -1)
> 
> in kernel 2.4.22 from 2.4.21. Can someone who knows better than I confirm
> that it should be safe to change the reference in the VFS patch, repatch,
> and rebuild?

yes from the quota perspective, its perfectly okay
to do this change ... it was renamed in 2.4.22-pre4/pre5
where the new quota stuff got in ...

HTH,
Herbert

> -Don
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
