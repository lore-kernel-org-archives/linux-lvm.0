Subject: Re: [linux-lvm] DM encryption target?
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <1064332301.5845.8.camel@david.internal.NorcrossGroup.com>
References: <1064332301.5845.8.camel@david.internal.NorcrossGroup.com>
Message-Id: <1064343664.10276.3.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Tue Sep 23 14:02:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
Cc: linux-lvm@sistina.com

Am Di, 2003-09-23 um 17.51 schrieb Greg Freemyer:

> There was talk about creating a DM encrypting target a while ago.
> 
> Did this ever proceed?

Yes, as Kevin already pointed out, I've written a working implementation
some time ago. It currently seems to be more stable than the cryptoloop
implementation in the 2.6-test kernels.

You can find my original announcement with some how-to-use details at
http://lwn.net/Articles/42000/ . Don't use that patch, I've got a newer
one one my homepage http://www.saout.de/misc/dm-crypt.diff .

--
Christophe Saout <christophe@saout.de>
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html
