From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm/devfs bug?
Message-ID: <20030410212134.GA20504@percy.comedia.it>
References: <1049829705.2312.16.camel@rich> <20030408204334.GD22951@percy.comedia.it> <1049836943.7411.19.camel@rich> <20030409072130.GD1366@tykepenguin.com> <1049932652.7946.4.camel@rich-laptop> <1049998095.1031.5.camel@rich-laptop>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1049998095.1031.5.camel@rich-laptop>
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
Date: Thu Apr 10 16:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Apr 10, 2003 at 11:08:14AM -0700, rich turner wrote:
>does anyone recognize this as a bug within lvm?

agreed.

there are long standing bugs in the dev scanning code of lvm1,
did you try using the devfs name (even if you don't mount devfs you can
create the device file manually)
you could also add some more info instead of requoting yourself
eg: contents of the damned /proc/partitions
which version of lvm tools are you running
output of lvmdiskscan
lvmdiskscan -d
pvcreate -d
and so on.

L.

P.S.
please don't post to the list, put it somewhere accessible.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
