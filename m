From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] adding a bootsector to a PV destroys it ?!?
Message-ID: <20020901160403.G6906@zealot.blacknet.de>
References: <20020901022635.E6906@zealot.blacknet.de> <20020901090001.GA1739@localhost>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020901090001.GA1739@localhost>; from linux-lvm@24x7linux.com on Sun, Sep 01, 2002 at 11:00:01AM +0200
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
Date: Sun Sep  1 09:09:44 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Sun, Sep 01 '02 at 11:00, Jos� Luis Domingo L�pez wrote:
> > Still, just to make sure:
> > overwriting the first 512byte of a PV destroy it?
> > 
> If I recall correctly, metadata is placed at the beginning of each PV,
> so overwriting the first 512-byte sector of it will probably render
> metadata unusable for LVM.
thought so, but still such a PV has a couple of GiBs, it might have been
a good idea to keep the first 512bytes free for a bootloader

-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
