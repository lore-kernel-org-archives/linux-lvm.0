From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
Message-ID: <20040103102839.GD28358@percy.comedia.it>
References: <OF9AFD797D.B4785EDD-ON00256E0F.008318E6-00256E0F.008318ED@svunta.os.is>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF9AFD797D.B4785EDD-ON00256E0F.008318E6-00256E0F.008318ED@svunta.os.is>
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
Date: Sat Jan  3 04:30:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 02, 2004 at 11:51:55PM +0000, Kjartan Reynir Hauksson wrote:
>>If you could tell me what your machine prints before the kernel panic i
>>could try to guess what happened
>
>hmmmm... this looks a little suspicious: invalid compressed format
>(err=2)<6> Freeing initrd memory 451k freed

this means either your initrd is corrupted, or you did not rerun lilo
after createing the initrd.

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
