From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Huge PV yields huge /etc/lvmtab.d/* overfilling initrd -- ideas?
Message-ID: <20030606064004.GA19765@percy.comedia.it>
References: <Pine.LNX.4.55.0306051525561.3269@mhw.ULib.IUPUI.Edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.55.0306051525561.3269@mhw.ULib.IUPUI.Edu>
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
Date: Fri Jun  6 01:41:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jun 05, 2003 at 03:41:47PM -0500, Mark H. Wood wrote:
>("Bug Red Hat to expand their initrd" only works until someone comes along
>with an even bigger blob of storage and hits the new limit.  There's no
>way to get off that merry-go-round.)
Bug redhat to mount a tmpfs on /etc/lvmtab.d/ in the initrd :)

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
