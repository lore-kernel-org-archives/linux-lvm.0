From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] RE: LV maximum size
Message-ID: <20020904154909.D18498@zealot.blacknet.de>
References: <008401c25417$791d0080$0a2fa00a@home.lirbank.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <008401c25417$791d0080$0a2fa00a@home.lirbank.com>; from mikael@lirbank.com on Wed, Sep 04, 2002 at 03:32:06PM +0200
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
Date: Wed Sep  4 08:46:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 04 '02 at 15:32, Mikael Lirbank wrote:
> So that means if I set PE size to 8MB I double my max size of the LV...
> and so on.
That's right.
 
> But then what is the max PE size?
don't know. RTFM? google?
> And what are the drawbacks of increasing it?
the size of a LV can only be n*PE, so with PE=32M there is no 100M LV
only 96M or 128M

-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
