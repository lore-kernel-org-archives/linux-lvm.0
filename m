From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] question on lvm
Message-Id: <20020418110244.GD12253@colombina.comedia.it>
References: <50A2E0979498D4119B9F00A0C9DD8925650989@chzrhm0601.hds.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50A2E0979498D4119B9F00A0C9DD8925650989@chzrhm0601.hds.co.uk>
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
Date: Thu Apr 18 06:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Thu, Apr 18, 2002 at 03:17:15AM -0700, Pascal Hubacher wrote:
> i would like to know if lvm can handle multiple paths to one disk (like dmp
> in veritas volume manager) and if yes if it does a loadbalancing on the
> paths? 
> 
not atm, but Stefan Bader <Stefan.Bader@de.ibm.com>
posted a patch on this list to enable this functionality
as an alternative you can use md multipath under lvm
i posted a patch to the linux-raid mailing-list to
enable loadbalancing on md multipath *this patch is
still untested*

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
