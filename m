From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] LV maximum size
Message-ID: <20020904152402.C18498@zealot.blacknet.de>
References: <007d01c25413$c70c7770$0a2fa00a@home.lirbank.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <007d01c25413$c70c7770$0a2fa00a@home.lirbank.com>; from mikael@lirbank.com on Wed, Sep 04, 2002 at 03:05:43PM +0200
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
Date: Wed Sep  4 08:21:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 04 '02 at 15:05, Mikael Lirbank wrote:
> I saw someone on this mailing list talking about LV maximum size of 1TB.
> I can only make LVs 255 GB.
RTFM

because your PE size is only 4M. You must redo your VG with a bigger
PE size. try vgcreate --help 
And yes you will loose all data currently on your VG, make backups
first.
-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
