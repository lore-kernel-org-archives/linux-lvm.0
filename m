From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] problems importing non-exported VG
Message-ID: <20011211020757.C2120@tiger.bigcats.invalid>
References: <Pine.LNX.4.10.10112101013300.12116-100000@staff>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.10.10112101013300.12116-100000@staff>; from todd@osogrande.com on Mon, Dec 10, 2001 at 10:21:20AM -0700
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
Date: Mon Dec 10 19:08:04 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Todd!

Todd Underwood (todd@osogrande.com) wrote 94 lines:

> after an upgrade during which i moved from a root LVM system to a non-root
> LVM system and my /etc/lvm* files/directories were lost, i find i'm unable
> to re-import data from a previously existing volume group and i'm not even
> sure what the right steps are.

Did you try running vgscan?  Grep doesn't show it in your
mail, so I ask that 'stupid' question.  No guarantee that
it'll work, though

-Wolfgang
