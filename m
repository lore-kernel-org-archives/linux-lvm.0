From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] [OT] Urgent help needed.
Message-ID: <20020626054222.GA27653@colombina.comedia.it>
References: <1025054946.19474.12.camel@UberGeek>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1025054946.19474.12.camel@UberGeek>
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
Date: Wed Jun 26 00:42:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jun 25, 2002 at 08:29:06PM -0500, Austin Gonyou wrote:
> Please respond directly to me. I cannot use max_scsi_luns=128 on my
> 2.4.19-pre10 kernel. It doesn't seem to pick up the args or something.
> I've got probe all luns in the kernel config, and still nothing. When I
> insmod my qla2200 driver, nothing seems to happen. It will only work
> with the default 2.4.9 kernel from my distro. Please advise if you can. 
> 
do you load scsi_mod as a module?
in this case max_scsi_luns should be an option for the module
else it is a kernel command line option

L.



-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
