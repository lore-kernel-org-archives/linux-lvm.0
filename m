From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] vgscan messages regarding read-only cdrom
Message-ID: <20031130212501.GO19217@percy.comedia.it>
References: <20031130185807.GF7634@glorybox.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031130185807.GF7634@glorybox.de>
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
Date: Sun Nov 30 15:26:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Nov 30, 2003 at 07:58:07PM +0100, Kai Weber wrote:
>* why is vgscan reading /dev/cdrom (a link to my first IDE
>CD-ROM /dev/hdc)?
>
>* how can I disable this message?

man lvm.conf

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
