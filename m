From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] encryption in LVM2
Message-ID: <20030218014556.L14285@zealot.blacknet.de>
References: <3E510115.C2FF3B83@silicide.dk> <20030217203406.GA6846@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030217203406.GA6846@localhost>; from linux-lvm@24x7linux.com on Mon, Feb 17, 2003 at 09:34:06PM +0100
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
Date: Mon Feb 17 18:46:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 17 '03 at 21:34, Jose Luis Domingo Lopez wrote:
> I don't know of anyone working on block-based encryption for LVM2/DM,
> but by now you can try one of the several filesystem-level encryption
> solutions out there. I have personally used loop-aes
hint: loop-aes is a block-based encryptor. It just happens to operate on
blocks in files, due to the limitations of loop device driver.

writing a personality for lvm2 to do blocklevel encryption would be nice

OTOH a group aware filesystem level encryption would be realy cool.
-- 
Goetz Bock       (c) 2003 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
