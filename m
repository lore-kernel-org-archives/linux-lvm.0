From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Cannot deactivate VG when shutting down
Message-ID: <20020604184800.GD31785@colombina.comedia.it>
References: <20020604180039.I8663@babbage.hcsd.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020604180039.I8663@babbage.hcsd.de>
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
Date: Tue Jun  4 13:48:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jun 04, 2002 at 06:00:39PM +0200, Stephan Austermuehle wrote:
> Hi,
> 
> I set up a Debian system that is completely installed on LVs including
> the root filesystem. When shutting down the system deactivating the
> Volume Group fails because the root filesystem is still mounted
> (read-only). Is there already a solution available for this problem or
> can the VG safely remain activated when shutting down?

the VG can safely remain activated when shutting down

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
