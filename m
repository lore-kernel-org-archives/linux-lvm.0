From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] problems importing non-exported VG
Message-ID: <20011211035129.A14716@tiger.bigcats.invalid>
References: <20011211020757.C2120@tiger.bigcats.invalid> <Pine.LNX.4.10.10112101818460.30490-100000@staff>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.10.10112101818460.30490-100000@staff>; from todd@osogrande.com on Mon, Dec 10, 2001 at 06:19:35PM -0700
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
Date: Mon Dec 10 20:56:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Todd!

Todd Underwood (todd@osogrande.com) wrote 50 lines:

> yep, vgscan finds no volume groups on the system. sigh.  i guess i really
> need a backup of /etc/lvm*, which is on the lv.  sigh again.

You did not export the vg, right?  So there would be no use
to use "vgimport rootvg /dev/hdc1 /dev/hdc2 /dev/hdc3"...

Hmmm.

-Wolfgang
