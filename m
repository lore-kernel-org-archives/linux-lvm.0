From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] /proc/partition problem
Message-ID: <20020816105820.GA992@percy.comedia.it>
References: <20020815084944kaoru@rifu.bsd.tnes.nec.co.jp> <20020816120315.B12990@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020816120315.B12990@sistina.com>
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
Date: Fri Aug 16 05:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Aug 16, 2002 at 12:03:15PM +0200, Heinz J . Mauelshagen wrote:
>
>Well, we had support for correct logical volume names ages ago already.
>Hasn't been accepted by kernel folks :(
>
>We need to live with 'nasty' names in /proc/partitions, sorry.

at least could someone push adding:

        case LVM_MAJOR:
                sprintf(buf, "%s%d", maj, unit);
                return buf;

it would at lest be accettable

btw
it should also be needed for device-mapper

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
