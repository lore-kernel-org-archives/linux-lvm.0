From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Subject: Re: [linux-lvm] cronjob and logcheck
Message-Id: <20020212171313.GA30809@sky.net>
References: <20020212152744.GA30150@sky.net>
    <20020212164212.A3728@sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020212164212.A3728@sistina.com>
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
Date: Tue Feb 12 11:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,
* Heinz J . Mauelshagen <mauelshagen@sistina.com> [020212 16:42]:
> On Tue, Feb 12, 2002 at 04:27:44PM +0100, Ulrich Wiederhold wrote:
> > 2. I use logcheck and these msg are annoying:
> > Feb 12 14:20:01 home /USR/SBIN/CRON[28697]: (root) CMD (/sbin/lvmsadc >
> > /var/log/lvm >/dev/null 2>&1)
> 
> Because the cron entry doesn't create any STDOUT/STDERR anyway,
> that shouldn't happen.

What's the problem? The file exists but has no contents. I don't get
any other errors.

> Why don't you deactivate the cron entry for lvmsadc until you really
> want logical volume io statistics?

That's a way I could do it, but I would like to know what cause this
problem.

Uli

-- 
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
