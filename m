From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Building LVM ona RH7.2 - errors
Message-Id: <20020214072047.GA13317@colombina.comedia.it>
References: <3C69A99A.398C19D4@bellsouth.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C69A99A.398C19D4@bellsouth.net>
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
Date: Thu Feb 14 01:21:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 12, 2002 at 06:47:38PM -0500, Jeff Layton wrote:
>    I tried building lvm-1.0.2 against a clean 2.4.17
> kernel. I untarred the lvm tar.gz file as well as
> the 2.4.17 kernel (into /usr/src/linux-2.4.17.clean).
> Then I did a,
guess redhat changed something with sed

> checking whether time.h and sys/time.h may both be included... yes
> ./configure: [: too many arguments
> checking whether gcc needs -traditional... no
try running
sh -x ./scripts/linuxver -d /usr/src/linux-2.4.17.clean
and see if we can guess what's wrong (probably the sed)
> creating Makefile
> sed: file conftest.s1 line 40: Unterminated `s' command
try salvaging those conftest.s1 files before configure kills them
and see what's in there.

also which version of sed are you runnging (rpm -q sed)
and which version of autoconf, if you have it installed

last thing, try running autoconf in the base lvm source dir and
see if configure works afterwards

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
